<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class PermissionMenu extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $dataList =  Db::name("sys_menu")
                    ->order('sort desc')
                    ->select();
        return $this->citrixCateList($dataList);
    }
    /**
     * [add 新增]
     * @return [type] [description]
     */
	public function add()
    {
        $post = Request()->post();
        //验证  唯一规则： 表名，字段名，排除主键值，主键名
        $validate = new \think\Validate([
            ['name', 'require', '名称不能为空'],
            ['description', 'require', '备注不能为空'],
            ['is_display', 'require|in:1,2', '状态为必选项|状态为必选项'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        $data['pid'] = $post['pid'];
        $data['name'] = $post['name'];
        $data['module'] = preg_replace('# #','',lcfirst(lcfirst($post['module'])));
        $data['controller'] = preg_replace('# #','',lcfirst(lcfirst($post['controller'])));
        $data['function'] = preg_replace('# #','',lcfirst(lcfirst($post['function'])));
        $data['description'] = $post['description'];
        $data['icon'] = empty($post['icon'])?null:$post['icon'];
        $data['is_display'] = $post['is_display'];
        $data['type'] = 1;
        $data['is_open'] = empty($post['is_open'])?0:1;
        $data['create_time'] = time();
        if(true == Db::name("sys_menu")->insert($data))
        {
            exit(json_encode(['code'=>1,'msg'=>'操作成功']));
        } 
        exit(json_encode(['code'=>0,'msg'=>'操作失败']));
    }
    /**
     * [edit 编辑]
     * @return [type] [description]
     */
    public function edit()
    {
        $post = Request()->post();
        //验证  唯一规则： 表名，字段名，排除主键值，主键名
        $validate = new \think\Validate([
            ['name', 'require', '名称不能为空'],
            ['description', 'require', '备注不能为空'],
            ['is_display', 'require|in:1,2', '状态为必选项|状态为必选项'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        $data['pid'] = $post['pid'];
        $data['name'] = $post['name'];
        $data['module'] = preg_replace('# #','',lcfirst(lcfirst($post['module'])));
        $data['controller'] = preg_replace('# #','',lcfirst(lcfirst($post['controller'])));
        $data['function'] = preg_replace('# #','',lcfirst(lcfirst($post['function'])));
        $data['description'] = $post['description'];
        $data['icon'] = empty($post['icon'])?null:$post['icon'];
        $data['is_display'] = $post['is_display'];
        $data['type'] = 1;
        $data['is_open'] = empty($post['is_open'])?0:1;
        $data['update_time'] = time();
        if(true == Db::name("sys_menu")->where(['id'=>$post['id']])->update($data))
        {
            exit(json_encode(['code'=>1,'msg'=>'操作成功']));
        } 
        exit(json_encode(['code'=>0,'msg'=>'操作失败']));
    }
    /**
     * [getInfo 获取单条数据]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function getInfo($id)
    {
        $dataInfo = Db::name("sys_menu")->where(['id'=>$id])->find();
        return $dataInfo;
    }
    /**
     * [infoDelete 删除]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function infoDelete($id)
    {
        if(false == Db::name("sys_menu")->where(['pid'=>$id])->where("id != 70")->find())
        {
            if(true == Db::name("sys_menu")->where(['id'=>$id])->where("id != 70")->delete())
            {
                exit(json_encode(['code'=>1,'msg'=>'删除成功']));
            }
            exit(json_encode(['code'=>0,'msg'=>'删除失败']));
        }
        exit(json_encode(['code'=>0,'msg'=>'请先删除下级分类']));
    }
    /**
     * [changeTableVal 快捷编辑]
     * @return [type] [description]
     */
    public function changeTableVal()
    {
        $table = "sys_menu";//input('table'); // 表名
        $id_name = input('id_name'); // 表主键id名
        $id_value = input('id_value'); // 表主键id值
        $field  = input('field'); // 修改哪个字段
        $value  = input('value'); // 修改字段值  
        // 根据条件保存修改的数据
        if(true == Db::name($table)->where([$id_name=>$id_value])->update([$field=>$value]))
        {
            exit(json_encode(['code'=>1,'msg'=>'操作成功']));
        }
        exit(json_encode(['code'=>0,'msg'=>'操作失败']));
    }
    /**
     * [citrixCateList 归属(树形结构)]
     * @param  [type]  $cate  [description]
     * @param  integer $id    [description]
     * @param  integer $level [description]
     * @return [type]         [description]
     */
    public function citrixCateList($cate,$id=0,$level=0){
        static $cates = array();
        foreach ($cate as $value) {
            if ($value['pid']==$id) {
                $value['level'] = $level+1;
                if($level == 0)
                {
                    $value['str'] = str_repeat('',$value['level']);
                }
                elseif($level == 2)
                {
                    $value['str'] = '&emsp;&emsp;&emsp;&emsp;'.'└ ';
                }
                else
                {
                    $value['str'] = '&emsp;&emsp;'.'└ ';
                }
                $cates[] = $value;
                $this->citrixCateList($cate,$value['id'],$value['level']);
            }
        }
        return $cates;
    }
}