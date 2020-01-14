<?php
namespace app\common\validate;

use think\Validate;

class Product extends Validate
{
    protected $rule = [
        "main|主标题" => "require",
        "titles|副标题" => "require",
        "img|缩略图" => "require",
        "name|产品名称" => "require",
    ];
}
