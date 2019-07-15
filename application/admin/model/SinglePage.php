<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Model;
use \think\Db;
use \think\View;
class SinglePage extends Model
{
    /**
     * [dataList 列表]
     * @return [type] [description]
     */
    public function dataList()
    {
        $dataList =  Db::name("sys_page")
                    ->order('status asc,sort desc,id desc')
                    ->paginate(20,false,['query'=>Request()->param()]);
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
            ['title', 'require', '标题不能为空'],
            ['keyword', 'require', '关键词不能为空'],
            ['description', 'require', '描述不能为空'],
            ['content', 'require', '内容不能为空'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        $data['title'] = $post['title'];
        $data['keyword'] = $post['keyword'];
        $data['description'] = $post['description'];
        $data['content'] = $post['content'];
        $data['thumb'] = empty($post['thumb'])?0:$post['thumb'];
        $data['create_time'] = time();
        if(true == Db::name("sys_page")->insert($data))
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
            ['title', 'require', '标题不能为空'],
            ['keyword', 'require', '关键词不能为空'],
            ['description', 'require', '描述不能为空'],
            ['content', 'require', '内容不能为空'],
        ]);
        //验证部分数据合法性
        if (!$validate->check($post)) {
            exit(json_encode(['code'=>0,'msg'=>'提交失败：' . $validate->getError()]));
        }
        $data['title'] = $post['title'];
        $data['keyword'] = $post['keyword'];
        $data['description'] = $post['description'];
        $data['content'] = $post['content'];
        $data['thumb'] = empty($post['thumb'])?0:$post['thumb'];
        $data['update_time'] = time();
        if(true == Db::name("sys_page")->where(['id'=>$post['id']])->update($data))
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
        $dataInfo = Db::name("sys_page")->where(['id'=>$id])->find();
        return $dataInfo;
    }
    /**
     * [infoDelete 删除]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function infoDelete($id)
    {
        if(true == Db::name("sys_page")->where(['id'=>$id])->delete())
        {
            exit(json_encode(['code'=>1,'msg'=>'删除成功']));
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
            Db::name("sys_page")->where(['id'=>$delArray[$k1]])->delete();
        }
        exit(json_encode(['code'=>1,'msg'=>'删除成功']));
    }
    /**
     * [changeTableVal 快捷编辑]
     * @return [type] [description]
     */
    public function changeTableVal()
    {
        $table = "sys_page";//input('table'); // 表名
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
}