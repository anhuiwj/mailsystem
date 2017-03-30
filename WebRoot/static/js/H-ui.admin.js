/*H-ui.admin.js v2.3.1 date:15:42 2015.08.19 by:guojunhui*/
/*获取顶部选项卡总长度*/
function tabNavallwidth() {
    var taballwidth = 0,
        $tabNav = $(".acrossTab"),
        $tabNavWp = $(".Hui-tabNav-wp"),
        $tabNavitem = $(".acrossTab li"),
        $tabNavmore = $(".Hui-tabNav-more");
    if (!$tabNav[0]) {
        return
    }
    $tabNavitem.each(function (index, element) {
        taballwidth += Number(parseFloat($(this).width() + 60))
    });
    $tabNav.width(taballwidth + 25);
    var w = $tabNavWp.width();
    if (taballwidth + 25 > w) {
        $tabNavmore.show()
    }
    else {
        $tabNavmore.hide();
        $tabNav.css({left: 0})
    }
}

/*左侧菜单响应式*/
function Huiasidedisplay() {
    if ($(window).width() >= 768) {
        $(".Hui-aside").show()
    }
}
function getskincookie() {
    var v = getCookie("Huiskin");
    if (v == null || v == "") {
        v = "default";
    }
    $("#skin").attr("href", $contextPath+"/skin/" + v + "/skin.css");
}
//获取子菜单
function getClidMenu(tree,id){
    var treeArr = new Array();
    for(var i = 0 ; i < tree.length ; i++){
        if(id == tree[i].parentId){
            treeArr.push(tree[i]);
        }
    }
    return treeArr;
}

//初始化菜单树
function menuTreeInit(){
    try{
        if(menuTree){
            var $menuTree = JSON.parse(menuTree);
            var html = "<dl>";
            for(var i = 0 ; i < $menuTree.length ; i++ ){
                if(!$menuTree[i].href){
                    html += '<dt>';
                    html += '<i class="fa '+$menuTree[i].icon+'"></i>&nbsp;'+$menuTree[i].name+'<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>';
                    html += '</dt>';
                    var cl = getClidMenu($menuTree,$menuTree[i].menuId);
                    if(cl.length > 0){
                        html += '<dd>';
                        html += '<ul>';
                        for(var j = 0 ; j < cl.length ; j++){
                            html += '<li>';
                            html += '<a _href="'+$contextPath+cl[j].href+'" href="javascript:void(0)">'+cl[j].name+'</a>';
                            html += '</li>';
                        }
                        html += '</ul>';
                        html += '</dd>';
                    }
                }
            }
            html += '</dl>';
            $('.menu_dropdown').html(html);
        }
    }catch(e){

    }
}

