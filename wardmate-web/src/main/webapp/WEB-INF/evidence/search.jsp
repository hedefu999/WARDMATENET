<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>证据检索</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/bootstrap/treeview/bootstrap-treeview.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <link rel="stylesheet" href="/css/common/navbar.css"/>
    <link rel="stylesheet" href="/css/evidence/search.css?v=20180224"/>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<hr class="colorgraph">
<%--缺少class row将使得外层容器没有高度--%>
<div id="searchBar" class="row">
    <div class="col-xs-5 col-sm-3">
        <span>病友网循证搜索&emsp;</span>
    </div>
    <div class="col-xs-7 col-sm-5">
        <form:form id="search" action="/evidence/queryEvidence" method="get" modelAttribute="simpleQueryObject">
            <div class="input-group">
                <div class="input-group-addon btn btn-default" style="padding: 0;">
                    <form:select path="fieldCode">
                        <c:forEach items="${searchFieldMap}" var="field">
                            <form:option value="${field.key}" label="${field.value}"/>
                        </c:forEach>
                    </form:select>
                </div>
                <form:input path="searchTerm" class="form-control keywords"/>
                <div class="btn btn-primary input-group-addon" onclick="submit()">
                    <i class="fa fa-search">&emsp;搜   索</i>
                </div>
            </div>
        </form:form>
    </div>
</div>
<div id="searchResults">
    <div class="col-xs-12 col-sm-3 col-md-3 screener">
        <h4>分类筛选:</h4>
        <form:form action="" modelAttribute="">
        <div class="panel panel-default">
            <div class="panel-heading"><h4 class="panel-title">
                <a href="#typeScreener" data-toggle="collapse" class="">证据类型&emsp;&emsp;<i class="fa fa-arrow-down"></i></a>
            </h4></div>
            <div id="typeScreener" class="panel-collapse collapse in"><div class="panel-body">
                <div class="checkbox-group">
                    <form:checkboxes items="evidenceTypes" path=""/>
                    <%--<label class=""><input type="checkbox" value="option1" checked><strong>&nbsp;临床指南</strong></label>--%>
                </div>
            </div></div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading"><h4 class="panel-title">
                <a href="#updateTimeScreener" data-toggle="collapse" class="collapsed">发布日期&emsp;&emsp;<i class="fa fa-arrow-down"></i></a>
            </h4></div>
            <div id="updateTimeScreener" class="panel-collapse collapse"><div class="panel-body">
                <div class="radio-group">
                    <form:checkboxes path="years" items="yearMap">
                        <form:checkbox
                    </form:checkboxes>
                    <label class=""><input type="radio" value="option3" name="myradio"><strong> — 2017 — </strong></label>
                    <label class=""><input type="radio" value="option1" name="myradio"><strong> — 近3年 — </strong></label>
                    <label class=""><input type="radio" value="option2" name="myradio" checked="checked"><strong> — 近5年 — </strong></label>
                </div>
            </div></div>
        </div>
        </form:form>
    </div>
    <div class="col-xs-12 col-sm-9 col-md-9 evidenceList">
        <c:forEach items="${evidenceList}" var="evidence">
            <div class="itemborder ${evidence.className}border">
                <h4><a href="/evidence/getContent/${evidence.contentLink}">${evidence.title}</a></h4>
                <span>${evidence.summary}</span>
                <div class="itemfoot">
                    来源：<span>${evidence.source}</span>
                    <span class="itemtype ${evidence.className}">${evidence.type}</span>
                    <span class="date"><fmt:formatDate value="${evidence.updateTime}" pattern="yyyy-MM-dd"/></span>
                </div>
            </div>
        </c:forEach>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <ul class="pagination">
            <li><a href="#">«上一页</a></li><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li><a href="#">下一页»</a></li>
        </ul>
    </div>
</div>
<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/icheck/icheck.min.js"></script>
<script type="text/javascript" src="/javascript/utils/formatdate.js"></script>
<script type="text/javascript" src="/javascript/evidence/search.js"></script>
</body>
</html>
