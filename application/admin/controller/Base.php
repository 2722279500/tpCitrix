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

//权限控制

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\model\Base as M;
class Base extends Controller
{
    /**
     * [__construct description]
     * @return [type] [description]
     */
    public function __construct()
    {
        parent::__construct();
        $this->baseLeftList();
        $this->getAdminInfo();
    }
    /**
     * [baseLeftList 左侧菜单]
     * @return [type] [description]
     */
    public function baseLeftList()
    {
        $m = new M();   
        $baseLeftList = $m->baseLeftList();
        $this->assign('baseLeftList',citrixMenulist($m->citrixCateList($baseLeftList)));
    }
    /**
     * [getAdminInfo 管理员资料]
     * @return [type] [description]
     */
    public function getAdminInfo()
    {
        $m = new M();   
        $this->assign('getAdminInfo',$m->getAdminInfo());
    }
}
