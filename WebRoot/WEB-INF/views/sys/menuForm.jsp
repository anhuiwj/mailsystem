<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html style="height: auto;">
<head>
	<meta charset="utf-8">
	<%@ include file="/WEB-INF/views/common/static-css.jsp" %>
	<%@ include file="/WEB-INF/views/common/static-js.jsp" %>
	<%@include file="/WEB-INF/views/common/validation.jsp" %>
	<link rel="stylesheet" href="${ctxStatic}/lib/zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctxStatic}/lib/zTree_v3-master/js/jquery.ztree.core.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/Validform.js"></script>
	<title>菜单维护</title>
	<script type="text/javascript">
		var menuZTree = undefined;
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
			}
		};
		var zNodes =[
			<c:forEach items="${list}" var="item" varStatus="sta">
			<c:if test="${sta.index>0}">,</c:if>
			{id:"${item.id}", pId:"${item.pid}", name:"${item.name}"<c:if test="${item.pid eq '0'}">,open:true</c:if>}
			</c:forEach>
		];

		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("menuTree"),
					nodes = zTree.getSelectedNodes(),
					v = "";
			if (nodes.length == 1) {
				selectNode(nodes[0]);
			}
			hideMenu();
		}

		function selectNode(node) {
			$("#menuHidden").attr("value", node.id);
			var s = "";
			while(node != null){
				if(s.length>0){
					s = " > " + s;
				}
				s = node.name + s
				node = node.getParentNode();
			}
			$("#menuPid").attr("value", s);
		}

		function initSelectNode(id) {
			var node = menuZTree.getNodeByParam('id',id);
			if (node != undefined && node != null) {
				selectNode(node);
				menuZTree.selectNode(node);
			}
		}

		function showMenu() {
			var cityObj = $("#menuPid");
			var cityOffset = $("#menuPid").position();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyMenuDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyMenuDown);
		}
		function onBodyMenuDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		var layerLoadIndex = undefined;
		function beforeCall(form, options){
			layerLoadIndex = layer.load();
			return true;
		}
		function ajaxValidationCallback(status, form, result, options){
			debugger;
			layer.close(layerLoadIndex);
			if(status === true){
				if (result.code == '200'){
					var index = parent.layer.getFrameIndex(window.name);
					if(index != undefined) {
						parent.layer.msg(result.msg, {icon: 6});
						parent.layer.close(index);
					} else {
						Hui_update_iframe("菜单列表","${ctx}/menu/list");
					}
				} else {
					layer.msg(result.msg, {icon: 5});
				}
			} else {
				layer.msg('删除失败', {icon: 5});
			}
		}
		$(document).ready(function(){
			menuZTree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			<c:if test="${sysMenu != null && not empty sysMenu.pid}">initSelectNode("${sysMenu.pid}");</c:if>
			jQuery('#submitForm').validationEngine({
				ajaxFormValidation: true,
				promptPosition: "centerRight",
				ajaxFormValidationMethod: 'post',
				onAjaxFormComplete: ajaxValidationCallback,
				onBeforeAjaxFormValidation: beforeCall
			});
		});
	</script>
</head>
<body>
<div class="page-container" style="margin: 10px;background-color: #fff; border: 1px solid #ddd;border-radius: 4px;">
	<form id="submitForm" action="${ctx}/menu/save" method="post" class="form form-horizontal">
		<input type="hidden" name="id" value="${sysMenu.id}"/>
		<%--<%@include file="/WEB-INF/include/token.jsp" %>--%>
		<legend>菜单维护</legend>
		<c:if test="${showRoot}">
			<div class="f-l w-980 mb-20">
				<label class="f-l mr-30 w-200">父节点：</label>
				<div class="col-xs-7 col-sm-5" style="padding-left: 0px;">
					<input type="hidden" id="menuHidden" name="pid" value=""/>
					<input id="menuPid" type="text" readonly class="input-text"/>
					<div id="menuContent" class="zTreeContent" >
						<ul id="menuTree" class="ztree" style="margin-top:0; width:168px;"></ul>
					</div>
				</div>
				<div class="col-xs-1 col-sm-1">
					<input id="menuSelectBtn" onclick="showMenu();" class="btn btn-primary size-S radius" type="button" value="选择">
				</div>
			</div>
		</c:if>
		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">菜单名称：</label>
			<input class="validate[required] input-text f-l" name="name" value="${sysMenu.name}" datatype="*" style="width:300px;" placeholder="菜单名称">
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">菜单链接：</label>
			<input class="validate[required] input-text f-l" name="href" value="${sysMenu.href}" datatype="*" style="width:300px;" placeholder="菜单链接">
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">菜单目标：</label>
			<input class="input-text f-l" name="target" value="${sysMenu.target}" style="width:300px;" placeholder="菜单目标">
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">菜单图标：</label>
			<input class="input-text f-l" name="icon" value="${sysMenu.icon}" style="width:300px;" placeholder="菜单图标">
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">权限标识：</label>
			<input class="input-text f-l" name="permission" value="${sysMenu.permission}" style="width:300px;" placeholder="权限标识">
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">是否显示：</label>
			<div class="radio-box">
				<input<c:if test="${sysMenu.display eq '1'}"> checked="checked"</c:if> type="radio" id="isShow-1" name="display" value="1" class="validate[required]">
				<label for="isShow-1">显示</label>
			</div>
			<div class="radio-box">
				<input<c:if test="${sysMenu.display eq '0'}"> checked="checked"</c:if> type="radio" id="isShow-0" name="display" value="0" class="validate[required]">
				<label for="isShow-0">隐藏</label>
			</div>
		</div>

		<div class="f-l w-980 mb-20">
			<label class="f-l mr-30 w-200">菜单排序：</label>
			<input class="validate[required] input-text f-l" name="sort" value="${sysMenu.sort}" style="width:300px;"  datatype="n"  placeholder="菜单排序">
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="提交">
			</div>
		</div>
	</form>
</div>
</body>
<script>
</script>
</html>