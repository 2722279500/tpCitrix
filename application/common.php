<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * [p 打印调试]
 * @param  [type] $a [description]
 * @return [type]    [description]
 */
function p($a)
{
	if(!empty($a))
	{
		echo "<pre>";
		print_r($a);
		echo "<pre>";
	}else
	{
		var_dump($a);
	}
}
/**
 * [citrixMenulist 爷爷，儿子，孙子]
 * @param  [type] $menu [description]
 * @return [type]       [description]
 */
function citrixMenulist($menu){
    $menus = array();
    //先找出顶级菜单
    foreach ($menu as $k => $val) {
        if($val['pid'] == 0) {
            $menus[$k] = $val;
        }
    }
    //通过顶级菜单找到下属的子菜单
    foreach ($menus as $k => $val) {
        foreach ($menu as $key => $value) {
            if($value['pid'] == $val['id']) {
                $menus[$k]['list'][] = $value;
            }
        }
    }
    //三级菜单
    foreach ($menus as $k => $val) {
        if(isset($val['list'])) {
            foreach ($val['list'] as $ks => $vals) {
                foreach ($menu as $key => $value) {
                    if($value['pid'] == $vals['id']) {
                        $menus[$k]['list'][$ks]['list'][] = $value;
                    }
                }
            }
        }
    }
    return $menus;
}
/**
 * [citrixPassword 密码加密方式]
 * @param  [type] $password      [密码]
 * @param  string $password_code [密码额外加密字符]
 * @return [type]                [description]
 */
function citrixPassword($password, $password_code='lshi4AsSUrUOwWVCitrix')
{
    return md5(md5($password) . md5($password_code));
}

/**
 * [citrixGetUrl 根据附件表的id返回url地址]
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
function citrixGetUrl($id)
{
    if ($id) {
        $geturl = \think\Db::name("sys_attachment")->where(['id' => $id])->find();
        if($geturl['status'] === 1) 
        {
            //审核通过
            if("WINNT" == PHP_OS)
            {
                return str_replace("/","\\",$geturl['filepath']);
            }else
            {
                return str_replace("\\","/",$geturl['filepath']);
            }
        } elseif($geturl['status'] === 0) {
            //待审核
            if("WINNT" == PHP_OS)
            {
                return str_replace("/","\\",'/public/static/public/img/noExtension.png');
            }else
            {
                return str_replace("\\","/",'/public/static/public/img/noExtension.png');
            }
        } elseif($geturl['status'] === 2) {
            //不通过
            if("WINNT" == PHP_OS)
            {
                return str_replace("/","\\",'/public/static/public/img/awaitVerify.png');
            }else
            {
                return str_replace("\\","/",'/public/static/public/img/awaitVerify.png');
            }
        }  else {
            //不存在
            if("WINNT" == PHP_OS)
            {
                return str_replace("/","\\",'/public/static/public/img/404.png');
            }else
            {
                return str_replace("\\","/",'/public/static/public/img/404.png');
            }
        } 
    }else {
        //不存在
        if("WINNT" == PHP_OS)
        {
            return str_replace("/","\\",'/public/static/public/img/404.png');
        }else
        {
            return str_replace("\\","/",'/public/static/public/img/404.png');
        }
    } 
    return false;
}
/**
 * [citrixGetToken token生成]
 * @return [type] [description]
 */
function citrixGetToken()
{
    $v = 1;
    $key = mt_rand();
    $hash = hash_hmac("sha1", $v . mt_rand() . time(), $key, true);
    $token = str_replace('=', '', strtr(base64_encode($hash), '+/', '-_'));
    return $token;
}
/**
 * [citrixGetTokenParam 根据盐值生成token]
 * @param  [type] $ip [description]
 * @return [type]     [description]
 */
function citrixGetTokenParam($ip,$key='lshi4AsSUrUOwWVCitrix')
{
    $hash = md5($ip.$key);
    return base64_encode($hash);
}
/**
 * [citrixJumpUrl 跳转错误页]
 * @param  [type]  $msg  [操作介绍]
 * @param  [type]  $url  [跳转url]
 * @param  integer $icon [description]
 * @return [type]        [description]
 */
function citrixJumpUrl($msg,$url,$icon = 2)
{
    //pc 版本
    exit('<html>
        <meta charset="utf-8"/>
        <script src="/public/static/vendor/jquery/jquery.js"></script>
        <script src="/public/static/vendor/layui/layui.js"></script>
        <head>
        <script type="text/javascript">
            layui.use(["layer", "form"], function() 
            {
                var layer = layui.layer;
                layer.confirm("'.$msg.'", {
                    btn: ["确定"], 
                    icon: '.$icon.',
                    end: function () 
                    {
                        window.location.href="'.$url.'"; 
                    }
                }, function(){
                    window.location.href="'.$url.'"; 
                });
            });
        </script>
        </head>
    </html>');
}
/**
 * [citrixJumpMobileUrl 跳转错误页]
 * @param  [type]  $msg  [操作介绍]
 * @param  [type]  $url  [跳转url]
 * @param  integer $icon [description]
 * @return [type]        [description]
 */
function citrixJumpMobileUrl($msg,$url,$icon = 2)
{
    //mobile 版本
    exit('<html>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <script src="/public/static/vendor/jquery/jquery.js"></script>
        <script src="/public/static/vendor/layui/layui.js"></script>
        <head>
        <script type="text/javascript">
            layui.use(["layer", "form"], function() 
            {
                var layer = layui.layer;
                layer.confirm("'.$msg.'", {
                    btn: ["确定"], 
                    icon: '.$icon.',
                    end: function () 
                    {
                        window.location.href="'.$url.'"; 
                    }
                }, function(){
                    window.location.href="'.$url.'"; 
                });
            });
        </script>
        </head>
    </html>');
}
/**
 * [citrixGetArticleCateName 获取文章分类id]
 * @param  [type] $article_cate_id [description]
 * @return [type]                    [description]
 */
function citrixGetArticleCateName($article_cate_id)
{
    return \think\Db::name("article_cate")->where(['id'=>$article_cate_id])->value('name');
}
/**
 * [citrixGetNavigationBarCateName 获取导航名称]
 * @param  [type] $pid [description]
 * @return [type]      [description]
 */
function citrixGetNavigationBarCateName($pid)
{
    return \think\Db::name("sys_show_nav")->where(['id'=>$pid])->value('name');
}