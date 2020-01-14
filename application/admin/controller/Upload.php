<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author    yuan1994 <tianpian0805@gmail.com>
 * @link      http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

namespace app\admin\controller;

use app\admin\Controller;
use think\Db;
use think\Loader;

class Upload extends Controller
{
    /**
     * 首页
     */
    public function index()
    {
        $fileModel=Loader::model('File'); 
        $retlist=$fileModel->where([
                'cate'=>3
            ])->field('name')->select();
        $arr1=i_array_column($retlist,'name');
        $num = count($arr1);     //总数
        for($i=0;$i<$num;$i++){
        $url=$arr1[$i];
        $filename=substr($url,1);
        if(file_exists($filename)==false){
            $ret=$fileModel->where([
                'cate'=>3,
                'name'=>$url
            ])->delete();
         }
        }
         //遍历并删除空文件夹目录
        $folder = 'tmp/uploads';
        rm_empty_dir($folder); 
        return $this->view->fetch();
    }

    /**
     * 文件上传
     */
    public function upload()
    {
        $file = $this->request->file('file');
        $path = ROOT_PATH . 'tmp/uploads/';
        $info = $file->move($path);
        if (!$info) {
            return ajax_return_error($file->getError());
        }
        $data = $this->request->root() . '/tmp/uploads/' . $info->getSaveName();
        $insert = [
            'cate'     => 3,
            'name'     => $data,
            'original' => $info->getInfo('name'),
            'domain'   => '',
            'type'     => $info->getInfo('type'),
            'size'     => $info->getInfo('size'),
            'mtime'    => time(),
        ];
        Db::name('File')->insert($insert);

        return ajax_return(['name' => $data]);
    }

    /**
     * 远程图片抓取
     */
    public function remote()
    {
        $url = $this->request->post('url');
        // validate
        $name = ROOT_PATH . 'tmp/picture/' . get_random();
        $name = \File::downloadImage($url, $name);

        $ret = $this->request->root() . '/tmp/picture/' . basename($name);

        return ajax_return(['url' => $ret], '抓取成功');
    }

    /**
     * 图片列表
     */
    public function listImage()
    {
        $page = $this->request->param('p', 1);
        if ($this->request->param('count')) {
            $ret['count'] = Db::name('File')->where('cate=3')->count();
        }
        $ret['list'] = Db::name('File')->where('cate=3')->field('id,name,original')->page($page, 10)->select();

        return ajax_return($ret);
    }
        public function del($id)
    {
          $fileModel=Loader::model('File'); 
          $retlist=$fileModel->where([
                  'cate'=>3,
                  'id'=>$id
              ])->field('name')->select();
          $arr1=i_array_column($retlist,'name');
           $name=reset($arr1);
           $filename=substr($name,1);
           $aaa=file_exists($filename);
           if(file_exists($filename)==true){
              unlink($filename);  //注意php中双引号内使用花括号包裹变量的写法
              $ret=$fileModel->where([
                      'cate'=>3,
                      'id'=>$id
                  ])->delete();
              echo "<script>alert('图片删除成功');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";exit;
          }else{
              echo "<script>alert('该图片已删除');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";exit;
          }
    }
}