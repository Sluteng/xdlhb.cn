<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;

class Cases extends Controller
{
    public function cases()
    {
         require_once('Base.php');
         $caseResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>5
             ])->limit(1)->select();
         $casesModel=Loader::model('Cases');
         $casesResult=$casesModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort=0 asc,sort asc,id desc')->paginate(9,false,[
                                      'path'=>'/cases1/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $casesResult->render();
        // return json($casesResult);	
        return $this->view->fetch('',[
            'caseResult'=>$caseResult,
        	'casesResult'=>$casesResult,
        	'page'=>$page,
               ]);
    }
     public function casea($id)
    {
         require_once('Base.php');
         $caseResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>5
             ])->limit(1)->select();
         $casesModel=Loader::model('Cases');
         $casesResult=$casesModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->limit(1)->select();
         $arr2=i_array_column($casesResult,'num');
         $num=reset($arr2);
         $numResult=$casesModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>$id
             ])->update(['num' => $num+1]);
         //下一页
         $prev=$casesModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id' => ['<',$id]
             ])->order('id','desc')->limit(1)->select();
         //上一页
         $next=$casesModel->where([
             'isdelete'=>0,
             'status'=>1,
             'id' => ['>',$id]
             ])->order('id','asc')->limit(1)->select();
        // return json($casesResult);	
        return $this->view->fetch('',[
            'caseResult'=>$caseResult,
        	'casesResult'=>$casesResult,
        	'prev'=>$prev,
        	'next'=>$next,
               ]);
    }
}
