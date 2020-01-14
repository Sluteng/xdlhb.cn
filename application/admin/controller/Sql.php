<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);


use app\admin\Controller;
use think\Db;
use think\Loader;
use think\exception\HttpException;
use think\Config;
use app\admin\extra\Baksql; 

class Sql extends Controller
{
    use \app\admin\traits\controller\Controller;
     use \traits\controller\Jump;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        if ($this->request->param("title")) {
            $map['title'] = ["like", "%" . $this->request->param("title") . "%"];
        }
        if ($this->request->param("url")) {
            $map['url'] = ["like", "%" . $this->request->param("url") . "%"];
        }
    }
     //数据库备份
      public function mysql()
        {
            //获取操作内容：（备份/下载/还原/删除）数据库
            $type = input("type");
            //获取需要操作的数据库名字
            $name = input("name");

            $backup = new Baksql(\think\Config::get("database"));
            //var_dump($backup);
          
            switch ($type) {
                //备份
                case "backup":
                    $info = $backup->backup();
                    $this->success("$info", 'admin/Sql/index');  
                    break;
                //下载
                case "dowonload":
                    $info = $backup->downloadFile($name);
                    $this->success("$info", 'admin/Sql/index');
                    break;
                //还原
                case "restore":
                    $info = $backup->restore($name);
                    $this->success("$info", 'admin/Sql/index');
                    break;
                //删除
                case "del":
                    $info = $backup->delfilename($name);
                    $this->success("$info", 'admin/Sql/index');
                    break;
                //如果没有操作，则查询已备份的所有数据库信息
                default:
                    return $this->view->fetch("Sql/index", ["list" => array_reverse($backup->get_filelist())]);//将信息由新到老排序
            }
        }

    /**
     * 默认删除操作
     */
    public function delete()
    {
        return $this->updateField($this->fieldIsDelete, 1, "删除成功");
    }
    /**
     * 永久删除
     */
    public function deleteForever()
    {
        $model = $this->getModel();
        $pk = $model->getPk(); 
        $ids = $this->request->param($pk);
        $where[$pk] = ["in", $ids];
        $sqlResult=$model->where($where)->select();
        $arr1=i_array_column($sqlResult,'url');
        $num = count($arr1);  //总数
        // $mysql=array_shift($arr1);
        for($i=0;$i<$num;$i++){
        $url=urldecode($arr1[$i]);
        if( file_exists($url)!= false){
          unlink($url);  //注意php中双引号内使用花括号包裹变量的写法
         }
        }
        if (false === $model->where($where)->delete()) {
            return ajax_return_adv_error($model->getError());
        }
         return ajax_return_adv("删除成功");
    }

    /**
     * 清空回收站
     */
    public function clear()
    {
        $model = $this->getModel();
        $where[$this->fieldIsDelete] = 1;
        $sqlResult=$model->where($where)->select();
        $arr1=i_array_column($sqlResult,'url');
        $num = count($arr1);  //总数
        // $mysql=array_shift($arr1);
        for($i=0;$i<$num;$i++){
        $url=urldecode($arr1[$i]);
        if( file_exists($url)!= false){
          unlink($url);  //注意php中双引号内使用花括号包裹变量的写法
         }
        }
        if (false === $model->where($where)->delete()) {
            return ajax_return_adv_error($model->getError());
        }

        return ajax_return_adv("清空回收站成功");
    }
}
