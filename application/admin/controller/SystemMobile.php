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

//系统配置(mobile模块)

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\SystemMobile as M;
class SystemMobile extends Base
{
    /**
     * [index 系统配置]
     * @return [type] [description]
     */
    public function index()
    {
    	$m = new M();
        $this->assign('getInfo',$m->getInfo());
        return $this->fetch();
    }
    /**
   	 * [publish 新增/编辑]
   	 * @return [type] [description]
   	 */
    public function publish()
    {
        $m = new M();
        $m->edit();
        return $this->fetch();
    }
}