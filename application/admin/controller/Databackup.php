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

//数据备份

namespace app\admin\controller;
use \think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\controller\Base;
use app\admin\model\Databackup as M;
class Databackup extends Base
{
    /**
     * [index 数据备份]
     * @return [type] [description]
     */
    public function index()
    {
        $m = new M();
        $this->assign('dataList',$m->dataList());
        return $this->fetch();
    }
    /**
     * [executeBackups 执行备份]
     * @return [type] [description]
     */
    public function executeBackups()
    {
        $m = new M();
        $m->executeBackups();
    }
    /**
     * [originalBackupsList 还原备份(列表)]
     * @return [type] [description]
     */
    public function originalBackupsList()
    {
        $m = new M();
        $this->assign('originalBackupsList',$m->originalBackupsList());
        return $this->fetch();
    }
    /**
     * [originalBackups 还原备份]
     * @return [type] [description]
     */
    public function originalBackups()
    {
        $m = new M();
        $m->originalBackups();
    }
    /**
     * [deleteBackups 删除备份]
     * @return [type] [description]
     */
    public function deleteBackups()
    {
        $m = new M();
        $m->deleteBackups();
    }

}