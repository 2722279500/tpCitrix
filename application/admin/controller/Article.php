<?php
// +----------------------------------------------------------------------
// | tpCitrix [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2019 http://tpCitrix.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------

//文章列表

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\Article as M;
use app\admin\model\ArticleCate as S;
class Article extends Base
{
    /**
     * [index 文章列表]
     * @return [type] [description]
     */
    public function index()
    {
        $m = new M();
        $s = new S();
        $this->assign('article_cate_id',input("article_cate_id/d",0));
        $this->assign('title',input("title/s",null));
        $this->assign('dataCateList',$s->dataList());
        $this->assign('dataList',$m->dataList());
        return $this->fetch();
    }
    /**
   	 * [publish 新增/编辑]
   	 * @return [type] [description]
   	 */
    public function publish()
    {
        $m = new M();
        $s = new S();
        $id = Request()->has('id') ? Request()->param('id', 0, 'intval') : 0;
        Request()->isAjax()?($id <= 0?$m->add():$m->edit()):$this->assign('getInfo',$m->getInfo($id));
        $this->assign('dataCateList',$s->dataList());
        return $this->fetch();
    }
    /**
     * [infoDelete 删除]
     * @return [type] [description]
     */
    public function infoDelete()
    {
        $m = new M();
        $id = Request()->has('id') ? Request()->param('id', 0, 'intval') : 0;
        $m->infoDelete($id);
    }
    /**
     * [batchDelete 批量删除]
     * @return [type] [description]
     */
    public function batchDelete()
    {
        $m = new M();
        $delArray = input("delArray/s");
        $m->batchDelete($delArray);
    }
    /**
     * [changeTableVal 快捷编辑]
     * @return [type] [description]
     */
    public function changeTableVal()
    {
        $m = new M();
        $m->changeTableVal();
    }
}