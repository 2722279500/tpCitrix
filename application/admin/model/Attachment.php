<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class Attachment extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $get = Request()->get();
        $where = [];
        if(!empty($get['use']))
        {
            $where['use'] = ["like","%{$get['use']}%"];
        }
        $dataList =  Db::name("sys_attachment")
                    ->where($where)
                    ->order('id desc')
                    ->paginate(20,false,['query'=>Request()->param()]);
        return $dataList;
    }
    /**
     * [infoDelete 删除]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function infoDelete($id)
    {
        if($info = Db::name('sys_attachment')->where(['id'=>$id])->find())
        {
            if(file_exists(ROOT_PATH.$info['filepath']))
            {
                if(unlink(ROOT_PATH.$info['filepath']))
                {
                    if(true == Db::name("sys_attachment")->where(['id'=>$id])->delete())
                    {
                        exit(json_encode(['code'=>1,'msg'=>'删除成功']));
                    }
                }
            }else
            {
                if(true == Db::name("sys_attachment")->where(['id'=>$id])->delete())
                {
                    exit(json_encode(['code'=>1,'msg'=>'删除成功']));
                }
            } 
        }
        exit(json_encode(['code'=>0,'msg'=>'删除失败']));
    }
    /**
     * [batchDelete 批量删除]
     * @return [type] [description]
     */
    public function batchDelete($delArray)
    {
        if(empty($delArray))
        {
            exit(json_encode(['code'=>0,'msg'=>'删除失败']));
        }
        $delArray = array_filter(array_unique(explode(',',$delArray)));
        foreach ($delArray as $k1 => $v1) 
        {
            if($info = Db::name('sys_attachment')->where(['id'=>$delArray[$k1]])->find())
            {
                if(file_exists(ROOT_PATH.$info['filepath']))
                {
                    if(unlink(ROOT_PATH.$info['filepath']))
                    {
                        Db::name("sys_attachment")->where(['id'=>$delArray[$k1]])->delete();
                    }
                }else
                {
                    Db::name("sys_attachment")->where(['id'=>$delArray[$k1]])->delete();
                }
            }
        }
        exit(json_encode(['code'=>1,'msg'=>'删除成功']));
    }
}