<?php 
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------
namespace app\admin\model;
use \think\Db;
use \think\View;
use \think\Model;
use \think\Cookie;
use \think\Session;
class Base extends Model
{
	/**
     * [__construct description]
     * @return [type] [description]
     */
    public function __construct()
    {
        parent::__construct();
        $this->_Admin = Session::get("_Admin");
        $this->_getAdminInfo = $this->getAdminInfo();
        if(empty($this->_getAdminInfo))
        {
        	header('Location: '.request()->domain().'/admin/common/login');
        	exit;
        }
        $this->_getWebPathUrl = $this->getWebPathUrl();
        $this->_getAdminCate = $this->getAdminCate();
        $this->checkAdminPathUrlPermission();
    }
	/**
	 * [getAdminInfo 获得管理员资料]
	 * @return [type] [description]
	 */
	public function getAdminInfo()
	{
		//检查是否登录
        if(!Session::has('_Admin')) 
        {
            return false;
        }
        if($getAdminInfo = Db::name("sys_admin")->where(['id'=>$this->_Admin['admin_id']])->find())
        {
        	$loginIp = citrixGetTokenParam(implode(explode('.',Request()->ip())));
        	if(citrixPassword($getAdminInfo['token']) != citrixPassword($loginIp))
        	{
        		return false;
        	}
        	return $getAdminInfo;
        }
        return false;
	}
	/**
	 * [getAdminCate 获取权限角色]
	 * @return [type] [description]
	 */
	public function getAdminCate()
	{
		$getAdminCate = Db::name("sys_admin_cate")->where(['id'=>$this->_getAdminInfo['admin_menu_id']])->find();
		$getAdminCate['menu'] = empty($getAdminCate['menu'])?null:json_decode($getAdminCate['menu'],true);
		return $getAdminCate;
	}
	/**
	 * [getWebPathUrl 获取当前路径]
	 * @return [type] [description]
	 */
	public function getWebPathUrl()
	{
        $where['module'] = preg_replace('# #','',lcfirst(Request()->module()));
        $where['controller'] = preg_replace('# #','',lcfirst(Request()->controller()));
        $where['function'] = preg_replace('# #','',lcfirst(Request()->action()));
        return $where;
	}
	/**
	 * [checkAdminPathUrlPermission 检查当前路径是否有权限]
	 * @return [type] [description]
	 */
	public function checkAdminPathUrlPermission()
	{
		if($path_url = Db::name("sys_menu")->where(['module'=>$this->_getWebPathUrl['module'],'controller'=>$this->_getWebPathUrl['controller'],'function'=>$this->_getWebPathUrl['function']])->find())
		{
			if(!in_array($path_url['id'],$this->_getAdminCate['menu']))
			{
				if(Request()->isAjax())
				{
					exit(json_encode(['code'=>0,'msg'=>'无权限']));
				}else
				{
					citrixJumpUrl("无权限",url('/admin/common/login'),2);
					exit;
				}
			}
		}else
		{
			if(Request()->isAjax())
			{
				exit(json_encode(['code'=>0,'msg'=>'无权限']));
			}else
			{
				citrixJumpUrl("无权限",url('/admin/common/login'),2);
				exit;
			}
		}
	}
	 /**
     * [baseLeftList 左侧菜单]
     * @return [type] [description]
     */
    public function baseLeftList()
    {
        $baseLeftList =  Db::name("sys_menu")->where(['is_display'=>1])->order('sort desc')->select();
        //添加url
        foreach ($baseLeftList as $k1 => $v1) {
            if(empty($v1['pid'])) 
            {
                $url = null;
            } else {
                $url = url($v1['module'].'/'.$v1['controller'].'/'.$v1['function']);
            }
            $baseLeftList[$k1]['url'] = $url;
            if(!in_array($baseLeftList[$k1]['id'],$this->_getAdminCate['menu']))
            {
            	unset($baseLeftList[$k1]);
            }
        }
        return $baseLeftList;
    }
    /**
	 * [citrixCateList 归属(树形结构)]
	 * @param  [type]  $cate  [description]
	 * @param  integer $id    [description]
	 * @param  integer $level [description]
	 * @return [type]         [description]
	 */
	public function citrixCateList($cate,$id=0,$level=0){
	    static $cates = array();
	    foreach ($cate as $value) {
	        if ($value['pid']==$id) {
	            $value['level'] = $level+1;
	            if($level == 0)
	            {
	                $value['str'] = str_repeat('',$value['level']);
	            }
	            elseif($level == 2)
	            {
	                $value['str'] = '&emsp;&emsp;&emsp;&emsp;'.'└ ';
	            }
	            else
	            {
	                $value['str'] = '&emsp;&emsp;'.'└ ';
	            }
	            $cates[] = $value;
	            $this->citrixCateList($cate,$value['id'],$value['level']);
	        }
	    }
	    return $cates;
	}
	
}