<?php
namespace app\common\validate;

use think\Validate;

class Xdl extends Validate
{
    protected $rule = [
        "img|头部banner" => "require",
        "title|标题" => "require",
    ];
}
