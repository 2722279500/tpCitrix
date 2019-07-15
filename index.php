<?php
// +----------------------------------------------------------------------
// | tpCitrix [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Citrix < 2722279500@qq.com >
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
// 定义应用目录
define('APP_PATH', __DIR__ . '/application/');
// 定义版本号
define('TPLAY_VERSION', '1.0.0');
//重定义扩展类库目录
define('EXTEND_PATH', __DIR__ . '/extend/');
//重定义第三方类库目录
define('VENDOR_PATH', __DIR__ . '/vendor/');
// 加载框架引导文件
require __DIR__ . '/thinkphp/start.php';
