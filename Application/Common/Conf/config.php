<?php
return array(
	//'配置项'=>'配置值'
	'title' =>'',
	'url' => 'http://localhost/beautyappdemo/',

	//数据库配置信息
	'DB_TYPE'   => 'mysqli', // 数据库类型
	'DB_HOST'   => 'localhost', // 服务器地址
	'DB_NAME'   => 'beautyappdemo', // 数据库名
	'DB_USER'   => 'root', // 用户名
	'DB_PWD'    => 'root1234', // 密码
	'DB_PORT'   => 3306, // 端口
	'DB_PREFIX' => 'tp_', // 数据库表前缀
	'DB_CHARSET' => 'utf8', // 字符集
	'DB_DEBUG'  =>  false, // 数据库调试模式 开启后可以记录SQL日志 3.2.3新增
	'yzm_outtime' => 60,
	'token_outtime' => 66666686400,
	'appName' => '',
	'appEnName' => '',

	'LANG_SWITCH_ON'   => true, // 开启语言包功能2
	'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效3
	'LANG_LIST'        => 'zh-tw,en-us,zh-cn', // 允许切换的语言列表 用逗号分隔4
	'VAR_LANGUAGE'     => 'l', // 默认语言切换变量

	'buildmode' => true,
	'b_paypalAuth' => 'QWV3bFNOOThJelVOQXJER1BVZnNuWDRCVWphQzlxcUstVW5xVWpseDhKYVdNVHlYc0JHNGJrVUg0RkJwV0N1eHBpY2J2QjRabHBGVmxQTno6RUxqc0c3WTM1b1lmazBON1lPVW9uVFNVdG5pS3l1bWNHR3JJcUV2bGljYkpDX0FDblFmdTRJRWoxckdMVjVMVzBWdGtCVGRxaEN0Sm4zdlU=',
	'b_stripeSecret' => 'sk_test_51Kjao5FBxBx0TkFDm2wde36eyMH9ZwQoGxEaANmDzhYtNRjLLfstsWOqPzRc8AzgBkC1Qk4pB3bDlwYEp8cVb6oV00EPcY7x8H',

	'endpoint_secret'=> 'whsec_o1j7NbZvxUkncLwcYboiFl2sKrv7KtkB',

	'paypalAuth' => '',
	'stripeSecret' => '',
	'twilioId' => 'ACda521992ebb99cc454185dafc6127417',
	'twilioToken' => 'c0c9e78e77e60d986433075a0104ae26',
	'twilio_number' => '+15405655064',
	'serviceSid' => 'IS64335c2527520bb7ed1c2039060529ae',
	'mandrillappapi' => '-UgYajz3ZL3J6oS-Y8g1uQ',
	'twak_url' => 'https://embed.tawk.to/62f768b037898912e962c354/1gab71t7a',
);