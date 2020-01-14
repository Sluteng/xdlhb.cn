    var E = window.wangEditor
    var editor = new E('#div1')
    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'code',  // 插入代码
        'undo',  // 撤销 
        'redo'  // 重复
        // 'underline',  // 下划线
        // 'strikeThrough',  // 删除线
        // 'foreColor',  // 文字颜色
        // 'backColor',  // 背景颜色
        // 'link',  // 插入链接
        // 'list',  // 列表
        // 'justify',  // 对齐方式
        // 'quote',  // 引用
        // 'emoticon',  // 表情
        // 'image',  // 插入图片
        // 'table',  // 表格
        // 'video',  // 插入视频
    ]
    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())