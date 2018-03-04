<%--被引入页面加这一句可防止乱码--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
<style>
    html {font-size: 62.5%;}
    body {font-size: 1.6rem;font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, simsun, sans-serif;}
    #navbar{margin-bottom: 0; }
    #navbar #navbar-logo {padding: 0.4rem;margin: 0 3rem; }
    #navbar #navbar-logo img{height: 4.4rem;}
    #navbar .navbar-brand{font-size: 3rem;color: #008080;}
    .navbar-default .navbar-nav>li>a {height: 5rem;}
</style>
<nav id="navbar" class="navbar navbar-default navabr-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a id="navbar-logo" class="navbar-brand" href="/welcome?menuIndex=1"><img src="/image/welcome/logo.png" alt="病友网"></a>
            <a href="/welcome?menuIndex=1" class="navbar-brand">病 友 网</a>
            <!--移动设备上显示-->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/welcome?menuIndex=1"><i class="fa fa-home" aria-hidden="true">&nbsp;首  页</i></a></li>
                <li><a href="/knowledge/index?submenuIndex=1&menuIndex=2"><i class="fa fa-book" aria-hidden="true"></i>&nbsp;循证医学</a></li>
                <li><a href="/evidence/index?menuIndex=3"><i class="fa fa-search" aria-hidden="true">&nbsp;医疗查证</i></a></li>
                <li><a href="/community/index?submenuIndex=1&menuIndex=4"><i class="fa fa-group" aria-hidden="true">&nbsp;病友社区</i></a></li>
                <li><a href="/management/index?submenuIndex=1&menuIndex=5"><i class="fa fa-vcard" aria-hidden="true">&nbsp;健康管理</i></a></li>
            </ul>
        </div>
    </div> <!--container-->
</nav>
<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    var menuIndex = ${param.menuIndex};
    $('.nav li:nth-child('+menuIndex+')').addClass('active');
</script>