$(function () {
    //getskincookie();
    //layer.config({extend: 'extend/layer.ext.js'});
    Huiasidedisplay();
    var resizeID;
    $(window).resize(function () {
        clearTimeout(resizeID);
        resizeID = setTimeout(function () {
            Huiasidedisplay();
        }, 500);
    });

    $(".Hui-nav-toggle").click(function () {
        $(".Hui-aside").slideToggle();
    });

    menuTreeInit();

    $(".Hui-aside").on("click", ".menu_dropdown dd li a", function () {
        if ($(window).width() < 768) {
            $(".Hui-aside").slideToggle();
        }
    });

    $(".Hui-aside").on("click", ".menu_dropdown a", function () {
        if ($(this).attr('_href')) {
            var bStop = false;
            var bStopIndex = 0;
            var _href = $(this).attr('_href');
            var _titleName = $(this).html();
            var topWindow = $(window.parent.document);
            var show_navLi = topWindow.find("#min_title_list li");
            show_navLi.each(function () {
                if ($(this).find('span').attr("data-href") == _href) {
                    bStop = true;
                    bStopIndex = show_navLi.index($(this));
                    return false;
                }
            });
            if (!bStop) {
                creatIframe(_href, _titleName);
                min_titleList();
            }
            else {
                show_navLi.removeClass("active").eq(bStopIndex).addClass("active");
                var iframe_box = topWindow.find("#iframe_box");
                iframe_box.find(".show_iframe").hide().eq(bStopIndex).show().find("iframe").attr("src", _href);
            }
        }
    });

    function addTag(_href,_titleName){
        var bStop = false;
        var bStopIndex = 0;
        var topWindow = $(window.parent.document);
        var show_navLi = topWindow.find("#min_title_list li");
        show_navLi.each(function () {
            if ($(this).find('span').attr("data-href") == _href) {
                bStop = true;
                bStopIndex = show_navLi.index($(this));
                return false;
            }
        });
        if (!bStop) {
            creatIframe(_href, _titleName);
            min_titleList();
        }
        else {
            show_navLi.removeClass("active").eq(bStopIndex).addClass("active");
            var iframe_box = topWindow.find("#iframe_box");
            iframe_box.find(".show_iframe").hide().eq(bStopIndex).show().find("iframe").attr("src", _href);
        }
    }

    function min_titleList() {
        var topWindow = $(window.parent.document);
        var show_nav = topWindow.find("#min_title_list");
        var aLi = show_nav.find("li");
    };
    function creatIframe(href, titleName) {
        var topWindow = $(window.parent.document);
        var show_nav = topWindow.find('#min_title_list');
        show_nav.find('li').removeClass("active");
        var iframe_box = topWindow.find('#iframe_box');
        show_nav.append('<li class="active"><span data-href="' + href + '">' + titleName + '</span><i></i><em></em></li>');
        tabNavallwidth();
        var iframeBox = iframe_box.find('.show_iframe');
        iframeBox.hide();
        iframe_box.append('<div class="show_iframe"><div class="loading"></div><iframe frameborder="0" src=' + href + '></iframe></div>');
        var showBox = iframe_box.find('.show_iframe:visible');
        showBox.find('iframe').attr("src", href).load(function () {
            showBox.find('.loading').hide();
        });
    }

    var num = 0;
    var oUl = $("#min_title_list");
    var hide_nav = $("#Hui-tabNav");
    $(document).on("click", "#min_title_list li", function () {
        var bStopIndex = $(this).index();
        var iframe_box = $("#iframe_box");
        $("#min_title_list li").removeClass("active").eq(bStopIndex).addClass("active");
        iframe_box.find(".show_iframe").hide().eq(bStopIndex).show();
    });
    $(document).on("click", "#min_title_list li i", function () {
        var aCloseIndex = $(this).parents("li").index();
        $(this).parent().remove();
        $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
        num == 0 ? num = 0 : num--;
        tabNavallwidth();
    });
    $(document).on("dblclick", "#min_title_list li", function () {
        var aCloseIndex = $(this).index();
        var iframe_box = $("#iframe_box");
        if (aCloseIndex > 0) {
            $(this).remove();
            $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
            num == 0 ? num = 0 : num--;
            $("#min_title_list li").removeClass("active").eq(aCloseIndex - 1).addClass("active");
            iframe_box.find(".show_iframe").hide().eq(aCloseIndex - 1).show();
            tabNavallwidth();
        } else {
            return false;
        }
    });
    tabNavallwidth();

    $('#js-tabNav-next').click(function () {
        num == oUl.find('li').length - 1 ? num = oUl.find('li').length - 1 : num++;
        toNavPos();
    });
    $('#js-tabNav-prev').click(function () {
        num == 0 ? num = 0 : num--;
        toNavPos();
    });

    function toNavPos() {
        oUl.stop().animate({'left': -num * 100}, 100);
    }

    /*换肤*/
    $("#Hui-skin .dropDown-menu a").click(function () {
        var v = $(this).attr("data-val");
        setCookie("Huiskin", v);
        $("#skin").attr("href", "skin/" + v + "/skin.css");
    });

    $('#updatePassword').on('click',function(){
        var html =  '<div class="text-l pd-20">'+
            '<p>旧密码：&nbsp;&nbsp;&nbsp;<input id="oldp" type="password" style="width: 180px" class="input-text"></p>'+
            '<p>新密码：&nbsp;&nbsp;&nbsp;<input id="newp" type="password" style="width: 180px" class="input-text"></p>'+
            '<p>重复密码：<input type="password" id="rnewp" style="width: 180px" class="input-text"></p>'+
            '<p class="mt-20 text-c"><button id="up"  class="btn btn-primary mr-20 radius">提交</button><button id="cl" class="btn ml-20 btn-default radius">取消</button></p>'+
            '</div>';
        var index = layer.open({
            title:'修改密码',
            type: 1,
            skin: 'layui-layer-demo', //样式类名
            shift: 2,
            shadeClose: true, //开启遮罩关闭
            content: html
        });

        $('#cl').on('click',function(){
            layer.close(index);
        });

        $('#up').on('click',function(){
            if(user && typeof user === 'string'){
                user = JSON.parse(user);
            }
            var parm = {};
            parm.userId = user.userId;
            parm.oldPassword = $('#oldp').val();
            parm.newPassword = $('#newp').val();

            if(!parm.oldPassword){
                layer.tips('旧密码不能为空！', '#oldp',{tips: [2, '#3595CC']});
                return;
            }

            if(!parm.newPassword){
                layer.tips('新密码不能为空！', '#newp',{tips: [2, '#3595CC']});
                return;
            }

            if($('#rnewp').val() != parm.newPassword){
                layer.tips('两次输入密码不一致！', '#newp',{tips: [2, '#3595CC']});
                return;
            }

            $.ajax({
                url: $contextPath+'/basicInfo/user/update/password',
                data: parm,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if(data.code == 0){
                        layer.alert('修改成功！', {
                            skin: 'layui-layer-lan'
                            ,closeBtn: 0
                            ,shift: 5
                        });
                    }else if(data.code == 1000){
                        layer.alert('旧密码输入错误！', {
                            skin: 'layui-layer-lan'
                            ,closeBtn: 0
                            ,shift: 5
                        });
                    }else{
                        layer.alert('修改失败！', {
                            skin: 'layui-layer-lan'
                            ,closeBtn: 0
                            ,shift: 5
                        });
                    }
                },
                error: function (e) {
                    layer.alert('修改失败！', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,shift: 5
                    });
                }
            });

        });
    });

    $('#userinfo').on('click',function(){
        if(user && typeof user === 'string'){
            user = JSON.parse(user);
        }

        var html =  '<div class="text-l pd-20">'+
            '<p>用户名：&nbsp;&nbsp;&nbsp;<input id="username" type="text" value="'+user.username+'" style="width: 180px" class="input-text"></p>'+
            '<p class="mt-20 text-c"><button id="up"  class="btn btn-primary mr-20 radius">提交</button><button id="cl" class="btn ml-20 btn-default radius">取消</button></p>'+
            '</div>';

        var index = layer.open({
            title:'用户信息修改',
            type: 1,
            skin: 'layui-layer-demo', //样式类名
            closeBtn: 0, //不显示关闭按钮
            shift: 2,
            shadeClose: true, //开启遮罩关闭
            content: html
        });

        $('#cl').on('click',function(){
            layer.close(index);
        });

        $('#up').on('click',function(){
            var parm = {};
            parm.userId = user.userId;
            parm.username = $('#username').val();

            if(!parm.username){
                layer.tips('用户名不能为空！', '#username',{tips: [2, '#3595CC']});
                return;
            }

            $.ajax({
                url: $contextPath+'/basicInfo/user/update/info',
                data: parm,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if(data.code == 0){
                        layer.msg('修改成功！');
                        layer.close(index);
                        user.username = parm.username;
                        $('#wdTitle').html(parm.username+'<i class="Hui-iconfont">&#xe6d5;</i>')
                    }else{
                        layer.msg('修改失败！');
                    }
                },
                error: function (e) {
                    layer.alert('修改失败！', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,shift: 5
                    });
                }
            });

        });
    });

    window.addTag = addTag;
});
/*弹出层*/
/*
 参数解释：
 title	标题
 url		请求的url
 id		需要操作的数据id
 w		弹出层宽度（缺省调默认值）
 h		弹出层高度（缺省调默认值）
 */
