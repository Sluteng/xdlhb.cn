<?php
namespace app\common\validate;

use think\Validate;

class Major extends Validate
{
    protected $rule = [
        "titles|标题" => "require",
        "img|缩略图" => "require",
        "content|内容" => "require",
    ];
}
