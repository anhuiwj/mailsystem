<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%@ include file="/WEB-INF/views/common/static-js.jsp" %>
    <script type="text/javascript" src="${ctxStatic}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/Validform.js"></script>
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form action="${ctx}/product/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">产品名称</label>
            <input class="input-text" datatype="*" name="productName" style="width:300px;">
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">配比公式</label>
            <select  name="formulaId" datatype="*">
                <c:forEach  var="formulaVo" items="${fns:findFormulas()}">
                    <option value="${formulaVo.id}" >${formulaVo.formulaName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">产品制作数量</label>
            <input class="input-text" style="width:300px;" name="proNum" datatype="n">
        </div>
        <div class="row cl va-m clear text-c">
            <input class="btn btn-primary radius  mt-50" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#form-role-edit").Validform({ //表单验证
        tiptype: 1,
        ajaxPost: true,
        datatype:{
            "english":function(gets,obj,curform,regxp){
                //参数gets是获取到的表单元素值，obj为当前表单元素，curform为当前验证的表单，regxp为内置的一些正则表达式的引用;
                var reg1=/[A-Za-z]$/;
                if(reg1.test(gets)){return true;}
                return false;
            },
            "onepoint":function (gets,obj,curform,regxp) {
                var reg = /^-?[1-9]+(\.\d{1})?$/;
                if(reg.test(gets)){return true;}
                return false;
            }
        },
        callback: function (data) {
            $.Hidemsg();
            if(data.code == 200){
                parent.layer.msg(data.msg, {icon: 1});
                parent.exports.gridRefresh();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }else{
             	layer.msg(data.msg, {icon: 5});
            }
        }
    });
</script>
</body>
</html>