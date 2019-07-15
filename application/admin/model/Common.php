<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Db;
use \think\Log;
use \think\View;
use \think\Cache;
use \think\Model;
use \think\Cookie;
use \think\Session;
class Common extends Model
{
	/**
     * 图片上传方法
     * @return [type] [description]
     */
    public function upload($module='admin',$use='admin_default')
    {
        if(Request()->file('file')){
            $file = Request()->file('file');
        }else{
        	exit(json_encode(['code'=>0,'msg'=>'没有上传文件']));
        }
        $module = Request()->post('module') ? Request()->post('module') : $module;//模块
        $use = Request()->post('use') ? Request()->post('use') : $use;
        $info = $file->rule('date')->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . $module . DS . $use);
        if($info) {
            //写入到附件表
            $data = [];
            $data['module'] = $module;
            $data['filename'] = $info->getFilename();//文件名
            $data['filepath'] = DS . 'public' . DS .'uploads' . DS . $module . DS . $use . DS . $info->getSaveName();
            $data['fileext'] = $info->getExtension();//文件后缀
            $data['filesize'] = $info->getSize();//文件大小
            $data['create_time'] = time();//时间
            $data['uploadip'] = Request()->ip();//IP
            $data['use'] = $use;//用处
            $res['id'] = Db::name('sys_attachment')->insertGetId($data);
            $res['src'] = DS . 'public' . DS . 'uploads' . DS . $module . DS . $use . DS . $info->getSaveName();
            $res['code'] = 1;
            $res['suffix'] = $data['fileext'];
            $res['msg'] = "上传成功";
        	exit(json_encode($res));
        } else {
        	exit(json_encode(['code'=>0,'msg'=>'上传失败：'.$file->getError()]));
        }
    }
    /**
     * [loginPublish 登录表单提交]
     * @return [type] [description]
     */
    public function loginPublish()
    {
        $post = Request()->post();
        //验证  唯一规则： 表名，字段名，排除主键值，主键名
        $validate = new \think\Validate([
            ['name', 'require|email', '账号不能为空|账号格式不符'],
            ['password', 'require', '密码不能为空'],
            ['verifyCode','require|captcha','验证码不能为空|验证码不正确'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) 
        {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        if($info = Db::name("sys_admin")->where(['name'=>$post['name'],'password'=>citrixPassword($post['password'])])->find())
        {
            $data['update_time'] = time();
            $data['login_num'] = $info['login_num']+1;
            $data['login_time'] = time();
            $data['login_ip'] = Request()->ip();
            $data['token'] = citrixGetTokenParam(implode(explode('.',$data['login_ip'])));
            if(true == Db::name("sys_admin")->where(['name'=>$post['name'],'password'=>citrixPassword($post['password'])])->update($data))
            {
                Session::set("_Admin",['admin_id'=>$info['id'],'token'=>$data['token']]);
                exit(json_encode(['code'=>1,'msg'=>'操作成功','url'=>url('/admin/index/main')]));
            }
            exit(json_encode(['code'=>0,'msg'=>'提交失败：网络异常']));
        }
        exit(json_encode(['code'=>0,'msg'=>'提交失败：账号或密码错误']));
    }
    /**
     * [registerPublish 找回密码表单提交]
     * @return [type] [description]
     */
    public function registerPublish()
    {
        $post = Request()->post();
        p($post);
    }
    /**
     * 退出
     * @return [type] [description]
     */
    public function logout()
    {
        if(Session::delete('_Admin')) 
        {
            header('Location: '.request()->domain().'/admin/index/main');  
            exit;
        } else {
            header('Location: '.request()->domain().'/admin/common/login');  
            exit;
        }
    }
    /**
     * 清空缓存文件夹
     * @return [type] [description]
     */
    public function clearDelete()
    {
        $this->deldir($this->changePathUrl(ROOT_PATH.'runtime'.DS));
        citrixJumpUrl("删除成功",url('/admin/index/main'),1);
        exit;
    }
    /**
     * [deldir 递归删除目录]
     * @param  [type] $path [description]
     * @return [type]       [description]
     */
    public function deldir($path)
    {
        //如果是目录则继续
        if(is_dir($path)){
            //扫描一个文件夹内的所有文件夹和文件并返回数组
            $p = scandir($path);
            foreach($p as $val)
            {
                //排除目录中的.和..
                if($val !="." && $val !=".."){
                    //如果是目录则递归子目录，继续操作
                    if(is_dir($path.$val)){
                        //子目录中操作删除文件夹和文件
                        $this->deldir($this->changePathUrl($path.$val.DS));
                        //目录清空后删除空文件夹
                        @rmdir($this->changePathUrl($path.$val.DS));
                    }else{
                        //如果是文件直接删除
                        unlink($this->changePathUrl($path.$val));
                    }
                }
            }
        }
    }
    /**
     * [changePathUrl 根据系统转换路径]
     * @param  [type] $path [description]
     * @return [type]       [description]
    */
    public function changePathUrl($path)
    {
        if("WINNT" == PHP_OS)
        {
            return str_replace("\\","/",$path);
        }else
        {
            return str_replace("/","\\",$path);
        }
    }
}