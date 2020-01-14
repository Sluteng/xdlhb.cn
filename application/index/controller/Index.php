<?php
namespace app\index\controller;

use think\Controller;
use think\Loader;
use baidu;

class Index extends controller
{
    public function index()
    {   
    require_once('Base.php');
    // $fanyi = new baidu();
    // var_dump($fanyi->translate('欢迎','zh','en'));
    $bannerModel=Loader::model('Banner');
    $bannerResult=$bannerModel->where([
            'isdelete'=>0,
            'status'=>1
        ])->order('sort=0 asc,sort asc,id asc')->select(); 
    $mainModel=Loader::model('Main');
    $mainResult=$mainModel->where([
            'isdelete'=>0,
            'status'=>1,
            'home'=>1
        ])->order('sort=0 asc,sort asc,id asc')->select();
    $viceModel=Loader::model('Vice');
    $viceResult=$viceModel->where([
            'isdelete'=>0,
            'status'=>1,
            'home'=>1
        ])->order('sort','asc')->select();
    $productModel=Loader::model('Product');
    $productResult=$productModel->where([
                    'isdelete'=>0,
                    'status'=>1,
                    'home'=>1
                ])->limit(6)->order('sort=0 asc,sort asc,id desc')->select();
    $casesModel=Loader::model('Cases');
    $casesResult=$casesModel->where([
                    'isdelete'=>0,
                    'status'=>1,
                    'home'=>1
                ])->limit(3)->order('sort=0 asc,sort asc,id desc')->select();
    $weModel=Loader::model('We');
    $weResult=$weModel->where([
                    'isdelete'=>0,
                    'status'=>1,
                ])->limit(1)->select();
    // return json($weResult);
    $majorModel=Loader::model('Major');
    $majorResult=$majorModel->where([
                    'isdelete'=>0,
                    'status'=>1,
                ])->limit(3)->order('id asc')->select();
    $newsaModel=Loader::model('Newsa');
    $newsaResult=$newsaModel->where([
            'isdelete'=>0,
            'status'=>1,
            'home'=>1
        ])->limit(6)->order('sort=0 asc,sort asc,id desc')->select();
    // $bannerModel=Loader::model('Banner');
    // $bannerResult=$bannerModel->where([
    //         'isdelete'=>0,
    //         'status'=>1
    //     ])->order('sort','asc')->select();     
    return $this->view->fetch('',[
      'bannerResult'=>$bannerResult,
      'mainResult'=>$mainResult,
      'viceResult'=>$viceResult,
      'productResult'=>$productResult,
      'casesResult'=>$casesResult,
      'weResult'=>$weResult,
      'majorResult'=>$majorResult,
      'newsaResult'=>$newsaResult,
           ]);
    }
}       