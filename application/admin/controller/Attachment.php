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

//附件管理

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\Attachment as M;
class Attachment extends Base
{
    /**
     * [index 附件管理]
     * @return [type] [description]
     */
    public function index()
    {
        $m = new M();
        $this->assign('use',input("use/s",null));
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
}

