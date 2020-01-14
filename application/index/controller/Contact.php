<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;

class Contact extends Controller
{
    public function contact()
    {
         require_once('Base.php');
         $contResult=$navberModel->where([
                 'isdelete'=>0,
                 'status'=>1,
                 'id'=>7
             ])->limit(1)->select();
        // return json($contactResult);	
        return $this->view->fetch('',[
        	'contResult'=>$contResult,
               ]);
    }
}
