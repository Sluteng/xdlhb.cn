<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 模拟tab产生空格
 * @param int $step
 * @param string $string
 * @param int $size
 * @return string
 */
function tab($step = 1, $string = ' ', $size = 4)
{
    return str_repeat($string, $size * $step);
}

//手机端与PC端之间的判断

function ismobile()

{

    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备

    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))

        return true;



    //此条摘自TPM智能切换模板引擎，适合TPM开发

    if (isset ($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT'])

        return true;

    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息

    if (isset ($_SERVER['HTTP_VIA']))

        //找不到为flase,否则为true

        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;

    //判断手机发送的客户端标志,兼容性有待提高

    if (isset ($_SERVER['HTTP_USER_AGENT'])) {

        $clientkeywords = array(

            'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile'

        );

        //从HTTP_USER_AGENT中查找手机浏览器的关键字

        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {

            return true;

        }

    }

    //协议法，因为有可能不准确，放到最后判断

    if (isset ($_SERVER['HTTP_ACCEPT'])) {

        // 如果只支持wml并且不支持html那一定是移动设备

        // 如果支持wml和html但是wml在html之前则是移动设备

        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {

            return true;

        }

    }

    return false;

}


if (!function_exists('i_array_column')) {
    function i_array_column($input, $columnKey, $indexKey = null) {
        $columnKeyIsNumber = (is_numeric($columnKey)) ? true : false;
        $indexKeyIsNull = (is_null($indexKey)) ? true : false;
        $indexKeyIsNumber = (is_numeric($indexKey)) ? true : false;
        $result = array();
        foreach ((array) $input as $key => $row) {
            if ($columnKeyIsNumber) {
                $tmp = array_slice($row, $columnKey, 1);
                $tmp = (is_array($tmp) && !empty($tmp)) ? current($tmp) : null;
            } else {
                $tmp = isset($row[$columnKey]) ? $row[$columnKey] : null;
            }
            if (!$indexKeyIsNull) {
                if ($indexKeyIsNumber) {
                    $key = array_slice($row, $indexKey, 1);
                    $key = (is_array($key) && !empty($key)) ? current($key) : null;
                    $key = is_null($key) ? 0 : $key;
                } else {
                    $key = isset($row[$indexKey]) ? $row[$indexKey] : 0;
                }
            }
            $result[$key] = $tmp;
        }
        return $result;
    }
}  

/** 删除所有空目录 
* @param String $path 目录路径 
*/
//遍历并删除空文件夹目录
function rm_empty_dir($path){
    if(is_dir($path) && ($handle = opendir($path))!==false){
        while(($file=readdir($handle))!==false){     // 遍历文件夹
            if($file!='.' && $file!='..'){
                $curfile = $path.'/'.$file;          // 当前目录
                if(is_dir($curfile)){                // 目录
                    rm_empty_dir($curfile);          // 如果是目录则继续遍历
                    if(count(scandir($curfile))==2){ // 目录为空,=2是因为. 和 ..存在
                        rmdir($curfile);             // 删除空目录
                    }
                }
            }
        }
        closedir($handle);
    }
}