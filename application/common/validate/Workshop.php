<?php
namespace app\common\validate;

use think\Validate;

class Workshop extends Validate
{
    protected $rule = [
        "img|图片" => "require",
        "name|设备名称" => "require",
    ];
}
