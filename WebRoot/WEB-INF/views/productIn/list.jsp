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
    <span class="c-gray en">&gt;</span> 进货管理
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray">
        <div class="j_hform">
            <%--<p style="padding-left:30px;">--%>
                <%--<input id="ID" type="text" class="input-text" placeholder="企业名称" style="width:300px;"onkeyup=this.value=this.value.replace(/[$_%?*'"\s]/ig,'')>&nbsp;--%>
            <%--</p>--%>
            <p>
                <label>俗称：</label>
                <input type="text" style="width:109px;" class="input-text" id="rawMaterName" name="rawMaterName" >
            </p>
            <p>

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
        <strong>进货管理列表</strong><p class="tbl_header_r">
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
                {id: 'rawMaterName', title: '原料俗称', type: 'string', columnClass: 'text-center'},
                {id: 'inNum', title: '存量', type: 'string', columnClass: 'text-center'},
                {id: 'inUser', title: '进货人', type: 'string', columnClass: 'text-center'},
                {id: 'inDateString', title: '进货时间',type:'string',columnClass: 'text-center'},
                {id: 'id', title: '操作', type: 'string',codeTable:whether, columnClass: 'text-center',
                    resolution:function(value, record, column, grid, dataNo, columnNo){
                    var content = '';
                            content += '<input onclick="editRow(\''+record.id+'\');" value="添加库存" class="btn btn-primary size-MINI radius" type="button">';
                        return content;
                    }
                }
            ];

            var options = {
                lang: 'zh-cn',
                ajaxLoad : true,
                tableStyle: 'font-size:14px;',
                loadURL: "${ctx}/productIn/getData",
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
            param.rawMaterName = $('#rawMaterName').val();
            return param;
        }
        function bindEvent() {
            $('#query').on('click', function () { //查询
                search();
            });
            $('#add_role').on('click', function () { //查询
               layer_show("原材料进货","${ctx}/productIn/add")
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
        var url = "${ctx}/productIn/add?id="+id;
        layer_show("原材料进货",url)
    }
</script>

</body>
</html>