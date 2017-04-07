<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%@ include file="/WEB-INF/views/common/static-js.jsp" %>
        <title>角色管理</title>
</head>
<body>
<nav class="w-breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>  邮箱管理
    <span class="c-gray en">&gt;</span> 草稿箱
</nav>
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray">
        <div class="j_hform">
            <%--<p style="padding-left:30px;">--%>
                <%--<input id="ID" type="text" class="input-text" placeholder="企业名称" style="width:300px;"onkeyup=this.value=this.value.replace(/[$_%?*'"\s]/ig,'')>&nbsp;--%>
            <%--</p>--%>
            <p>
            </p>
            <p>

            </p>
        </div>
    </div>
    <div class="tbl_header mt-20">
        <strong>草稿箱</strong><p class="tbl_header_r">
        <%--<input id="export" name="export" type="button" value="导出" class="btn btn-success size-S radius"></p>--%>
    </div>
    <div class="tbl_scroll">
        <div id="table" class="dt-grid-container"></div>
        <div id="table_t" class="dt-grid-toolbar-container"></div>
    </div>
</div>
<script>
    $(function () {
        var whether =${fns:getDictToJSON('00001')};
        var dtList = function () {
            var columns = [
                {id: 'sendUser', title: '收件人', type: 'string', columnClass: 'text-c td'},
                {id: 'title', title: '邮件标题', type: 'string', columnClass: 'text-c'},
                {id: 'createDateString', title: '发送时间', type: 'string', columnClass: 'text-c'},
                {id: 'id', title: '操作', type: 'string',codeTable:whether, columnClass: 'text-c',
                    resolution:function(value, record, column, grid, dataNo, columnNo){
                    var content = '';
		                    content += '<input onclick="editRow(\''+record.id+'\');" value="查看" class="btn btn-primary size-MINI radius" type="button">';
		                    content += '&nbsp&nbsp<input onclick="sendMail(\''+record.mailId+'\');" value="发送" class="btn btn-primary size-MINI radius" type="button">';
                            content += '&nbsp&nbsp<input onclick="deleteRow(\''+record.id+'\');" value="删除" class="btn btn-primary size-MINI radius" type="button">';
                        return content;
                    }
                }
            ];

            var options = {
                lang: 'zh-cn',
                ajaxLoad : true,
                tableStyle: 'font-size:14px;',
                loadURL: "${ctx}/rubish/getData",
                check: false,
                columns: columns,
                gridContainer: 'table',
                toolbarContainer: 'table_t',
                pageSize: 5,
                tools: '',
                tableClass :'table table-border table-bordered table-bg',
                pageSizeLimit: [10, 20, 50],
                onGridComplete: function (data) {
                },
            };
            var grid = $.fn.DtGrid.init(options);
            grid.parameters = getParams();
            grid.load();
            return {
                grid: grid
            }
        }();

        //刷新列表
        function gridRefresh() {
            dtList.grid.parameters = getParams();
            dtList.grid.refresh(true);
        }

        //查询
        function search() {
            dtList.grid.parameters = getParams();
            dtList.grid.pager.nowPage = 1;
            dtList.grid.refresh(true);
        }
        function getParams() {
            var param = {};
            param.commonlyCalled = $('#commonlyCalled').val();
            param.englishName = $('#englishName').val();
            return param;
        }
        function bindEvent() {
            $('#query').on('click', function () { //查询
                search();
            });
            $('#add').on('click', function () { //查询
               layer_show("新增邮件","${ctx}/receive/add")
            });
        }
        function pageInit() {
            bindEvent();
            //暴露接口
            window.exports = {
                gridRefresh: gridRefresh,
            };
        }

        pageInit();
    });
    
    function editRow(id) {
        var url = "${ctx}/receive/read?id="+id;
        layer_show("查看邮件",url)
    }
    
    function deleteRow(id) {
        layer.confirm('确认删除吗？', {
            btn: ['确认','取消'], //按钮
            icon: 5,
            title:"提示"
        }, function(){
            $.ajax({
                url: "${ctx}/send/del",
                data:{"id":id} ,
                success: function (data) {
                    if (data.code==200) {
                        layer.msg(data.msg, {icon: 6,end:function(){
                            location.reload();
                        }});
                    } else {
                        layer.msg(data.msg, {icon: 5});
                    }
                }
            });
        });
    }

    function sendMail(id) {
        layer.confirm('确认发送吗？', {
            btn: ['确认','取消'], //按钮
            icon: 6,
            title:"提示"
        }, function(){
            $.ajax({
                url: "${ctx}/receive/sendMail",
                data:{"id":id} ,
                success: function (data) {
                    if (data.code==200) {
                        layer.msg(data.msg, {icon: 6,end:function(){
                            location.reload();
                        }});
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