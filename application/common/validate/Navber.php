<?php
namespace app\common\validate;

use think\Validate;

class Navber extends Validate
{
    protected $rule = [
        "name|标题" => "require",
        "href|链接" => "require",
    ];
}
