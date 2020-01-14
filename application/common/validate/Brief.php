<?php
namespace app\common\validate;

use think\Validate;

class Brief extends Validate
{
    protected $rule = [
        "titles|标题" => "require",
        "editorValue|内容" => "require",
    ];
}
