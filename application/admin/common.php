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

/**
 * [getAdminMenuName 获取权限组,title]
 * @param  [type] $admin_menu_id [description]
 * @return [type]                [description]
 */
function getAdminMenuName($admin_menu_id = 0)
{
	return \think\Db::name("sys_admin_cate")->where(['id'=>$admin_menu_id])->value("name");
}


?>