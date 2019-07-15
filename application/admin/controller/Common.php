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

// index模块共用文件
namespace app\admin\controller;
use think\Db;
use \think\Cookie;
use \think\Session;
use \think\Controller;
use app\admin\model\Common as M;
class Common extends Controller
{
	/**
	 * [upload 图片上传方法]
	 * @return [type] [description]
	 */
	public function upload()
	{
		$m = new M();
		$m->upload(input('use/s'));
	}
	/**
	 * [login 登录]
	 * @return [type] [description]
	 */
	public function login()
	{
        return $this->fetch();
	}
	/**
	 * [loginPublish 登录表单提交]
	 * @return [type] [description]
	 */
	public function loginPublish()
	{
		$m = new M();
		$m->loginPublish();
	}
	/**
	 * [register 找回密码]
	 * @return [type] [description]
	 */
	public function register()
	{
        return $this->fetch();
	}
	/**
	 * [registerPublish 找回密码表单提交]
	 * @return [type] [description]
	 */
	public function registerPublish()
	{
		$m = new M();
		$m->registerPublish();
	}
	/**
     * 退出
     * @return [type] [description]
     */
    public function logout()
    {
    	$m = new M();
		$m->logout();
    }
	/**
     * 清空缓存
     * @return [type] [description]
     */
    public function clearDelete()
    {
    	$m = new M();
		$m->clearDelete();
    }

}