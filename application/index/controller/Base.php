<?php
use think\Request;  
use think\Loader;
        $navberModel=Loader::model('Navber');
        $tdkResult=$navberModel->where([
                'isdelete'=>0,
                'status'=>1,
                'id'=>1
            ])->limit(1)->select();
        $navberResult=$navberModel->where([
                'isdelete'=>0,
                'status'=>1
            ])->order('sort','asc')->select();
        $cont=request()->controller(); //获取控制器名称
        $foo=lcfirst($cont);  //首字母变小写
        // 右侧边栏
        $contactModel=Loader::model('Contact');
        $contactResult=$contactModel->where([
                'isdelete'=>0,
                'status'=>1
            ])->select(); 
        $newsaModel=Loader::model('Newsa');
        $newsrResult=$newsaModel->where([
                'isdelete'=>0,
                'status'=>1,
                'num' => ['>',50]
            ])->limit(3)->order('num','desc')->select();
        // 尾部
        $inforModel=Loader::model('Infor');
        $inforResult=$inforModel->where([
                'isdelete'=>0,
                'status'=>1
            ])->select();
        $copyModel=Loader::model('Copy');
        $copyResult=$copyModel->where([
                'isdelete'=>0,
                'status'=>1
            ])->select();
        $linksModel=Loader::model('Links');
        $linksResult=$linksModel->where([
                'isdelete'=>0,
                'status'=>1
            ])->select();
       $xdlModel=Loader::model('Xdl');
       $xdlResult=$xdlModel->where([
               'isdelete'=>0,
               'status'=>1
           ])->select();
        //网站地图  
        $mainModel=Loader::model('Main');
        $maintResult=$mainModel->where([
                'isdelete'=>0,
                'status'=>1,
            ])->order('sort','asc')->select();
        $viceModel=Loader::model('Vice');
        $vicetResult=$viceModel->where([
                'isdelete'=>0,
                'status'=>1,
            ])->order('sort','asc')->select();
       $this->assign([
        'tdkResult'=>$tdkResult,
        'navberResult'=>$navberResult,
        'foo'=>$foo,
        'contactResult'=>$contactResult,
        'newsrResult'=>$newsrResult,
        'inforResult'=>$inforResult,
        'linksResult'=>$linksResult,  
        'copyResult'=>$copyResult,
        'xdlResult'=>$xdlResult,
        'maintResult'=>$maintResult,
        'vicetResult'=>$vicetResult,
       ]);