<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class Databackup extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $sql = 'show tables';
        $surfaceList = Db::query($sql);
        $dataList = [];
        $database = config("database.database");
        foreach ($surfaceList as $k1 => $v1) 
        {
            $surfaceInfo = Db::query("select * from information_schema.TABLES where information_schema.TABLES.TABLE_SCHEMA = '".$database."' and information_schema.TABLES.TABLE_NAME = '".$surfaceList[$k1]['Tables_in_'.$database]."'");
            $data['surfaceInfo'] = $surfaceInfo['0'];//表详情
            $data['surfaceInfo']['TABLE_COUNT'] = Db::table($surfaceList[$k1]['Tables_in_'.$database])->count();
            $dataList[] = $data;
        }
        return $dataList;
    }
    /**
     * [executeBackups 执行备份]
     * @return [type] [description]
     */
    public function executeBackups()
    {
        $path_url = ROOT_PATH."Data";
        $path_name = date('YmdHis').'-'.rand(000000,999999);
        $file_suffix = '.sql';
        $file_name = $path_url.DS.$path_name.$file_suffix;
        $hostname = config("database.hostname");//连接主机
        $username = config("database.username");//用户名
        $password = config("database.password");//连接密码
        $database = config("database.database");//要备份的数据库
        //遍历文件夹
        if($ergodicBackups = $this->ergodicBackups($path_url))
        {
            //删除文件
            foreach ($ergodicBackups as $k1 => $v1) 
            {
                if(stripos($ergodicBackups[$k1],".sql"))
                {
                    if(false == $this->deleteFile($ergodicBackups[$k1]))
                    {
                        exit(json_encode(['code'=>1,'msg'=>'文件读取清空失败！请手动清空']));
                    }
                }
            }
        }
        $this->backupMySqlData($hostname,$username,$password,$database,$file_name);
    }
    /**
     * [originalBackupsList 还原备份(列表)]
     * @return [type] [description]
     */
    public function originalBackupsList()
    {
        $path_url = ROOT_PATH."Data";
        if($dataList = $this->ergodicBackups($path_url))
        {
            $backupsList = [];
            foreach ($dataList as $k1 => $v1) 
            {
                $data['name'] = substr($dataList[$k1],strripos($dataList[$k1],"\\")+1);
                $data['path_name'] = substr($data['name'],0,strrpos($data['name'],"."));;
                $data['suffix'] = substr($data['name'],strripos($data['name'],".")+1);
                $data['size'] = number_format(filesize($dataList[$k1])/1024/1024,2).'MB';
                $data['time'] = filemtime($dataList[$k1]);
                $data['path_url'] = $dataList[$k1];
                $backupsList[] = $data;
            }
            return $backupsList;
        }
    }
    /**
     * [originalBackups 还原备份]
     * @return [type] [description]
     */
    public function originalBackups()
    {
        $path_name = input('id/s',0);
        $path_url = ROOT_PATH."Data".DS.$path_name;
        if(stripos($path_url,".gz"))
        {
            $hostname = config("database.hostname");//连接主机
            $username = config("database.username");//用户名
            $password = config("database.password");//连接密码
            $database = config("database.database");//数据库
            $sql = $this->read_gz($path_url);
            $con = mysqli_connect($hostname,$username,$password,$database);
            if (mysqli_connect_errno($con)) 
            { 
                exit(json_encode(['code'=>0,'msg'=>"连接MySQL失败:".mysqli_connect_error()]));
            } 
            mysqli_select_db($con,$database)or exit(json_encode(['code'=>0,'msg'=>"无法连接到数据库"]));

            $sql_array = preg_split("/;\r\n########################www.tpCitrix.com语句#########################/", $sql);
            $sql_count = count($sql_array);
            $success_sum = 0;//成功执行
            $error_sum = 0;//失败执行
            foreach ($sql_array as $k => $v) 
            {
                if(true == @mysqli_query($con,$v))
                {
                    $success_sum = $success_sum+1;
                }else
                {
                    $error_sum = $error_sum+1;
                }
            }
            mysqli_close($con);
            exit(json_encode(['code'=>1,'msg'=>"共{$sql_count}条,执行成功{$success_sum}条,执行失败{$error_sum}条"]));
        }
        exit(json_encode(['code'=>0,'msg'=>'格式不正确']));
    }
    /**
     * [deleteBackups 删除备份]
     * @return [type] [description]
     */
    public function deleteBackups()
    {
        $path_name = input('id/s',0);
        $path_url = ROOT_PATH."Data".DS.$path_name;
        if(true == $this->deleteFile($path_url))
        {
            exit(json_encode(['code'=>1,'msg'=>'删除成功']));
        }
        exit(json_encode(['code'=>0,'msg'=>'删除失败']));
    }
    /**
     * [ergodic 遍历文件夹文件出来]
     * @param  [type] $path_url [文件夹路径(里面不能在包含文件夹)]
     * @return [type]       [description]
     */
    public  function ergodicBackups($path_url)
    {
        $result = array();
        //1、首先先读取文件夹
        $temp = scandir($path_url);
        //遍历文件夹
        foreach($temp as $v)
        {
            $a = $path_url.DS.$v;
            if(is_dir($a))
            {
                //如果是文件夹则执行
                if($v=='.' || $v=='..')
                {
                    //判断是否为系统隐藏的文件.和..  如果是则跳过否则就继续往下走，防止无限循环再这里。
                    continue;
                }
                $result[] = $a;
            }else
            {
                $result[] = $a;
            }
        }
        return $result;
    }
    /**
     * [deleteFile 删除文件]
     * @param  [type] $path_url [文件路径]
     * @return [type]               [description]
     */
    public function deleteFile($path_url)
    {
        if(true == file_exists($path_url))
        {
            if(true == unlink($path_url))
            {
                return true;
            }
            return true;
        }
        return false;
    }
    /**
    *  @name php备份数据库 
    *  @param string  $DbHost    连接主机
    *  @param string  $DbUser    用户名
    *  @param string  $DbPwd     连接密码
    *  @param string  $DbName    要备份的数据库
    *  @param string  $saveFileName 要保存的文件名, 默认文件保存在当前文件夹中,以日期作区分
    *  @return Null
    *  @example backupMySqlData('localhost', 'root', '123456', 'YourDbName');
    */
    function backupMySqlData($DbHost, $DbUser, $DbPwd, $DbName, $saveFileName = '')
    {
        header("Content-type:text/html;charset=utf-8");
        error_reporting(0);
        set_time_limit(0);
        $link = mysql_connect($DbHost, $DbUser, $DbPwd) or exit(json_encode(['code'=>0,'msg'=>'数据库连接失败: ' . mysql_error()]));
        mysql_select_db($DbName) or exit(json_encode(['code'=>0,'msg'=>'数据库连接失败: ' . mysql_error()]));
        mysql_query('set names utf8');
        // 声明变量
        $isDropInfo   = '';
        $insertSQL   = '';
        $row      = array();
        $tables     = array();
        $tableStructure = array();
        $fileName    =  empty($saveFileName)?date('YmdHis').'.sql':$saveFileName;
        // 枚举该数据库所有的表
        $res = mysql_query("SHOW TABLES FROM $DbName");
        while ($row = mysql_fetch_row($res)) 
        {
            $tables[] = $row[0];
        }
        mysql_free_result($res);
        // 枚举所有表的创建语句
        foreach ($tables as $val) 
        {
              $res = mysql_query("show create table $val", $link);
              $row = mysql_fetch_row($res);
              $isDropInfo   = "DROP TABLE IF EXISTS `" . $val . "`;\r\n########################www.tpCitrix.com语句#########################";
              $tableStructure = $isDropInfo . $row[1] . ";\r\n########################www.tpCitrix.com语句#########################";
              file_put_contents($fileName, $tableStructure, FILE_APPEND);
              mysql_free_result($res);
        }
        //枚举所有表的INSERT语句
        foreach ($tables as $val) 
        {
            $res = mysql_query("select * from $val");
            // 没有数据的表不执行insert
            while ($row = mysql_fetch_row($res)) {
                $sqlStr = "INSERT INTO `".$val."` VALUES (";
                foreach($row as $v){
                  $sqlStr .= "'$v',";
                }
                //去掉最后一个逗号
                $sqlStr = substr($sqlStr, 0, strlen($sqlStr) - 1);
                $sqlStr .= ");\r\n########################www.tpCitrix.com语句#########################";
                file_put_contents($fileName, $sqlStr, FILE_APPEND);
            }
            mysql_free_result($res);
        }
        $path_prefix_url = substr($saveFileName,0,strrpos($saveFileName,"\\"));
        $path_suffix_url = substr($saveFileName,strripos($saveFileName,"\\")+1);
        $path_name = substr($path_suffix_url,0,strrpos($path_suffix_url,"."));
        $gz_name = $path_prefix_url.DS.$path_name.'.gz';
        if(true == $this->gz_file($saveFileName,$gz_name))
        {
            if(true == unlink($saveFileName))
            {
                exit(json_encode(['code'=>1,'msg'=>'备份成功']));
            }
        }
        exit(json_encode(['code'=>0,'msg'=>'备份失败']));
    }
    /**
     * [gz_file 将文件添加至GZ文件]
     * @param  [type] $file    [原文件路径+文件名]
     * @param  [type] $gz_name [新文件路径+文件名]
     * @return [type]          [description]
     */
    public function gz_file($file,$gz_name){
        $fp = gzopen ($gz_name, 'w9');
        gzwrite ($fp, file_get_contents($file));
        gzclose($fp); 
        return true;   
    }
    /**
     * [read_gz 读取GZ文件]
     * @param  [type] $gz_file [description]
     * @return [type]          [description]
     */
    public function read_gz($gz_file){
        $buffer_size = 4096; // read 4kb at a time
        $file = gzopen($gz_file, 'rb');
        $str='';
        while(!gzeof($file)) {
            $str.=gzread($file, $buffer_size);
        }
        gzclose($file);
        return $str;
    }
    /**
     * [unzip_gz 解压GZ文件]
     * @param  [type] $gz_file [description]
     * @return [type]          [description]
     */
    public function unzip_gz($gz_file){
        $buffer_size = 4096; // read 4kb at a time
        $out_file_name = str_replace('.gz', '', $gz_file);
        $file = gzopen($gz_file, 'rb');
        $out_file = fopen($out_file_name, 'wb');
        $str='';
        while(!gzeof($file)) {
            fwrite($out_file, gzread($file, $buffer_size));
        }
        fclose($out_file);
        gzclose($file);
    }
}