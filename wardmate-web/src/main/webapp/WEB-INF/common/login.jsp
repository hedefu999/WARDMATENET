<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 08/10/2017
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>病友网登录</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <style type="text/css">
        html {font-size: 62.5%;}
        body {font-size: 1.6rem;font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, simsun, sans-serif;}
        #navbar{margin-bottom: 0; }
        #navbar-logo {padding: 0.4rem;margin: 0 3rem; }
        #navbar-logo img{height: 4.4rem;}
        #navbar .navbar-brand-title{font-size: 3rem;}
        #colorbar {height: 0.3rem; margin-top: 0; border-top: 0;background: #c4e17f;border-radius: 0.3rem;
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);}
        #form-up .myforminput{border-radius: 6px;}
        form{width: 96%;margin: auto;}
        .validationImgWrapper{text-align: center;}
        #validationRow{height: 5rem;}
        #validationRow .col{height: 5rem;}
        #validationRow .col>div{height: 5rem;line-height: 5rem;margin: 0;}
        #validationRow .remembermeText{font-size:1.8rem;color: #aaa;font-weight: lighter;}
    </style>
</head>
<body>
<nav id="navbar" class="navbar navbar-default navabr-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a id="navbar-logo" class="navbar-brand" href="/welcome"><img src="/image/welcome/logo.png" alt="病友网"></a>
            <a href="#" class="navbar-brand navbar-brand-title">注 册/登 录 病 友 网</a><a href="#" class="navbar-brand">发现更多内容</a>
        </div>
    </div> <!--container-->
</nav>
<hr id="colorbar">
<div class="signinform">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form:form id="loginForm" role="form" data-toggle="validator" action="/welcome/userLogin" method="POST" namespace="/" modelAttribute="preparedUser">
                <span style="color: red;">${message}</span>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12"><div class="form-group has-feedback">
                        <form:input path="name" id="username" class="form-control input-lg" placeholder="输入用户名" required="true" data-required-error="不可为空"/>
                    </div></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12"><div class="form-group has-feedback">
                        <form:password path="password" id="userpass" class="form-control input-lg" placeholder="输入密码" required="true" data-required-error="不可为空"/>
                    </div></div>
                </div>
                <div id="validationRow" class="row">
                    <div class="col col-xs-4 col-sm-4 col-md-4"><div class="form-group has-feedback">
                        <input type="text" name="validationCode" class="form-control input-lg" placeholder="输入验证码" required data-required-error="不可为空"/>
                    </div></div>
                    <div class="col col-xs-4 col-sm-4 col-md-4 validationImgWrapper">
                        <div><img src="/validationCodeImage" alt="看不清，换一张" class="validationImg"/></div>
                    </div>
                    <div class="col col-xs-4 col-sm-4 col-md-4"><div class="form-group has-feedback">
                        <div><label><input type="checkbox" value="option1" class="rememberme">&nbsp;<span class="remembermeText">记住我一周</span></label></div>
                    </div></div>
                </div><hr>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <a href="/logon" class="btn btn-success btn-block btn-lg">我要注册</a>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <button type="submit" class="btn btn-primary btn-block btn-lg signsubmit">提交登录</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/bootstrap/validator.js"></script>
<script src="/assets/jquery/jquery.md5.js" type="text/javascript"></script>
<script src="/assets/jquery/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript">
    $('input[data-toggle]').tooltip();
    $('input.form-control.input-lg').after('<i class="form-control-feedback icon-large"></i><div class="help-block with-errors"></div>');
    $('#validationRow .validationImg').click(function(){
        //使用时间戳防止浏览器认为是同一张图片，而从缓存中读取
        $(this).attr("src","validationCodeImage?timestamp="+new Date().getTime());
    });
    $('.signsubmit').click(function () {
        var userName = $('#username').val();
        var password = $('#userpass').val();
        var rememberme = $('.rememberme').is(':checked');//js .checked;
        if(password.trim().length < 32){
            password = $.md5(userName+$.md5(password));
            console.log('md5= '+ password);
        }
        $('#userpass').val(password);
        if(rememberme){
            $.cookie(userName,password,{expires:24*7,path:'/'})
        }else {
            $.cookie(userName,password);
        }
    });
</script>
</body>
</html>
