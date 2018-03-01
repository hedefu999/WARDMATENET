<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>证据内容</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/bootstrap/treeview/bootstrap-treeview.min.css"/>
    <link rel="stylesheet" href="/css/common/navbar.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <style type="text/css">
        .colorgraph {margin:0;height: 5px;border-top: 0;background: #c4e17f;border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
        #titleBar{width:100%;clear: both;background: #eee;border-bottom: 1px solid #ddd;box-shadow: 2px 2px 2px #ccc;text-align: center;margin: 0;}
        #titleBar .title h4{color:#008080;font-size:2.5rem;}
        #titleBar .toolBar{float: right;line-height: 4rem;margin-right: 4rem;}
        /*被引页面样式*/
        #contentDiv{padding: 0 2rem;}
        #contentDiv .content{overflow: auto;}
        #contentDiv .menuwrapper{overflow: auto;}
        #contentDiv h2{color: #008080;}
        #contentDiv h3{color: #428bca;}
        #contentDiv h4{color: #c4e17f;}
        #contentDiv h5{color: #fecf71;}

    </style>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<hr class="colorgraph">
<div id="titleBar" class="row">
    <div class="col col-xs-3 title">
        <h4>证据正文</h4>
    </div>
    <div class="col col-xs-9">
        <div class="toolBar">
            <a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;
            <a href="#"><i class="fa fa-thumbs-o-up"></i>&nbsp;此内容有帮助</a>&emsp;
            <a href="#"><i class="fa fa-commenting-o"></i>&nbsp;评价此文章</a>&emsp;
            <a href="#"><i class="fa fa-share-alt"></i>&nbsp;复制文章链接</a>
        </div>
    </div>
</div>
<jsp:include page="evidencepages/${contentId}.jsp" flush="true"/>
</body>
<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/bootstrap/bootstrap.min.js"></script>
<script src="/assets/bootstrap/treeview/bootstrap-treeview.min.js" type="text/javascript"></script>
<script>
    var articlemenu;
    //generate a treeview
    $('#contentmenu').treeview({
        color: "#428bca",
        expandIcon: 'fa fa-chevron-circle-right',
        collapseIcon: 'fa fa-chevron-circle-down',
        nodeIcon: 'fa fa-bookmark-o',
        enableLinks:true,
        data: articlemenu
    });
    var windowHeight = $(window).height();
    var documentHeight = $(document).height();
    $('#contentDiv .content').css('height',windowHeight);
    $('#contentDiv .menuwrapper').css('height',windowHeight);

    var fixTitleBar = function () {
        var titleBar = $('#titleBar');
        $(titleBar).css('z-index',10);
        var titleBarTop = $(titleBar).offset().top;


        $.event.add(window,'scroll',function () {
            var scrolldistance = $(window).scrollTop();
            if(scrolldistance > titleBarTop){
                $(titleBar).css('position','fixed').css('top',0);
            }else{
                $(titleBar).css('position','').css('top','');
            }
        });
    }
    fixTitleBar();

</script>

</html>
