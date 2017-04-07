<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%--<%@ include file="/WEB-INF/views/common/static-js.jsp" %>--%>
    <script id="container" name="content" type="text/plain">
    </script>
    <script type="text/javascript" src="${ctxStatic}/lib/jquery/2.1.1/jquery-2.1.1.min.js"></script>
     <link rel="stylesheet" href="${ctxStatic}/lib/jQuery.autocomplete/1.1/css/autocomplete.css" type="text/css">
	<script src="${ctxStatic}/lib/jQuery.autocomplete/1.1/js/autocomplete.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${ctxStatic}/lib/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctxStatic}/lib/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/Validform.js"></script>
     <script type="text/javascript" src="${ctxStatic}/lib/html5.js"></script>
	<script src="${ctxStatic}/lib/jQuery.autocomplete/1.1/js/prism.js"></script>
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form  method="post" class="form form-horizontal va-m" id="form-role-edit" enctype="multipart/form-data">
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">收件人：</label>
            <div id="search-form" style="margin-right: 130px"></div>
        </div>
         <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">标题：</label>
            <input class="input-text" id="title" name="title" datatype="*"  style="width:300px;" >
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">附件：</label>
            <input class="input-text"  type="file" style="width:300px;">
        </div>
        <div class="f-l w-980 mb-20">
        	<textarea id="myEditor" name="mailContent"></textarea>
        </div>
         <div class="row cl va-m clear text-c">
            <button class="btn btn-primary radius  mt-50" id="submit" onclick="dosave('1')" >&nbsp;&nbsp;&nbsp;&nbsp;发送&nbsp;&nbsp;</button>&nbsp;&nbsp;
            <button class="btn btn-primary radius  mt-50" id="submit" onclick="dosave('2')" >&nbsp;&nbsp;&nbsp;&nbsp;存为草稿&nbsp;&nbsp;</button>
        </div>
    </form>
</div>
<script type="text/javascript">
$(function(){
	//富文本编辑器
	ue = UE.getEditor('myEditor')
	UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl = function(action){
		if(action == '/resource/upload/images'){
			return '${ctx}'+'resource/upload/images';
		}else{
			return this._bkGetActionUrl.call(this, action);
		}
	}
	from = $(".form-role-edit").Validform();


});

var proposals = ${emails};
$(document).ready(function(){
	$('#search-form').autocomplete({
		hints: proposals,
		width: 300,
		height: 30,
		onSubmit: function(text){
			$('#message').html('Selected: <b>' + text + '</b>');			
		}
	});
});



function dosave(type){
	 var formData = new FormData();
	 formData.append('receiveUser',$('#receiveUser').val());
	 formData.append('title',$('#title').val())
	 formData.append('mailContent',ue.getContent());
	 
	 formData.append('type',type);
	 
	 //上传文件
      $("input:file").each(function(i,a){
          if ($.trim($(this).val()) != "") {
              formData.append('files',$(this)[0].files[0]);
          }
      });

	 if(from.check()){
		 $.ajax({
	         type: "post",
	         url: '${ctx}/receive/save',
	         processData:false, //这里必须是fasle
	         contentType:false,//这里必须是fasle
	         dataType: 'json',
	         data:formData,
	         success: function (data) {
	             if (data.code == 0) {
	                 layer.msg(data.msg, {
	                     icon: 1,
	                     time: 2000 //2秒关闭（如果不配置，默认是3秒）
	                 }, function () {
	                	  parent.exports.gridRefresh();
	                      var index = parent.layer.getFrameIndex(window.name);
	                      parent.layer.close(index);
	                 });
	             } else {
	                 layer.msg(data.msg, {
	                     icon: 1,
	                     time: 2000 //2秒关闭（如果不配置，默认是3秒）
	                 });
	             }
	         }
	     });
		 }
}
	
</script>
</body>
</html>