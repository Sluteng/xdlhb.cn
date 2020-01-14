<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;

class Product extends Controller
{
    public function product()
    {
         require_once('Base.php');
         $proResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>3
             ])->limit(1)->select();
         $mainModel=Loader::model('Main');
         $mainResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id asc')->select(); 
         $productModel=Loader::model('Product');
         $productResult=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id asc')->paginate(6,false,[
                                      'path'=>'/product1/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $productResult->render();
        // return json($productResult);	
        return $this->view->fetch('',[
            'proResult'=>$proResult,
        	'mainResult'=>$mainResult,
        	'productResult'=>$productResult,
        	'page'=>$page,
               ]);
    }
     public function battery($id)
    {
         require_once('Base.php');
         $proResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>3
             ])->limit(1)->select();
         $mainModel=Loader::model('Main');
         $mainResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $titleResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->limit(1)->select();
         $arr1=i_array_column($titleResult,'name');
         $main1=reset($arr1);
         $viceModel=Loader::model('Vice');
         $viceResult=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$main1
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $vice1Result=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$main1
             ])->order('sort=0 asc,sort asc,id asc')->limit(1)->select();
         $arr2=i_array_column($vice1Result,'name');
         $vice1=reset($arr2);
         // return json($vice1);
         $productModel=Loader::model('Product');
         $productResult=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$vice1
             ])->order('sort=0 asc,sort asc,id asc')->paginate(6,false,[
                                      'path'=>'/batt/'.$id.'/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $productResult->render(); 
        return $this->view->fetch('',[
            'proResult'=>$proResult,
            'mainResult'=>$mainResult,
            'titleResult'=>$titleResult,
            'productResult'=>$productResult,
            'page'=>$page,
            'main1'=>$main1,
            'viceResult'=>$viceResult,
            'vice1'=>$vice1,
               ]);
    }
    public function battery1($id)
    {
         require_once('Base.php');
         $proResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>3
             ])->limit(1)->select();
         $mainModel=Loader::model('Main');
         $mainResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $viceModel=Loader::model('Vice');
         $vice1Result=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->order('sort=0 asc,sort asc,id asc')->select();
         // return json($viceResult);
         $arr1=i_array_column($vice1Result,'titles');
         $main1=reset($arr1);
         $arr2=i_array_column($vice1Result,'name');
         $vice1=reset($arr2);
         $viceResult=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$main1
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $titleResult=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->limit(1)->select(); 
         $productModel=Loader::model('Product');
         $productResult=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$vice1
             ])->order('sort=0 asc,sort asc,id asc')->paginate(6,false,[
                                      'path'=>'/tery/'.$id.'/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $productResult->render();
        return $this->view->fetch('battery',[
            'proResult'=>$proResult,
        	'mainResult'=>$mainResult,
        	'productResult'=>$productResult,
        	'page'=>$page,
            'main1'=>$main1,
            'viceResult'=>$viceResult,
            'titleResult'=>$titleResult,
        	'vice1'=>$vice1,
               ]);
    }
    public function product2($id)  
    {
         require_once('Base.php');
         $proResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>3
             ])->limit(1)->select();
         $productModel=Loader::model('Product');
         $productResult=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->limit(1)->select();
         $arr1=i_array_column($productResult,'titles');
         $titles=reset($arr1);
         // return json($titles);
         $prev=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$titles,
                 'id' => ['<',$id]
             ])->order('id','desc')->limit(1)->select();
         // return json($prev);
         //ÏÂÒ»Ò³
         $next=$productModel->where([
             'isdelete'=>0,
             'status'=>1,
             'titles'=>$titles,
             'id' => ['>',$id]
             ])->order('id','asc')->limit(1)->select();

         $viceModel=Loader::model('Vice');
         $viceResult=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'name'=>$titles,
             ])->limit(1)->select();
        $arr1=i_array_column($viceResult,'titles');
        $main=reset($arr1);
        $mainModel=Loader::model('Main');
        $mainResult=$mainModel->where([
                'isdelete'=>0,
                'status'=>1,
                'name'=>$main
            ])->limit(1)->select();
        return $this->view->fetch('',[
            'proResult'=>$proResult,
            'productResult'=>$productResult,
            'prev'=>$prev,
            'next'=>$next,
            'mainResult'=>$mainResult,
            'main'=>$main,
               ]);
    }

     public function search()
    {
        $title=request()->param();
        $name=urldecode($title['name']);
        // return json($titles);
         require_once('Base.php');
         $proResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>3
             ])->limit(1)->select();
         $mainModel=Loader::model('Main');  
         $mainResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $titleResult=$mainModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'name'=>['like', "%".$name."%"]
             ])->limit(1)->select();
         $viceModel=Loader::model('Vice');
         $vice2Result=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'name'=>['like', "%".$name."%"]
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $arr1=i_array_column($vice2Result,'titles');
         $main1=reset($arr1);
         $viceResult=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'name'=>['like', "%".$name."%"]
             ])->order('sort=0 asc,sort asc,id asc')->select();
         $vice1Result=$viceModel->where([
                 'isdelete'=>0,
                 'status'=>1,    
                 'name'=>['like', "%".$name."%"]
             ])->order('sort=0 asc,sort asc,id asc')->limit(1)->select();
         $arr2=i_array_column($vice1Result,'name');     
         $vice1=reset($arr2);
    if($titleResult!=null || $viceResult!=null){
         $arr1=i_array_column($titleResult,'id');
         $id=reset($arr1);
         $arr2=i_array_column($vice1Result,'name');     
         $vice1=reset($arr2);
         $productModel=Loader::model('Product');
         $productResult=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$vice1
             ])->order('sort=0 asc,sort asc,id asc')->paginate(6,false,[
                                      'path'=>'/batt/'.$id.'/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
        $page = $productResult->render(); 
        return $this->view->fetch('battery',[
            'proResult'=>$proResult,
            'mainResult'=>$mainResult,
            'titleResult'=>$titleResult,
            'productResult'=>$productResult,
            'page'=>$page,
            'main1'=>$main1,
            'viceResult'=>$viceResult,
            'vice1'=>$vice1,
               ]);
    }else if($titleResult==null && $viceResult==null){
             $productModel=Loader::model('Product');
             $productResult=$productModel->where([
                     'isdelete'=>0,
                     'status'=>1,
                     'name'=>['like', "%".$name."%"]
                 ])->limit(1)->select();
             $arr1=i_array_column($productResult,'titles');
             $titles=reset($arr1);
             $arr2=i_array_column($productResult,'id');
             $id=reset($arr2);
             $prev=$productModel->where([
                     'isdelete'=>0,
                     'status'=>1,
                     'titles'=>$titles,
                     'id' => ['<',$id]
                 ])->order('id','desc')->limit(1)->select();
             // return json($prev);
             //ÏÂÒ»Ò³
             $next=$productModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'titles'=>$titles,
                 'id' => ['>',$id]
                 ])->order('id','asc')->limit(1)->select();

             $viceModel=Loader::model('Vice');
             $viceResult=$viceModel->where([
                     'isdelete'=>0,
                     'status'=>1,
                     'name'=>$titles,
                 ])->limit(1)->select();
            $arr1=i_array_column($viceResult,'titles');
            $main=reset($arr1);
            $mainModel=Loader::model('Main');
            $mainResult=$mainModel->where([
                    'isdelete'=>0,
                    'status'=>1,
                    'name'=>$main
                ])->limit(1)->select();
            if($productResult==null){
               echo "<script>alert('暂无相关产品!');location.href='/index.html';</script>";
            }
            return $this->view->fetch('product2',[
                'proResult'=>$proResult,
                'productResult'=>$productResult,
                'prev'=>$prev,
                'next'=>$next,
                'mainResult'=>$mainResult,
                'main'=>$main,
                   ]);
        }
    }
}
