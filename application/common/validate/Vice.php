<?php
namespace app\common\validate;

use think\Validate;

class Vice extends Validate
{
    protected $rule = [
        "titles|主标题" => "require",
        "name|副标题" => "require",
    ];
}
