<?php
namespace app\common\validate;

use think\Validate;

class Message extends Validate
{
    protected $rule = [
        "name|姓名" => "require",
        "phone|电话" => "require",
        'captcha|验证码'  => 'require|captcha',
    ];
}
