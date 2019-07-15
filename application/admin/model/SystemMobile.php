<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class SystemMobile extends Model
{
    /**
     * [getInfo 获取单条数据]
     * @return [type] [description]
     */
    public function getInfo()
    {
        $dataList = Db::name('sys_config')->where(['type'=>'mobile'])->select();
        foreach ($dataList as $key => $value) {
            $getInfo[$dataList[$key]['name']] = array (
                "value" => $dataList[$key]['value'],
                "description" => $dataList[$key]['description'],
                "id" => $dataList[$key]['id']
            );
        }
        return $getInfo;
    }
    /**
     * [edit 编辑]
     * @return [type] [description]
     */
    public function edit()
    {
        $post = Request()->post();
        $post['log_status'] = empty($post['log_status'])?0:1;
        $model = Db::name('sys_config');
        foreach ($post as $k1 => $v1) 
        {
            $model->where(['type'=>'mobile','name'=>$k1])->update(["value"=>$v1]);
        }
        exit(json_encode(['code'=>1,'msg'=>'操作成功']));
    }
}