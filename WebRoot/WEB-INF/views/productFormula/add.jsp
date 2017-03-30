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
    <form action="${ctx}/productFormula/save" method="post" class="form form-horizontal va-m" id="form-role-edit">
        <input class="input-text hidden" name="id" value="${id}" style="width:300px;" display="none">
        <c:if test="${empty id}">
            <div class="f-l w-980 mb-20">
                <label class="f-l mr-30 w-200">配比产品名称</label>
                <input class="input-text" name="formulaName" datatype="*" style="width:300px;">
            </div>
        </c:if>
            <table id="illnessHisTable" width="100%" border="0" cellpadding="2" cellspacing="1" style="table-layout:auto;">
                <thead><th style="font-size:16px; font-weight:bolder;background-color:#f5f5f5; text-align:left; width:100%;border:1px solid #e4e4e4;" colspan="6">原料添加信息</th></thead>
                <tbody>
                <tr>
                    <td style="width:15%;">原料添加信息<span>*</span></td>
                    <td style="width:18%;">
                        <input id="illnessHisAdd" type="button" value="＋" style="cursor:pointer; width:50px; height:24px; border:1px solid #e4e4e4; background:#096bb9; margin:8px 20px; color:#fff; border-radius:5px;-webkit-border-radius:5px;">
                    </td>
                    <td style="width:31%;">名称</td>
                    <td style="width:26%;">数量
                    </td>
                </tr>
                </tbody>
            </table>
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
        callback: function (data) {
            parent.layer.msg(data.msg, {icon: 1});
            parent.exports.gridRefresh();
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    });

        $("#illnessHisAdd").click(function(){
            if($(".pasthistoryTr").size()==1){
                $(".pasthistoryCode01").remove();
            }
            addPasthistory("","","");
        });
    function addPasthistory(diseaseCode,diseaseExplain,confirmDate){
        var index = $("#illnessHisTable").data("index");
        if(index == undefined){
            index = 0;
        } else {
            index++;
        }
        var html = '<tr class="pasthistoryTr pasthistoryCode'+diseaseCode+'"><td></td>' +
                '<td><input type="button" onclick="delRow2(this)" value="－" style="cursor:pointer; width:50px; height:24px; border:1px solid #e4e4e4; background:#096bb9; margin:8px 20px; color:#fff; border-radius:5px;-webkit-border-radius:5px;" /></td>' +
                    '<td><select id="diseaseCode'+index+'" name="formulaMatarials['+index+'].rawMaterialId"><c:forEach  var="rawMaterial" items="${fns:getRawMaterial()}"><option value="${rawMaterial.id}" >${rawMaterial.chinaName}</option></c:forEach></select></td>'+
                '<td><input id="confirmDate'+index+'" name="formulaMatarials['+index+'].needNum" value="'+confirmDate+'" class="input-text" style="width:120px;" datatype="n"/></td></tr>';
        $("#illnessHisTable tbody").append(html);
        if (diseaseCode == "01"){
        } else if(diseaseCode == "98" || diseaseCode == "99") {
        }
        $("#illnessHisTable").data("index",index);
        return index;
    }
function delRow2(b){
    var table = $(b).parents('table');
    var radio = table.attr('id') + 'Radio';
    $(b).parents('tr:first').remove();
}
</script>
</body>
</html>