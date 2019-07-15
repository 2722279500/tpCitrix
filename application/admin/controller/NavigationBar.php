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

//导航

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\NavigationBar as M;
class NavigationBar extends Base
{
    /**
     * [index 导航]
     * @return [type] [description]
     */
    public function index()
    {
        $m = new M();
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
        $id = Request()->has('id') ? Request()->param('id', 0, 'intval') : 0;
        $pid = Request()->has('pid') ? Request()->param('pid', 0, 'intval') : 0;
        Request()->isAjax()?($id <= 0?$m->add():$m->edit()):$this->assign('getInfo',$m->getInfo($id));
        $this->assign('pid',$pid);
        $this->assign('dataList',$m->dataList());
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