<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;

class About extends Controller
{
    public function about()
    {
         require_once('Base.php');
         $aboutpResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>2
             ])->limit(1)->select();
         // return json($aboutpResult);
         $briefModel=Loader::model('jianjie_Brief');
         $briefResult=$briefModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $patentModel=Loader::model('zizhi_Patent');
         $patentResult=$patentModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $workshopModel=Loader::model('shebei_Workshop');
         $workshopResult=$workshopModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();	
        return $this->view->fetch('',[
            'aboutpResult'=>$aboutpResult,
        	'briefResult'=>$briefResult,
        	'patentResult'=>$patentResult,
        	'workshopResult'=>$workshopResult,
               ]);
    } 
    public function patent()
    {
         require_once('Base.php');
         $aboutpResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>2
             ])->limit(1)->select();
         $tdkzModel=Loader::model('zizhi_Tdk');
         $tdkzResult=$tdkzModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         // return json($tdkzResult);
         $briefModel=Loader::model('jianjie_Brief');
         $briefResult=$briefModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $patentModel=Loader::model('zizhi_Patent');
         $patentResult=$patentModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $patent1Result=$patentModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort','asc')->paginate(6,false,[
                                      'path'=>'/patent1/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $patent1Result->render(); 
         $workshopModel=Loader::model('shebei_Workshop');
         $workshopResult=$workshopModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
        // return json($workResult);	
        return $this->view->fetch('',[
            'aboutpResult'=>$aboutpResult,
            'tdkzResult'=>$tdkzResult,
        	'briefResult'=>$briefResult,
        	'patentResult'=>$patentResult,
        	'patent1Result'=>$patent1Result,
        	'workshopResult'=>$workshopResult,
        	'page'=>$page,
               ]);
    }
    public function workshop()
    {
         require_once('Base.php');
         $aboutpResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>2
             ])->limit(1)->select();
         $tdksModel=Loader::model('shebei_Tdks');
         $tdksResult=$tdksModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();	
         $briefModel=Loader::model('jianjie_Brief');
         $briefResult=$briefModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $patentModel=Loader::model('zizhi_Patent');
         $patentResult=$patentModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $workshopModel=Loader::model('shebei_Workshop');
         $workshopResult=$workshopModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->limit(1)->select();
         $workResult=$workshopModel->where([
                 'isdelete'=>0,
                 'status'=>1
             ])->order('sort','asc')->paginate(6,false,[
                                      'path'=>'/workshop1/[PAGE].html',
                                      'page' => input('param.p'),
                                     ]);
         $page = $workResult->render(); 	
        return $this->view->fetch('',[
            'aboutpResult'=>$aboutpResult,
            'tdksResult'=>$tdksResult,
        	'briefResult'=>$briefResult,
        	'patentResult'=>$patentResult,
        	'workshopResult'=>$workshopResult,
        	'workResult'=>$workResult,
        	'page'=>$page,
               ]);
    }
}
