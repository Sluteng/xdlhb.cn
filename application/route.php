<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
Route::get('index', 'index/Index/index'); //网站首页
Route::get('about', 'index/About/about'); //关于我们
Route::get('patent', 'index/About/patent'); //关于我们
Route::get('patent1/:p', 'index/About/patent'); //关于我们
Route::get('workshop', 'index/About/workshop'); //关于我们
Route::get('workshop1/:p', 'index/About/workshop');
Route::get('product', 'index/Product/product'); 
Route::get('product1/:p', 'index/Product/product'); 
Route::get('battery/:id', 'index/Product/battery');
Route::get('batt/:id/:p', 'index/Product/battery'); 
Route::get('battery1/:id', 'index/Product/battery1'); 
Route::get('tery/:id/:p', 'index/Product/battery1'); 
Route::get('product2/:id', 'index/Product/product2'); 
Route::post('search', 'index/Product/search'); 
Route::get('news', 'index/News/news'); //新闻资讯
Route::get('news1/:p', 'index/News/news'); //新闻资讯
Route::get('newsa/:id', 'index/News/newsa'); //新闻资讯
Route::get('newsa1/:id/:p', 'index/News/newsa'); //新闻资讯
Route::get('newsc/:id', 'index/News/newsc'); //新闻资讯
Route::get('cases', 'index/Cases/cases'); //工程案例
Route::get('cases1/:p', 'index/Cases/cases'); //工程案例
Route::get('casea/:id', 'index/Cases/casea'); //工程案例
Route::get('message', 'index/Message/message'); //留言反馈
Route::post('centers', 'index/Message/message'); //留言反馈
Route::get('contact', 'index/Contact/contact'); //联系我们

Route::get('main', 'admin/Vice/index'); 
Route::get('admin/Vice/index', 'admin/Vice/index'); 
Route::get('vice', 'admin/Product/index'); 
Route::get('admin/Product/index', 'admin/Product/index'); 
Route::get('new', 'admin/Newsa/index'); 
Route::get('admin/Newsa/index', 'admin/Newsa/index'); 
return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

];
