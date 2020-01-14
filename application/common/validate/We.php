<?php
namespace app\common\validate;

use think\Validate;

class We extends Validate
{
    protected $rule = [
        "titles|标题" => "require",
        "img|缩略图" => "require",
        "editorValue|内容" => "require",
    ];
}