function layer_show(title, url, w, h,isfull) {
    if (title == null || title == '') {
        title = false;
    }
    ;
    if (url == null || url == '') {
        url = "404.html";
    }
    ;
    if (w == null || w == '') {
        w = 800;
    }
    ;
    if (h == null || h == '') {
        h = ($(window).height() - 50);
    }
    ;
    var index = layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: url
    });

    if(isfull){
        layer.full(index);
    }
}
/*关闭弹出框口*/
function layer_close() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

function yearList(){ //当前年限往后推100年
    var nowYear = new Date().getFullYear();
    var yearList = [];
    for(var i = 0 ; i < 100 ; i++){
        yearList.push(nowYear);
        nowYear--;
    }
    return yearList;
}

/*年限下拉菜单*/
function yearDown(id,next){
    var yearlist = yearList();
    var html = '';
    if(!next){
        html = '<option value="" selected>请选择年度</option>';
    }else{
        html = '<option value="" >请选择年度</option>';
    }
    for(var i = 0 ; i < yearlist.length ; i++){
        if(next){
            if(i == 1){
                html += '<option selected value="'+yearlist[i]+'">'+yearlist[i]+'</option>';
            }else{
                html += '<option value="'+yearlist[i]+'">'+yearlist[i]+'</option>';
            }
        }else{
            html += '<option value="'+yearlist[i]+'">'+yearlist[i]+'</option>';
        }
    }
    $("#"+id).html(html);
}
