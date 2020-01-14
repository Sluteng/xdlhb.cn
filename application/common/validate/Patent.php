<?php
namespace app\common\validate;

use think\Validate;

class Patent extends Validate
{
    protected $rule = [
        "titles|标题" => "require",
        "img|图片" => "require",
    ];
}
