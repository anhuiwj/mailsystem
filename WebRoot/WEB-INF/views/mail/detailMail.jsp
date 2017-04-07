<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%--<%@ include file="/WEB-INF/views/common/static-js.jsp" %>--%>
    <script id="container" name="content" type="text/plain">
    </script>
    <script type="text/javascript" src="${ctxStatic}/lib/jquery/1.9.1/jquery.min.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${ctxStatic}/lib/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctxStatic}/lib/ueditor/ueditor.all.min.js"></script>
     <script type="text/javascript">
    </script>
    <title>查看邮件详细</title>
</head>
<body>
<div class="pd-20">
    <form action="${ctx}/receive/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">收件人：</label>
            <input class="input-text" name="receiveUser" disabled="disabled" value="${mailInfo.receiveUser}" style="width:300px;" >
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">标题：</label>
            <input class="input-text" name="title" disabled="disabled"  value="${mailInfo.title}" style="width:300px;" >
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">附件：</label>
            <a onclick="down('${mailInfo.fileId}')">${mailInfo.fileName}</a>
        </div>
        <div class="f-l w-980 mb-20">
        	<textarea id="myEditor" name="mailContent"></textarea>
        </div>
    </form>
    <iframe id="frmDownload" height="0" width="0" frameborder="0"></iframe>
</div>
<script type="text/javascript">
$(function(){
	//富文本编辑器
	var ue =  UE.getEditor('myEditor')
	ue.ready(function() {
    ue.setContent('${mailInfo.mailContent}');
	});
});

 function down(id){
	 $("#frmDownload").attr("src", '${ctx}/download' + "?id="+id);
		
}

	
</script>
</body>
</html>