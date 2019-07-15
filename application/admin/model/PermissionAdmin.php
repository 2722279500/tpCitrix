<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class PermissionAdmin extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $dataList =  Db::name("sys_admin")
                    ->order('id desc')
                    ->select();
        return $dataList;
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
            ['admin_menu_id', 'require', '分组不能为空'],
            ['name', 'require|email', '用户名不能为空|用户名格式只能是邮箱'],
            ['password', 'require', '密码不能为空'],
            ['password_confirm', 'require', '重复密码不能为空'],
            ['nickname', 'require', '昵称不能为空'],
            ['thumb', 'require', '头像不能为空'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        if(citrixPassword($post['password']) != citrixPassword($post['password_confirm']))
        {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：两次密码不一致']));
        }
        if(true == Db::name("sys_admin")->where(['name'=>$post['name']])->count())
        {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：用户名已存在']));
        }
        $data['admin_menu_id'] = $post['admin_menu_id'];
        $data['name'] = $post['name'];
        $data['password'] = citrixPassword($post['password']);
        $data['thumb'] = $post['thumb'];
        $data['nickname'] = $post['nickname'];
        $data['create_time'] = time();
        if(true == Db::name("sys_admin")->insert($data))
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
            ['admin_menu_id', 'require', '分组不能为空'],
            ['name', 'require|email', '用户名不能为空|用户名格式只能是邮箱'],
            ['nickname', 'require', '昵称不能为空'],
            ['thumb', 'require', '头像不能为空'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        if(true == Db::name("sys_admin")->where(['name'=>$post['name']])->where("id != {$post['id']}")->count())
        {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：用户名已存在']));
        }
        if(!empty($post['password']) || !empty($post['password_confirm']))
        {
            if(citrixPassword($post['password']) != citrixPassword($post['password_confirm']))
            {
                exit(json_encode(['code'=>0,'msg'=>'提交失败：两次密码不一致']));
            } 
            $data['password'] = citrixPassword($post['password']);
        }
        $data['admin_menu_id'] = $post['admin_menu_id'];
        $data['name'] = $post['name'];
        $data['thumb'] = $post['thumb'];
        $data['nickname'] = $post['nickname'];
        $data['update_time'] = time();
        if(true == Db::name("sys_admin")->where(['id'=>$post['id']])->update($data))
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
        $dataInfo = Db::name("sys_admin")->where(['id'=>$id])->find();
        return $dataInfo;
    }
    /**
     * [infoDelete 删除]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function infoDelete($id)
    {
        if(true == Db::name("sys_admin")->where(['id'=>$id])->delete())
        {
            exit(json_encode(['code'=>1,'msg'=>'删除成功']));
        }
        exit(json_encode(['code'=>0,'msg'=>'删除失败']));
    }
}