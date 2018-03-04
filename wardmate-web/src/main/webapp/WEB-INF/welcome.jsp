<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>主页</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css" type="text/css"/>
    <link rel="stylesheet" href="/css/welcome.css" type="text/css"/>
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
</head>
<body>
<%@include file="common/navbar.jsp"%>
<div id="index_banner">
    <img class="img-responsive bannerimg" src="/image/welcome/tempbanner.png" alt="医生" >
    <div class="bannerscreen"></div>
    <div class="bannerinstru container">
        <div class="row">
            <div class="col-sm-6"></div>
            <div class="col-xs-12 col-sm-6 bannertitle"><span>基于循证医学的病友网</span></div>
        </div>
        <div class="row">
            <div class="col-sm-6"></div>
            <div class="col-xs-12 col-sm-6 bannerlink">
                <%--判断值栈中是否有user信息，值栈操作在userAction中--%>
                <c:set var="LOGIN_USER_NAME" scope="session" value="${sessionScope.LOGIN_USER_NAME}"/>
                <c:choose>
                    <c:when test="${LOGIN_USER_NAME != null}">
                        <h3>您好！&emsp;<a href="/welcome/gotoUserProfile/${sessionScope.LOGIN_USER.id}">${LOGIN_USER_NAME}</a>&emsp;<small><a href="/logout" class="logout">登出</a></small></h3>
                    </c:when>
                    <c:when test="${LOGIN_USER_NAME == null}">
                        <a href="/logon">注册</a>&emsp;&emsp;
                        <a href="/login">登录</a>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="bannerdesc"><span>为您提供可靠临床证据的患者关怀家园</span></div>
</div>
<div id="instruction" class="tab1">
    <div class="title">
        <h2>「让循证医学走近患者」</h2>
        <p>循证医学理念与病友社区的结合</p>
    </div>
    <div class="row detail">
        <%--此部分内容使用js填充--%>
        <%--病友网基于患者用户需求，提供经过循证评价的医学信息，科学权威、及时更新，值得卫生工作者在内的人群采纳，是您了解医疗措施效度等相关信息的资源库。--%>
    </div>
</div>
<div id="entryButton" class="row">
    <div class="wrapper" style="float: top;">
    <div class="col-xm-6 col-sm-6 col-md-3 col">
        <a href="/knowledge/index"><img class="img-responsive" src="/image/welcome/index10.png"><span>循证医学</span></a>
    </div>
    <div class="col-xm-6 col-sm-6 col-md-3 col">
        <a href="/evidence/index"><img class="img-responsive" src="/image/welcome/index09.png"><span>医学证据</span></a>
    </div>
    <div class="col-xm-6 col-sm-6 col-md-3 col">
        <a href="/community/index"><img class="img-responsive" src="/image/welcome/index11.png"><span>病友社区</span></a>
    </div>
    <div class="col-xm-6 col-sm-6 col-md-3 col">
        <a href="/management/index"><img class="img-responsive" src="/image/welcome/index08.png"><span>我的健康</span></a>
    </div>
    </div>
</div>
<div id="myapps" class="row">
    <div class="col col-xs-6"><img class="img-responsive" src="/image/welcome/appCons.png"><a href="http://123.207.239.163:8080/myapps/ConstitutionGenius.apk">体质精灵</a></div>
    <div class="col col-xs-6"><img class="img-responsive" src="/image/welcome/appDiabetes.png"><a href="http://123.207.239.163:8080/myapps/T2DMRelativeRiskEvaluation.apk">糖尿病患病风险评估</a></div>
</div>
<div class="footer" style="text-align: center;">本站内容仅供学术交流，不向您承诺任何服务。</div>

<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/layer/layer.js" type="text/javascript"></script>
<script src="/javascript/welcome.js" type="text/javascript"></script>

<!--下面是CDN引用方式,项目发布时替换使用-->
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script> -->
<!--<script src="https://use.fontawesome.com/2ad4a91487.js"></script>-->
<!--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
</body>
</html>
