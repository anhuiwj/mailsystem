<script type="text/javascript" src="${ctxStatic}/lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/dtGrid/1.1.9/dependents/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/dtGrid/1.1.9/jquery.dtGrid.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/dtGrid/1.1.9/i18n/en.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/dtGrid/1.1.9/i18n/zh-cn.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctxStatic}/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/layui/layui.js" ></script>
<script type="text/javascript">
    jQuery(function($){
        // 备份jquery的ajax方法
        var _ajax=$.ajax;
        // 重写ajax方法，先判断登录在执行success函数
        $.ajax=function(opt){
            var _success = opt && opt.success || function(a, b){};
            var _opt = $.extend(opt, {
                success:function(data, textStatus,request){
                    // 如果后台将请求重定向到了登录页，则data里面存放的就是登录页的源码，这里需要找到data是登录页的证据(标记)
                        if(request.getResponseHeader("Session-Status") == "timeout") {
                            window.parent.location.href = "/login";
                            return;
                        }
                    _success(data, textStatus);
                }
            });
           return  _ajax(_opt);
        };
    });
</script>