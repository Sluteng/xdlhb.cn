<?php
namespace app\common\validate;

use think\Validate;

class Contact extends Validate
{
    protected $rule = [
        "name|公司名称" => "require",
        "phone|电话" => "require",
    ];
}
