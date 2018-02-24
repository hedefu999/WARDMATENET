<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        #patientsGroups .patientGroup{height: 16rem;background-color: #eee;border: 1px solid #ddd;border-radius: 4px;padding-left: 2rem;position: relative;}
        #patientsGroups .patientGroup h3{display: inline-block;margin-left: 2rem;}
        #patientsGroups .patientGroup button{position: absolute;top:85%;left: 89%;transform: translate(-50%,-50%);}
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
                        <c:choose>
                            <c:when test="${fn:contains(requestScope.myGroupIds,imGroup.id)}">
                                <button class="btn btn-primary" imGroupId="${imGroup.id}" status="joined">已加入</button>
                            </c:when>
                            <c:when test="${! fn:contains(requestScope.myGroupIds,imGroup.id)}">
                                <button class="btn btn-default" imGroupId="${imGroup.id}" status="tourist">加入</button>
                            </c:when>
                        </c:choose>
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
<script src="/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    var currentUserId = ${sessionScope.LOGIN_USER_ID};
    var colheight = $('#vicemenu .col').height();
    $('#vicemenu .userentrance .avatar').css("height",colheight);
    $('#patientsGroups .patientGroup button').click(function () {
        var groupId = $(this).attr('imGroupId');
        var _this = this;
        $(_this).attr("disabled","disabled");
        var layerloader = layer.load(2);
        $.post(
            '/community/joinOrLeaveGroup',
            {currentUserId:currentUserId,groupId:groupId},
            function (result) {
                var resultJson = JSON.parse(result);
                setTimeout(function () {
                    layer.close(layerloader);
                    layer.msg(resultJson.message);
                    if(resultJson.operation == 'join'){
                        $(_this).html('已加入').removeClass().addClass('btn btn-primary');
                    }else if(resultJson.operation == 'leave'){
                        $(_this).html('加群').removeClass().addClass('btn btn-default');
                    }
                    $(_this).removeAttr("disabled");
                },300);
        });
    });
</script>
</body>
</html>
