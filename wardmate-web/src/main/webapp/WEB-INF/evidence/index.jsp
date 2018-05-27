<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 15/10/2017
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>医疗查证</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <style>
        .colorgraph {margin:0;height: 5px;border-top: 0;background: #c4e17f;border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
        #searchTool{width: 80%;margin-left: auto;margin-right: auto;padding:8rem 8rem 4rem 8rem;}
        #searchTool .title{font-size: 5rem;font-weight: lighter; text-align: center; margin:auto;color: #008080;}
        #searchTool .vicetitle{width:80%;font-size:3rem;font-weight:lighter;text-align:right;margin:1rem;color: #008080;}
        #searchTool .body{width:80%;margin: 5rem auto 8rem auto;padding:1rem 2rem;}
        select{height: 4rem;margin:0 2rem;font-size: 2rem;border: none;background: none;}
    </style>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<hr class="colorgraph">
<div id="searchTool">
    <div class="header">
        <p class="title">病友网循证搜索</p>
        <p class="vicetitle">— — 您可信赖的证据库</p>
    </div>
    <%--表单标签会影响布局，将form放到最外层不会破坏布局--%>
    <form:form id="search" action="/evidence/queryEvidence" method="get" modelAttribute="simpleQueryObject">
        <div class="input-group body">
            <div class="input-group-addon btn btn-default" style="padding: 0;">
                <form:select path="fieldCode">
                    <c:forEach items="${searchFieldMap}" var="field">
                        <form:option value="${field.key}" label="${field.value}"/>
                    </c:forEach>
                </form:select>
            </div>
            <form:input path="searchTerm" class="form-control input-lg keywords"/>
            <input type="hidden" value="3" name="menuIndex">
            <div class="btn btn-primary input-group-addon" onclick="submit()" style="font-size: 2rem;">
                <i class="fa fa-search">&emsp;搜   索</i>
            </div>
        </div>
    </form:form>

    <div class="footer">
        <div class="col-xs-3 col-md-3"><img src="/image/evidence/ebme01.png" class="img-responsive"></div>
        <div class="col-xs-9 col-md-9 right">
            <h3 class="text-primary">查证用证</h3>
            <p class="lead">检索有关疾病的临床干预措施及其评价证据,包括临床用药、诊治技术、医疗器械等。<br>&emsp;&emsp;全球医疗工作者和科研人员的精心研究，为我们生产了大量循证证据，包括临床指南、系统评价和荟萃分析等，是您值得信赖的医疗信息源。经过我们的精心整理、设计，为广大患者提供了一个可靠的循证医疗信息服务平台。</p>
        </div>
    </div>
</div>
<form method="get" action="http://www.tripdatabase.com/search" style="margin-left: auto;margin-right: auto;width: 100%;">
    <input type="text" name="criteria" placeholder="使用trip数据库" style="width:400px" />
    <input type="submit" value="搜索"/>
</form>
<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script>
    function submit() {
        var keyword = $('.body .keywords').val();
        if(keyword != null && keyword.length != 0){
            $('#search').submit();
        }
    }

</script>
</body>
</html>
