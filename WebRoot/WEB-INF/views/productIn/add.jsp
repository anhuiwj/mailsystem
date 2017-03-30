<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%--<%@ include file="/WEB-INF/views/common/static-js.jsp" %>--%>
    <script type="text/javascript" src="${ctxStatic}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/Validform.js"></script>
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form action="${ctx}/productIn/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <input class="input-text hidden" name="id" value="${id}" style="width:300px;" display="none">
        <c:if test="${empty id}">
            <div class="f-l w-980 mb-20">
                <label class="f-l mr-30 w-200">原材料名称</label>
                <select  name="rawMaterialId" datatype="*">
                    <c:forEach  var="rawMaterial" items="${fns:getRawMaterial()}">
                        <option value="${rawMaterial.id}" >${rawMaterial.chinaName}</option>
                    </c:forEach>
                </select>
            </div>
        </c:if>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">进货量</label>
            <input class="input-text" name="inNum" datatype="onepoint" style="width:300px;">
        </div>
        <div class="row cl va-m clear text-c">
            <input class="btn btn-primary radius  mt-50" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#form-role-edit").Validform({ //表单验证
        tiptype: 2,
        ajaxPost: true,
        datatype:{
            "english":function(gets,obj,curform,regxp){
                //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                var reg1=/[A-Za-z]$/;
                if(reg1.test(gets)){return true;}
                return false;
            },
            "onepoint":function (gets,obj,curform,regxp) {
                var reg = /^(\d+\.\d{1,1}|\d+)$/;
                if(reg.test(gets)){return true;}
                return false;
            }
        },
        callback: function (data) {
            parent.layer.msg(data.msg, {icon: 1});
            parent.exports.gridRefresh();
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    });

</script>
</body>
</html>