<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/static-css.jsp" %>
    <%@ include file="/WEB-INF/views/common/static-js.jsp" %>
        <title>进货管理</title>
</head>
<body>
<nav class="w-breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>  产品信息管理
    <span class="c-gray en">&gt;</span> 产品配比公式管理
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray">
        <div class="j_hform">
            <p>
                <label>配比公式名称：</label>
                <input type="text" style="width:109px;" class="input-text" id="formulaName" name="formulaName" >
            </p>
            <p>
                <span>
                     <button name="query" id="query" class="btn btn-success radius r" type="submit"
                             style="margin-left: 30px;">查询
                     </button>
                </span>
                <span >
                      <button id="add_role" class="btn btn-success radius r">
                        新增
                      </button>
                 </span>
            </p>
        </div>
    </div>
    <div class="tbl_header mt-20">
        <strong>产品配比公式</strong><p class="tbl_header_r">
        <%--<input id="export" name="export" type="button" value="导出" class="btn btn-success size-S radius"></p>--%>
    </div>
    <div class="tbl_scroll">
        <div id="table" class="dt-grid-container"></div>
        <div id="table_t" class="dt-grid-toolbar-container"></div>
    </div>
    <div class="tbl_header mt-20">
        <strong></strong><p class="tbl_header_r">
        <%--<input id="export" name="export" type="button" value="导出" class="btn btn-success size-S radius"></p>--%>
    </div>
    <div class="tbl_scroll">
        <div id="table_2" class="dt-grid-container"></div>
        <div id="table_t2" class="dt-grid-toolbar-container"></div>
    </div>
</div>
<script>
    var lodingId=""

    $(function () {
        var whether =${fns:getDictToJSON('00001')};
        var dtList = function () {
            var columns = [
                {id: 'formulaName', title: '配比公式名称', type: 'string', columnClass: 'text-c td'},
                {id: 'createBy', title: '创建人', type: 'string', columnClass: 'text-c td'},
                {id: 'createDateString', title: '创建时间', type: 'string', columnClass: 'text-c td'},
                {id: 'id', title: '操作', type: 'string', columnClass: 'text-c td',
                    resolution:function(value, record, column, grid, dataNo, columnNo){
                    var content = '';
                            content += '<input onclick="addRow(\''+record.id+'\');" value="添加" class="btn btn-primary size-MINI radius" type="button">';
                        return content;
                    }
                }
            ];

            var options = {
                lang: 'zh-cn',
                ajaxLoad : true,
                tableStyle: 'font-size:14px;',
                loadURL: "${ctx}/productFormula/getData",
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
                onRowClick: function (data, rowData) {
                if (arguments[5] != 13) {
                    lodingId = rowData.id;
                    historyList('${ctx}/productFormula/getData2',lodingId);
                }
            }
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
            param.formulaName = $('#formulaName').val();
            return param;
        }
        function bindEvent() {
            $('#query').on('click', function () { //查询
                search();
            });
            $('#add_role').on('click', function () { //查询
               layer_show("原材料增加","${ctx}/productFormula/add")
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


    var h_dtList = "";

    function historyList(url, id) {
        if (!h_dtList) {
            var columns = [
                {
                    id: 'id', title: 'NO.', type: 'string', columnClass: 'text-c td', columnStyle: 'min-width:42px;max-width:42px',
                    resolution: function (value, record, column, grid, dataNo, columnNo) {
                        return (dataNo + 1);
                    }
                },
                {
                    id: 'formulaMatarialId',
                    title: '操作',
                    type: 'string',
                    columnClass: 'text-c td',
                    resolution: function (value, record) {
                         var content  = '<input onclick="delRow(\''+record.id+'\');" value="删除" class="btn btn-primary size-MINI radius" type="button">';
                        return content;
                    }
                },
                {id: 'commonlyCalled', title: '原材料俗称', type: 'string', columnClass: 'text-c td'},
                {id: 'chinaName', title: '原材料中文名', type: 'string', columnClass: 'text-c td'},
                {id: 'chemicalFormula', title: '原材料化学式', type: 'string', columnClass: 'text-c td'},
                {id: 'needNum', title: '原材料需求量', type: 'string', columnClass: 'text-c td'}
            ];
            var options = {
                lang: 'zh-cn',
                ajaxLoad: true,
                tableStyle: 'font-size:14px;',
                loadURL: url,
                check: false,
                columns: columns,
                gridContainer: 'table_2',
                toolbarContainer: 'table_t2',
                pageSize: 20,
                tools: '产品配比所需原材料列表',
                tableClass :'table table-border table-bordered table-bg',
                pageSizeLimit: [20, 30, 50],
                onGridComplete: function (data) {
                    var recordCount = data.pager.recordCount;
                    /*if (recordCount === 0) {
                     layer.msg('无查询记录');
                     }*/
                }
            };
            var grid = $.fn.DtGrid.init(options);
            var param = {};
            param.formulaId = id;
            grid.parameters = param;
            grid.load();
            h_dtList = grid;
        } else {
            var param = {};
            param.formulaId = id;
            h_dtList.parameters = param;
            h_dtList.refresh(true);
        }
    }

        <%--//刷新列表--%>
        <%--function gridRefresh() {--%>
            <%--dtList2.grid.parameters = getParams();--%>
            <%--dtList2.grid.refresh(true);--%>
        <%--}--%>

        <%--//查询--%>
        <%--function search() {--%>
            <%--dtList2.grid.parameters = getParams();--%>
            <%--dtList2.grid.pager.nowPage = 1;--%>
            <%--dtList2.grid.refresh(true);--%>
        <%--}--%>
        <%--function getParams() {--%>
            <%--var param = {};--%>
            <%--param.commonlyCalled = $('#commonlyCalled').val();--%>
            <%--param.englishName = $('#englishName').val();--%>
            <%--return param;--%>
        <%--}--%>
        <%--function bindEvent() {--%>
            <%--$('#query').on('click', function () { //查询--%>
                <%--search();--%>
            <%--});--%>
            <%--$('#add_role').on('click', function () { //查询--%>
                <%--layer_show("原材料新增","${ctx}/rawmaterial/add")--%>
            <%--});--%>
        <%--}--%>
        <%--function pageInit() {--%>
            <%--bindEvent();--%>
            <%--//暴露接口--%>
            <%--window.exports = {--%>
                <%--gridRefresh: gridRefresh,--%>
            <%--};--%>
        <%--}--%>

        <%--pageInit();--%>
    function addRow(id) {
        var url = "${ctx}/productFormula/add?id="+id;
        layer_show("原材料添加",url)
    }

    function delRow(id) {
        layer.confirm('确认移除吗？', {
            btn: ['确认','取消'], //按钮
            icon: 5,
            title:"提示"
        }, function(){
            $.ajax({
                url: "${ctx}/productFormula/delete",
                data:{"id":id} ,
                success: function (data) {
                    if (data.code==200) {
                        layer.msg(data.msg, {icon: 6,end:function(){
                            historyList('${ctx}/productFormula/getData2',lodingId);
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