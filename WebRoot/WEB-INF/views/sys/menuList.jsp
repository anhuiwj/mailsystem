<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<%@ include file="/WEB-INF/views/common/static-css.jsp" %>
		<%@ include file="/WEB-INF/views/common/static-js.jsp" %>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/treeTable/themes/vsStyle/treeTable.min.css" />
		<script type="text/javascript" src="${ctxStatic}/lib/treeTable/jquery.treeTable.min.js"></script>
		<title>菜单列表</title>
	</head>
	<body>
	<nav class="w-breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>  系统设置
		<span class="c-gray en">&gt;</span> 菜单管理
	</nav>
	<div class="pd-20">
		<div class="page-container">
			<table id="treeTable" class="dt-grid table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th style="width: 200px;">名称</th>
						<th>菜单链接</th>
						<th>目标</th>
						<th>菜单图标</th>
						<th>权限标识</th>
						<th style="width: 100px;text-align: center;">是否显示</th>
						<th style="width: 100px;text-align: center;">排序</th>
						<th >操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sysMenuList}" var="row">
					<tr id="${row.id}" pId="${row.pid}" >
						<td>${row.name}</td>
						<td>${row.href}</td>
						<td>${row.target}</td>
						<td>${row.icon}</td>
						<td>${row.permission}</td>
						<td style="text-align: center"><c:choose>
								<c:when test="${row.display eq '0'}">
									<span class="label label-default radius">隐藏</span>
								</c:when>
								<c:when test="${row.display eq '1'}">
									<span class="label label-success radius">显示</span>
								</c:when>
							</c:choose>
						</td>
						<td style="text-align: center">${row.sort}</td>
						<td style="text-align: center;">
						<%--<shiro:hasPermission name="auth:menu:save">--%>
							<input onclick="editRow('${row.id}');" value="修改" class="btn btn-primary size-MINI radius" type="button">
							<input onclick="addChildRow('${row.id}');" value="添加子菜单" class="btn btn-primary size-MINI radius" type="button">
						<%--</shiro:hasPermission>--%>
						<%--<shiro:hasPermission name="auth:menu:del">--%>
							<input onclick="deleteRow('${row.id}');" value="删除" class="btn btn-primary size-MINI radius" type="button">
						<%--</shiro:hasPermission>--%>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<script type="text/javascript">
			$(function(){
				$("#treeTable").treeTable({expandLevel : 5});
			});

			function addChildRow(pid) {
				var index = layer.open({
					type: 2,
					title:"菜单新增",
					content: '${ctx}/menu/form?pid='+pid,
					area: ['320px', '195px'],
					maxmin: true,
					end: function(){
						location.reload();
					}
				});
				layer.full(index);
			}

			function editRow(id) {
				var index = layer.open({
					type: 2,
					title: "菜单修改",
					content: '${ctx}/menu/form?id=' + id,
					area: ['320px', '195px'],
					maxmin: true,
					end: function(){
						location.reload();
					}
				});
				layer.full(index);
			}

		 	function deleteRow(id) {
				layer.confirm('确认删除吗？', {
					btn: ['确认','取消'], //按钮
					icon: 5,
					title:"提示"
				}, function(){
					$.ajax({
						url: "${ctx}/menu/delete",
						data:{"id":id} ,
						success: function (data) {
							if (data.code==200) {
								layer.msg(data.msg, {icon: 6,end:function(){location.reload();}});
							} else {
								layer.msg(data.msg, {icon: 5});
							}
						}
					});
				});
		 	}

		</script>
	</body>
</html>