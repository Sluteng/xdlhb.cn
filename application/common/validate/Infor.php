<?php
namespace app\common\validate;

use think\Validate;

class Infor extends Validate
{
    protected $rule = [
        "logo|LOGO图" => "require",
        "fax|热线电话" => "require",
        "wechat|微信二维码" => "require",
        "qq|在线QQ" => "require",
    ];
}
