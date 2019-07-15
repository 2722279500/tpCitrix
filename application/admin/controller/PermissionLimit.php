<?php
// +----------------------------------------------------------------------
// | tpCitrix [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tpCitrix.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------

//权限组

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\PermissionMenu as S;
use app\admin\model\PermissionLimit as M;
class PermissionLimit extends Base
{
    /**
     * [index 权限组]
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
        $s = new S();
        $id = Request()->has('id') ? Request()->param('id', 0, 'intval') : 0;
        Request()->isAjax()?($id <= 0?$m->add():$m->edit()):$this->assign('LimitDataList',citrixMenulist($s->dataList()));
        $getInfo = $m->getInfo($id);
        $getInfo['menu'] = json_decode($getInfo['menu'],true);
        $this->assign('getInfo',$getInfo);
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
}
