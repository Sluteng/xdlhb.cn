<?php
namespace app\common\validate;

use think\Validate;

class News extends Validate
{
    protected $rule = [
        "name|标题" => "require",
    ];
}
