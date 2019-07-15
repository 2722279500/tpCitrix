<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class Fragment extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $fragmentModel = Db::name('sys_fragment');
        $dataList = $fragmentModel->field('id,fragment_name,thumb,pid')->order('id desc')->where(['pid'=>0])->select();//一级
        $where['pid'] = ['neq', 0];
        $parent_notempty = $fragmentModel->field('id,fragment_name,thumb,pid')->order('id desc')->where($where)->select();//二级
        //如果都不是空,组合成二维数组
        if(!empty($dataList) || !empty($parent_notempty))
        {
            //合并[二级,归分一级下]
            foreach ($dataList as $e_k => $e_val) 
            {
                foreach ($parent_notempty as $n_k => $n_val) 
                {
                    if($dataList[$e_k]['id'] == $parent_notempty[$n_k]['pid'])
                    {
                        $dataList[$e_k]['all'][] = $parent_notempty[$n_k];
                    }
                }
            }
        }else
        {
            $dataList = array_merge($dataList,$parent_notempty);
        }
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
            ['fragment_name', 'require', '碎片名称不能为空'],
            ['mark', 'require', '唯一标记不能为空'],
        ]);
        //验证部分数据合法性
        if(!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        if(!preg_match("/^[a-zA-Z0-9_]+$/", $post['mark']))
        {
            exit(json_encode(['code'=>0,'msg'=>'唯一标记,非法']));
        }
        if(true == Db::name("sys_fragment")->where('mark',$post['mark'])->count())
        {
            exit(json_encode(['code'=>0,'msg'=>'唯一标记已存在']));
        }
        $data['fragment_name'] = $post['fragment_name'];
        $data['mark'] = $post['mark'];
        $data['link'] = empty($post['link'])?"##":$post['link'];
        $data['thumb'] = empty($post['thumb'])?null:$post['thumb'];
        $data['content'] = empty($post['content'])?null:$post['content'];
        $data['pid'] = empty($post['pid'])?0:$post['pid'];
        $data['create_time'] = time();
        if(true == Db::name("sys_fragment")->insert($data))
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
            ['fragment_name', 'require', '碎片名称不能为空'],
            ['mark', 'require', '唯一标记不能为空'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        if(!preg_match("/^[a-zA-Z0-9_]+$/", $post['mark']))
        {
            exit(json_encode(['code'=>0,'msg'=>'唯一标记,非法']));
        }
        if(true == Db::name("sys_fragment")->where('mark',$post['mark'])->where('id != '.$post["id"])->count())
        {
            exit(json_encode(['code'=>0,'msg'=>'唯一标记已存在']));
        }
        if($post['pid'] == $post['id'])
        {
            exit(json_encode(['code'=>0,'msg'=>'分组不能添加自己']));
        }
        $data['fragment_name'] = $post['fragment_name'];
        $data['mark'] = $post['mark'];
        $data['link'] = empty($post['link'])?"##":$post['link'];
        $data['thumb'] = empty($post['thumb'])?null:$post['thumb'];
        $data['content'] = empty($post['content'])?null:$post['content'];
        $data['pid'] = empty($post['pid'])?0:$post['pid'];
        $data['update_time'] = time();
        if(true == Db::name("sys_fragment")->where(['id'=>$post['id']])->update($data))
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
        $dataInfo = Db::name("sys_fragment")->where(['id'=>$id])->find();
        return $dataInfo;
    }
    /**
     * [infoDelete 删除]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function infoDelete($id)
    {
        if($info = Db::name("sys_fragment")->where(['pid'=>$id])->find())
        {
            exit(json_encode(['code'=>0,'msg'=>'请先删除子列表']));
        }
        if(true == Db::name("sys_fragment")->where(['id'=>$id])->delete())
        {
            exit(json_encode(['code'=>1,'msg'=>'删除成功']));
        }
        exit(json_encode(['code'=>0,'msg'=>'删除失败']));
    }
}