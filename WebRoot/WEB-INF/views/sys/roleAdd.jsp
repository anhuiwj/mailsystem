<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%--<%@ include file="/WEB-INF/views/common/static-js.jsp" %>--%>
    <link rel="stylesheet" href="${ctxStatic}/lib/zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxStatic}/lib/zTree_v3-master/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/zTree_v3-master/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
    <SCRIPT LANGUAGE="JavaScript">
        var zTreeObj;
        // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
        var setting = {
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: { "Y": "ps", "N": "ps" }
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback:{
                beforeClick:function(id, node){
                    zTreeObj.checkNode(node, !node.checked, true, true);
                    return false;
                },
                onCheck:function(event, treeId, treeNode){
                    $(".ids").each(function(){
                        $(this).remove();
                    });
                    var nodes = zTreeObj.getCheckedNodes(true);
                    var html1 = "";
                    for(var i=0; i<nodes.length; i++) {
                        html1 += "<input type='hidden' name='menus' value='"+nodes[i].id+"'/>";
                    }
                    $("#treeDemo").after(html1);
                }
            }
        };
        // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
        var zNodes =[
            <c:forEach items="${list}" var="item" varStatus="sta">
            <c:if test="${sta.index>0}">,</c:if>
            {id:"${item.id}", pId:"${item.pid}", name:"${item.name}"<c:if test="${fns:contains(TRole.menus, item.id)}">,checked:true</c:if>}
            </c:forEach>
        ];
        $(document).ready(function(){
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            zTreeObj.expandAll(true);
        });

    </SCRIPT>
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form action="${ctx}/role/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <c:forEach var="m"  items="${TRole.menus}">
            <input type='hidden' class="ids" name='menus' value='${m}'/>
        </c:forEach>

        <input type='hidden' name='id' value='${TRole.id}'/>

        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">角色名称</label>
            <input class="input-text f-l" name="rolename" value="${TRole.rolename}" style="width:300px;" datatype="*" >
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">启用状态</label>
            <select style="width:300px;" name="status">
                <c:forEach var="SysXDict"  items="${fns:getDictById('00004')}">
                    <option value="${SysXDict.code}" <c:if test="${TRole.status eq SysXDict.code}">selected='selected'</c:if>>${SysXDict.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">菜单</label>
            <%--<input class="input-text" style="width:300px;">--%>
            <%--<ul ></ul>--%>
            <ul id="treeDemo" class="ztree" style="margin-left: 225px;"></ul>
        </div>
        <div class="row cl va-m clear text-c">

            <a class="btn btn-primary radius  mt-50" onclick="submit()" >&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;</a>

        </div>
    </form>
</div>
<script type="text/javascript">
    function submit() {
        $.ajax({
            cache: true,
            type: "POST",
            url:'${ctx}/role/save',
            data:$('#form-role-edit').serialize(),// 你的formid
            async: false,
            error: function(request) {
            },
            success: function(data) {
                if(data.code == 200){
                    parent.layer.msg(data.msg, {icon: 1});
                    parent.exports.gridRefresh();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }else{
                    parent.layer.msg(data.msg, {icon: 1});
                }

            }
        });
    }
</script>
</body>
</html>