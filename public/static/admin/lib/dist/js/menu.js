   var editor = new wangEditor('editor-trigger');
    //  // var editor = new E('#editor');
    //  editor.customConfig.debug = true;
      editor.config.menus = [
     'source', //源码
     // 'bold', // 粗体
     // 'eraser', //清除格式
     // 'forecolor', //文字颜色
     // 'fontsize', //字号、
     'bold',// 粗体
     // 'underline',//下划线
     // 'italic', //斜体
     'forecolor', //文字颜色
     // 'bgcolor',//背景色
     // 'strikethrough', //删除线
     'eraser', //清除格式
     // 'quote',  //引用
     // 'fontfamily', //字体
     'fontsize', //字号
     // 'head',    //标题
     // 'orderlist',   //有序列表
     // 'unorderlist',   //无序列表
     'alignleft',   //左对齐
     'aligncenter',   //居中
     'alignright',   //右对齐
     // 'link',   //链接
     // 'unlink',   //取消链接
     // 'table',   //表格
     // 'emotion',   //表情
     // 'img',   //图片
     // 'video',   //视频
     // 'location',   //位置
     // 'insertcode',   //插入源码
     'undo',   // 撤销
     'redo',    // 重复
     'fullscreen',   //全屏
     ];
     editor.create()
    // // }