<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 21/09/2017
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>循证医学</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <link rel="stylesheet" href="/css/knowledge/glossary.css?v=20180207" type="text/css"/>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
        <%@include file="submenu.jsp"%>
        <div id="topNews" class="carousel slide knowledge">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row banner">
                        <div class="col col-xs-4"><img class="img-responsive" src="/image/knowledge/evimedbanner.jpg"></div>
                        <div class="col col-xs-8">
                            <h3><a>卫生技术评估</a></h3><p>卫生技术包括药物、医疗器械、卫生材料、医疗方案、医学信息系统、后勤支持系统和行政管理体系等。卫生技术评估是指对卫生技术的技术特性、临床安全性、有效性（效能、效果和生存质量）、经济学特性（成本-效果、成本-效益、成本-效用）和社会适应性进行全面系统的评价。</p>
                            <div style="float:right;"><a>研究人员A</a>&emsp;<a>2017-09-18</a>&emsp;<a>[最新术语解释]</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="row banner">
                        <div class="col col-xs-4"><img class="img-responsive" src="/image/knowledge/knowledge01.jpg"></div>
                        <div class="col col-xs-8">
                            <h3><a>卫生技术评估</a></h3><p>卫生技术包括药物、医疗器械、卫生材料、医疗方案、医学信息系统、后勤支持系统和行政管理体系等。卫生技术评估是指对卫生技术的技术特性、临床安全性、有效性（效能、效果和生存质量）、经济学特性（成本-效果、成本-效益、成本-效用）和社会适应性进行全面系统的评价。</p>
                            <div style="float:right;"><a>研究人员A</a>&emsp;<a>2017-09-18</a>&emsp;<a>[最新术语解释]</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control left" href="#topNews" data-slide="prev"></a>
            <a class="carousel-control right" href="#topNews" data-slide="next"></a>
        </div><!-- topNews -->

        <div id="locator">
            <div class="col col-xs-6">
                <span><a href="#">A</a>&emsp;
                <a href="#">B</a>&emsp;<a href="#">C</a>&emsp;<a href="#">D</a>&emsp;<a href="#">E</a>&emsp;
                <a href="#">F</a>&emsp;<a href="#">G</a>&emsp;<a href="#">H</a>&emsp;<a href="#">I</a>&emsp;
                <a href="#">J</a>&emsp;<a href="#">K</a>&emsp;<a href="#">L</a>&emsp;<a href="#">M</a>&emsp;
                <a href="#">N</a></span>
            </div>
            <div class="col col-xs-6">
                <%--查询表单用于存放筛选条件字段和通过JS赋值的隐藏域：页码--%>
                <%--分页按钮可能位于表单外部--%>
                <%--复杂筛选条件应放置于modelAttribute中的query view object--%>
                <form:form id="queryForm" action="/knowledge/queryKnowledgeCard#glossary" modelAttribute="queryConditions">
                    <form:input type="hidden" path="pageIndex" name="pageIndex"/>
                    <%--传入V表示全部--%>
                    按汉语拼音首字母查找：<form:input path="firstPhoneticLetter" type="hidden" value="V"/>
                    <form:input path="keyword"/>
                    <button onclick="doQuery(1)">搜索术语</button>
                </form:form>
            </div>
            <div class="col col-xs-12"><%@ include file="/WEB-INF/common/pagenavigator.jsp"%></div>
        </div>
        <div id="glossary" class="knowledge">
            <c:forEach items="${knowledgeCards}" var="card" varStatus="index">
                <div class="card">
                    <h4>${card.title}</h4>
                    <hr><p>${card.content}</p>
                    <img src="${card.image}" class="img img-responsive">
                    <div class="cardFooter">
                        <a class="favourite" href="#"><i class="fa fa-star-o"></i>&nbsp;收藏到笔记</a>&emsp;
                        <a class="share" href="#"><i class="fa fa-share"></i>&nbsp;分享</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="getMoreCard"><a href="$" class="more">加载更多</a></div>
    </div>
</div>
<%@include file="/WEB-INF/common/saveSnippet.jsp"%>
<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/cascadefluid/masonry.pkgd.min.js" type="text/javascript"></script>
<script>
    $(function () {
        var pageSize = 6;
        $('#navbar .nav li:nth-child(2)').addClass('active');
        $('#topNews').carousel('pause');//暂停顶部栏滚动
        $('#glossary').masonry({
            // options
            itemSelector: '.card',
            gutter: 0,//间距改为0，在CSS中使用百分比设置
            percentPosition: true, //使用百分比宽度，保持弹性缩放、居中
            horizontalOrder: true //水平从左至右排列，false表示保持底部最平滑
        });
        $("#getMoreCard .more").click(function () {
            if($(this).attr('href') != '#'){
                //获取要查询的分页序号
                var currentIndex = $('#pageIndex').val();
                var conditions = {
                    pageIndex : ++currentIndex,
                    keyword:'循证医学',
                    firstPhoneticLetter:'V'
                };
                var _this = this;
                $.ajax({
                    url : '/knowledge/getMoreCard',
                    type : 'post',
                    contentType : "application/json;charset=UTF-8",
                    data : JSON.stringify(conditions),
                    success:function (result) {
                        $('#pageIndex').val(currentIndex);
                        var cards = JSON.parse(result);
                        $.each(cards,function(index,element){
                            var card = '<div class="card">'+
                                '<h4>'+element.title+'</h4>'+
                                '<hr><p>'+element.content+'</p>'+
                                '<img src="'+element.image+'" class="img img-responsive">'+
                                '<div class="cardFooter">'+
                                '<a class="favourite" href="#"><i class="fa fa-star-o"></i>&nbsp;收藏到笔记</a>&emsp;<a class="share" href="#"><i class="fa fa-share"></i>&nbsp;分享</a>'+
                                '</div>'+
                                '</div>';
                            //masonry(砖石结构)插件动态添加内容，需要将html字符串先转换成jquery对象在传入
                            //使用方法见：https://masonry.desandro.com/methods.html
                            var $element = $(card);
                            $('#glossary').append($element).masonry( 'appended',$element);
                        });
                        if (cards.length < pageSize){
                            $(_this).html('没有更多了').attr('href','#');
                        }
                    }
                });
            }
            return false;
        });
    });
    function doQuery(index) {
        $('#pageIndex').val(index);
        $('#queryForm').submit();
    }

</script>
</body>
</html>
