<?php
namespace app\common\validate;

use think\Validate;

class Links extends Validate
{
    protected $rule = [
        "name|名称" => "require",
        "look_name|链接地址" => "require",
    ];
}
