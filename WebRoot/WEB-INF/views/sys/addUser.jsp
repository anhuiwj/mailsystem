<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%@ include file="/WEB-INF/views/common/static-js.jsp" %>
    <script type="text/javascript" src="${ctxStatic}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/passwordStrength-min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/lib/Validform/5.3.2/Validform.js"></script>
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form action="${ctx}/user/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <input class="input-text hidden" name="id" value="${TUser.id}" style="width:300px;" display="none">
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">姓名</label>
            <input class="input-text" name="username" value="${TUser.username}" style="width:300px;">
        </div>
        <c:if test="${empty TUser.id}">
            <div class="f-l w-980 mb-20">
                <label class="f-l mr-30 w-200">登录用户名</label>
                <input class="input-text" name="userCode"  value="${TUser.userCode}" datatype="english" style="width:300px;">
            </div>
            <div class="f-l w-980 mb-20">
                <label class="f-l mr-30 w-200">密码</label>
                <input class="input-text" name="password" id="password"  type="password" recheck="password1"   style="width:300px;">
            </div>
            <div class="f-l w-980 mb-20">
                <label class="f-l mr-30 w-200">密码</label>
                <input class="input-text" id="password1"  type="password" style="width:300px;">
            </div>
        </c:if>
        <div class="f-l w-980 mb-20">
            <label class="f-l mr-30 w-200">性别</label>
            <select name="sex">
                <option value=""></option>
                <c:forEach var="s" items="${fns:getDictById('00002')}">
                    <option value="${s.code}" <c:if test="${TUser.sex eq s.code}">selected = "selected"</c:if>>${s.name}</option>
                </c:forEach>
            </select>
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
            }
        },
        beforeSubmit:function(curform){
            //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
            //这里明确return false的话表单将不会提交;
            <c:if test="${empty TUser.id}">
                if($.trim($('#password').val()) != $.trim($('#password1').val())){
                    layer.alert("两次密码不一致");
                    return false;
            }
            </c:if>
            return true;
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