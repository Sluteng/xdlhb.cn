//公共弹窗
function popup(url) {
      layer.confirm('确定执行当前操作？', { 
              btn: ['确定', '取消'] //按钮
          }, function () {
              layer.msg('执行成功', {icon: 1});   //点击删除按钮，页面跳转
              self.location.href = url;  
          }, function () {
              layer.msg('取消', {});   // 点击取消按钮，弹出框消失，页面不跳转
          });
      }
//备份
function sqlb(url) {
      layer.confirm('确定备份当前数据库？', { 
              btn: ['确定', '取消'] //按钮
          }, function () {  
              layer.msg('备份执行中,请稍后', {icon: 1});   //点击删除按钮，页面跳转
              self.location.href = url;  
          }, function () {
              layer.msg('取消', {});   // 点击取消按钮，弹出框消失，页面不跳转
          });
      }
//下载
function download(url) {
      layer.confirm('确定下载此数据库？', {
              btn: ['确定', '取消'] //按钮
          }, function () {
              layer.msg('选择下载地址', {icon: 1});   //点击删除按钮，页面跳转
              self.location.href = url;  
          }, function () {
              layer.msg('取消', {});   // 点击取消按钮，弹出框消失，页面不跳转
          });
      }
//还原
function leds(url) {
      layer.confirm('确定还原此数据库？', {
              btn: ['确定', '取消'] //按钮
          }, function () {
              layer.msg('正在还原,请稍后', {icon: 1});   //点击删除按钮，页面跳转
              self.location.href = url;  
          }, function () {
              layer.msg('取消', {});   // 点击取消按钮，弹出框消失，页面不跳转
          });
      }