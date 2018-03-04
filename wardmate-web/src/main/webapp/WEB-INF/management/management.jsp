<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 07/10/2017
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>健康管理</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/management/healman.css" type="text/css"/>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<div class="row">
    <div id="vicemenu">
        <div class="row">
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-primary" href="#"><i class="fa fa-braille" aria-hidden="true">&nbsp;健康记录</i></a></div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-cubes" aria-hidden="true">&nbsp;疾病百科</i></a></div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-info-circle" aria-hidden="true">&nbsp;药物信息</i></a></div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-medkit" aria-hidden="true">&nbsp;健康计划</i></a></div>
            <div class="col-xs-0 col-sm-4 col-md-4 col"><div class="userentrance"><a href="#"> <img class="avatar" src="/image/community/avatar.png">${requestScope.LOGIN_USER_NAME}</a><a href="#">&emsp;<i class="fa fa-vcard-o" aria-hidden="true">&nbsp;账户设置</i> </a></div></div>
        </div>
    </div><!-- vicemenu -->
    <div class="col col-xs-9">
        <div class="healthCard">个人健康展示</div>
        <div class="timeMachine">时光机记录</div>
        <div class="statitics">实时统计显示</div>
    </div>
    <div class="col col-xs-3">
        <h2>病友推荐</h2>
        <h2>药物推荐</h2>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">

        <img src="/image/management/healman_fake.png" class="img-responsive" style="width: 100%;">
    </div>
</div>




<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script>
    $('#navbar .nav li:nth-child(5)').addClass('active');
    var colheight = $('#vicemenu .col').height();
    $('#vicemenu .userentrance .avatar').css("height",colheight);
</script>
</body>
</html>
