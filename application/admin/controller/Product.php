<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;
use think\Loader;
use think\exception\HttpException;
use think\Config;


class Product extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        if ($this->request->param("main")) {
            $map['main'] = ["like", "%" . $this->request->param("main") . "%"];
        } 
       if ($this->request->param("titles")) {
            $map['titles'] = ["like", "%" . $this->request->param("titles") . "%"];
        }
        if ($this->request->param("name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
    }
    public function index()
    {
        $model = $this->getModel();
      
        // 列表过滤器，生成查询Map对象
        $map = $this->search($model, [$this->fieldIsDelete => $this::$isdelete]);
        // 特殊过滤器，后缀是方法名的
        $actionFilter = 'filter' . $this->request->action();
        if (method_exists($this, $actionFilter)) {
            $this->$actionFilter($map);
        }
        // 自定义过滤器
        if (method_exists($this, 'filter')) {
            $this->filter($map);
        }
        $this->datalist($model, $map);
        $title=request()->param();
        if($title!=null){
            $titles=array_key_exists('title',$title);               
            if($titles==true){ 
               $tle=urlencode($title['title']);
               $url=urldecode($tle);
               $head = str_replace('-', '/', $url);  
          if($head==""){return $this->view->fetch();}else{
              $productModel=Loader::model('Product');
              $list=$productModel->where([
              'isdelete'=>0,
              'titles'=>$head
              ])->select();
              // return json($list);  
              return $this->view->fetch('index',['list'=>$list]);
             }
            }else{
            return $this->view->fetch();
            }
        }
        return $this->view->fetch();  
    }   
       /**
        * 添加
        * @return mixed
        */
       public function add()
       {
           $controller = $this->request->controller();

           if ($this->request->isAjax()) {
               // 插入
               $data = $this->request->except(['id']);

               // 验证
               if (class_exists($validateClass = Loader::parseClass(Config::get('app.validate_path'), 'validate', $controller))) {
                   $validate = new $validateClass();
                   if (!$validate->check($data)) {
                       return ajax_return_adv_error($validate->getError());
                   }
               }

               // 写入数据
               if (
                   class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $this->parseCamelCase($controller)))
                   || class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $controller))
               ) {
                   //使用模型写入，可以在模型中定义更高级的操作
                   $model = new $modelClass();
                   $ret = $model->isUpdate(false)->save($data);
               } else {
                   // 简单的直接使用db写入
                   Db::startTrans();
                   try {
                       $model = Db::name($this->parseTable($controller));
                       $ret = $model->insert($data);
                       // 提交事务
                       Db::commit();
                   } catch (\Exception $e) {
                       // 回滚事务
                       Db::rollback();

                       return ajax_return_adv_error($e->getMessage());
                   }
               }

               return ajax_return_adv('添加成功');
           } else {
               // 添加
                $navberModel=Loader::model('Navber');
                $tdkResult=$navberModel->where([
                        'isdelete'=>0,
                        'status'=>1,
                        'id'=>1
                    ])->limit(1)->select();

                $mainModel=Loader::model('Main');
                $main=$mainModel->field('name')->where([
                'isdelete'=>0,
                'status'=>1
                ])->select();
                $viceModel=Loader::model('Vice');
                $vice=$viceModel->field('name')->where([
                'isdelete'=>0,
                'status'=>1
                ])->select();
                $id=null;
                    // return json($fid);
               return $this->view->fetch(isset($this->template) ? $this->template : 'edit',['tdkResult'=>$tdkResult,'main'=>$main,'vice'=>$vice,'id'=>$id]);
           }
       }

    /**
        * 编辑
        * @return mixed
        */
       public function edit()
       {
           $controller = $this->request->controller();

           if ($this->request->isAjax()) {
               // 更新
               $data = $this->request->post();
               if (!$data['id']) {
                   return ajax_return_adv_error("缺少参数ID");
               }

               // 验证
               if (class_exists($validateClass = Loader::parseClass(Config::get('app.validate_path'), 'validate', $controller))) {
                   $validate = new $validateClass();
                   if (!$validate->check($data)) {
                       return ajax_return_adv_error($validate->getError());
                   }
               }

               $imgModel=Loader::model($controller);
               $list=$imgModel->where([
               'id'=>$data['id'],
               ])->select();
               $arr1=i_array_column($list,'img');
               $img=reset($arr1);
               $file= file_exists(ROOT_PATH . "$img");//判断文件是否存在
               if ($data['img']!=$img && $data['img']!=null && $file!=false) {
                     unlink( ROOT_PATH . "$img");
                 }

               // 更新数据
               if (
                   class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $this->parseCamelCase($controller)))
                   || class_exists($modelClass = Loader::parseClass(Config::get('app.model_path'), 'model', $controller))
               ) {
                   // 使用模型更新，可以在模型中定义更高级的操作
                   $model = new $modelClass();
                   $ret = $model->isUpdate(true)->save($data, ['id' => $data['id']]);
               } else {
                   // 简单的直接使用db更新
                   Db::startTrans();
                   try {
                       $model = Db::name($this->parseTable($controller));
                       $ret = $model->where('id', $data['id'])->update($data);
                       // 提交事务
                       Db::commit();
                   } catch (\Exception $e) {
                       // 回滚事务
                       Db::rollback();

                       return ajax_return_adv_error($e->getMessage());
                   }
               }

               return ajax_return_adv("编辑成功");
           } else {
               // 编辑
               $id = $this->request->param('id');
               if (!$id) {
                   throw new HttpException(404, "缺少参数ID");
               }
               $vo = $this->getModel($controller)->find($id);
               if (!$vo) {
                   throw new HttpException(404, '该记录不存在');
               }

               $this->view->assign("vo", $vo);
                $navberModel=Loader::model('Navber');
                $tdkResult=$navberModel->where([
                        'isdelete'=>0,
                        'status'=>1,
                        'id'=>1
                    ])->limit(1)->select();
                 $productModel=Loader::model('Product');
                 $name=$productModel->where([
                 'isdelete'=>0,
                 'id'=>$id
                 ])->select();
                 // return json($name);    
                 $arr=i_array_column($name,'main');
                 $main1=reset($arr);
                 $arr1=i_array_column($name,'titles');
                 $vice1=reset($arr1);
                 $mainModel=Loader::model('Main');
                 $main=$mainModel->field('name')->where([
                 'isdelete'=>0,
                 'status'=>1
                 ])->select();
                 $viceModel=Loader::model('Vice');
                 $vice=$viceModel->field('name')->where([
                 'isdelete'=>0,
                 'status'=>1
                 ])->select();
                // $product=reset($arr2);
                // return json($main);
                return $this->view->fetch('',[
                  'tdkResult'=>$tdkResult,  
                  'id'=>$id,
                  'main'=>$main,
                  'main1'=>$main1,
                  'vice'=>$vice,
                  'vice1'=>$vice1
                  ]);
           }
       }
}
