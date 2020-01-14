<?php
namespace app\common\validate;

use think\Validate;

class Copy extends Validate
{
    protected $rule = [
        "copyright|公司名" => "require",
        "record|备案号" => "require",
        "website|版权所有" => "require",
    ];
}
