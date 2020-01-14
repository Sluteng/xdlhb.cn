<?php
namespace app\common\validate;

use think\Validate;

class Cases extends Validate
{
    protected $rule = [
        "name|名称" => "require",
        "img|缩略图" => "require",
        "editorValue|案例内容" => "require",
    ];
}
