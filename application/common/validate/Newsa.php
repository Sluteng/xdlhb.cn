<?php
namespace app\common\validate;

use think\Validate;

class Newsa extends Validate
{
    protected $rule = [
        "titles|主标题" => "require",
        "name|标题名称" => "require",
        "img|缩略图" => "require",
    ];
}
