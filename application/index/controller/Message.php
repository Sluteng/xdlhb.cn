<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;

class Message extends Controller
{
    public function message()
    {
    require_once('Base.php');
    $messResult=$navberModel->where([
            'isdelete'=>0,
            'status'=>1,
            'id'=>6
        ])->limit(1)->select();
    if (request()->isPost()){
     $data = input('post.');
     $validate = validate('Message');
     if (!$validate->batch()->check($data)) {
       $error = $validate->getError();
       $captcha=reset($error);
       return $this->view->fetch('',[
          'messResult'=>$messResult,
          'captcha'=>$captcha,
              ]);
       $this->error(implode(',',$error));
     }else{
      $center = model('Message');
      $center->data($data,true);
      $result = $center->allowField(true)->save();
      if ($result) {
      $captcha="true";
      return $this->view->fetch('',[
         'messResult'=>$messResult,
         'captcha'=>$captcha,
             ]);
      } else {
       $this->redirect('/index.html');
       }
     }   
  }
    $captcha="";
    return $this->view->fetch('',[
        'messResult'=>$messResult,
        'captcha'=>$captcha,
           ]);
    }
}
