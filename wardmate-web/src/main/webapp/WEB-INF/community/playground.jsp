<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 12/10/2017
  Time: 3:41 PM
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
    <title>病友大厅</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <link rel="stylesheet" href="/css/common/navbar.css"/>
    <link rel="stylesheet" href="/css/common/submenu.css"/>
    <style type="text/css">
        #patientsGroups .groupWrapper{padding: 0.5rem;}
        #patientsGroups .patientGroup{height: 16rem;background-color: #eee;border: 1px solid #ddd;border-radius: 4px;padding-left: 2rem;}
        #patientsGroups .patientGroup h3{display: inline-block;margin-left: 2rem;}
    </style>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
    <%@include file="/WEB-INF/community/submenu.jsp"%>
    <div class="row">
        <div id="patientsGroups" class="col-sm-8">
            <h2>病友群</h2>
            <c:forEach items="${imGroups}" var="imGroup" varStatus="index">
                <div class="col-sm-6 groupWrapper">
                    <div class="patientGroup">
                        <img src="${imGroup.avatarURL}">
                        <h3><i class="fa fa-medkit">&nbsp;&nbsp;${imGroup.name}</i></h3><br>
                        <span>${imGroup.desc}</span>
                        <a class="btn btn-primary" href="#">已加入</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-sm-4">
            <h2>相似病情患者</h2>
            <div>
                <span>用户A</span><hr>
                <span>用户B</span><hr>
                <span>用户C</span><hr>
                <span>用户D</span><hr>
            </div>
        </div>
    </div>
</div>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
    <h2>病友热点事件</h2>
    <a class="btn btn-default" href="#">刷新</a>
</div>







<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--<script src="/assets/neteaseim/NIM_Web_SDK_v4.1.0.js" type="text/javascript"></script>--%>
<%--<script src="/assets/neteaseim/nimconfig.js" type="text/javascript"></script>--%>
<script type="text/javascript">
//    var nim = SDK.NIM.getInstance({
//        appKey:mainCon.appKey,
//        account:mainCon.account,
//        token:mainCon.token,
//        db:false,//不开启数据库
//        onconnect:onConnect,
//        onerror:onError,
//    });
//     function onConnect(obj) {
//         $('#teamsList').html(obj.ip);
//     }
//    function onError(error) {
//
//    }
    var colheight = $('#vicemenu .col').height();
    $('#vicemenu .userentrance .avatar').css("height",colheight);
</script>
</body>
</html>
