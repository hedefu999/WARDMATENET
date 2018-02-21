<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <title>注册</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/bootstrap/bootstrap-datepicker.min.css">
    <style type="text/css">
        html {font-size: 62.5%;}
        body {font-size: 1.6rem;font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, simsun, sans-serif;}
        #navbar{margin-bottom: 0; }
        #navbar-logo {padding: 0.4rem;margin: 0 3rem; }
        #navbar-logo img{height: 4.4rem;}
        #navbar .navbar-brand-title{font-size: 3rem;}
        #colorbar {height: 0.3rem; margin-top: 0; border-top: 0;background: #c4e17f;border-radius: 0.3rem;
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);}
        .signupform{height: 100%;background: url("/image/common/bg1.png") no-repeat fixed top ;background-size: cover;}
        .signupform .formContainer{background-color: #fff;padding: 6rem 1rem;border: 0.5rem #ccc solid;border-radius: 1rem;margin-top: 10%;}
        form{width: 96%;margin: auto;}
        /*下面两个是日期选择器的大小设置*/
        .datepicker table{width: 100%;height: 100%;}
        .datepicker-dropdown {width: 25rem;}
        .validationImgWrapper{text-align: center;}
        #genderRadioWrapper{font-size: 1.8rem;text-align: center;color: #aaa;height: 5rem;padding: 0;}
        #genderRadioWrapper>div{line-height: 4rem;}
        #genderRadioWrapper>div>span:first-child{color: pink;}
        #genderRadioWrapper>div>span:last-child{color: deepskyblue;}
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
<div class="signupform" id="signupform">
    <hr id="colorbar">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2 formContainer">
            <form:form id="logonform" role="form" data-toggle="validator" action="/welcome/createUser" method="POST" modelAttribute="preparedUser">
                <span style="color: red;">${requestScope.message}</span>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <form:input path="name" id="userName" class="myforminput form-control input-lg" placeholder="输入用户名" data-toggle="tooltip" data-trigger="focus" title="用户名8-15个字符，由字母数字或汉字组成"
                                             pattern="^([A-Za-z0-9]|[\u4E00-\u9FA5])+$" data-pattern-error="格式不匹配"
                                             data-minlength="6" data-minlength-error="用户名太短" maxlength="15" required="true" data-required-error="不可为空"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <form:input path="birthday" id="birthdate" class="myforminput form-control input-lg" placeholder="出生日期" data-toggle="tooltip" data-trigger="focus" title="点击日历中的日期" required="true" data-required-error="不可为空" pattern="^\d{4}-\d{2}-\d{2}$" data-pattern-error="日期格式错误"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <div class="form-group has-feedback">
                            <form:input path="email" class="form-control input-lg" placeholder="输入您的邮箱地址" required="true" data-required-error="邮箱不能为空" pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$" data-pattern-error="邮箱格式错误"/>
                        </div>
                    </div>
                    <div id="genderRadioWrapper" class="col-xs-4 col-sm-4 col-md-4">
                        <div><form:radiobuttons path="gender" items="${requestScope.genders}" required="true" delimiter="&emsp;&emsp;" cssClass="genderRadio" cssStyle="margin: 0 0.5rem;"/></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <form:password path="password" id="password" class="form-control input-lg" placeholder="请输入密码(8-16位)" data-toggle="tooltip" data-trigger="focus" title="请勿使用纯数字或其他不安全的密码" required="true" data-required-error="不可为空" data-minlength="8" data-minlength-error="长度不足8位" maxlength="16"/>
                        </div>
                        <div id="passrankbar" class="progress progress-striped" style="display: none;">
                            <div id="cipherstrength" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style=""><span id="passrank"></span></div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="password" id="passcheck" class="form-control input-lg" placeholder="确认密码" data-toggle="tooltip" data-trigger="focus" title="再次输入密码进行验证" data-match="#password" data-match-error="两次输入密码不匹配" required="true" data-required-error="不可为空"/>
                        </div>
                    </div>
                </div>
                <%--<div class="row">--%>
                    <%--<div class="col-xs-12 col-sm-12 col-md-12">--%>
                        <%--<p class="text-success">至少选择一个您所关注的疾病>></p>--%>
                        <%--<div id="checkdisease" class="form-group" required>--%>
                            <%--&lt;%&ndash;默认勾选某些选项：添加属性 value="{'糖尿病','高血压'}"&ndash;%&gt;--%>
                            <%--&lt;%&ndash;此处无法回显&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<s:checkboxlist label="至少选择一个你关注的疾病" list="#session.diseaseList" name="user.diseaseList"/>&ndash;%&gt;--%>
                            <%--<!-- 在至少勾选一个疾病时，此处隐藏的文本域被填充 -->--%>
                            <%--<input class="hiddencheck" type="text" value="" required style="display: none;">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div id="validationRow" class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="validationCode" class="form-control input-lg" placeholder="输入右侧图片中的验证码" data-toggle="tooltip" data-trigger="focus" data-required-error="请输入图片中的验证码" title="点击图片进行刷新" required="true"/>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group validationImgWrapper">
                            <img src="/validationCodeImage" alt="看不清，换一张" class="validationImage" onclick="changeValidationImage()"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <!-- 以data-toogle指定的方式打开data-target指定目标 -->
                        <label><input type="checkbox" name="" data-error="您必须同意本网站的相关协议" required>
                            我同意本网站的<a href="#" data-toggle="modal" data-target="#t_and_c_m">用户协议及相关利益声明</a> ，并遵守<a href="#" data-toggle="modal" data-target="#t_and_c_m">有关法律</a>。</label>
                    </div>
                </div><hr>
                <div class="row">
                    <div class="col-xs-6 col-md-6"><a href="/login" class="btn btn-success btn-block btn-lg">我要登录</a></div>
                    <div class="col-xs-6 col-md-6"><button type="submit" class="btn btn-primary btn-block btn-lg signsubmit">提交注册</button></div>
                </div>
            </form:form>
        </div>
    </div>
    <!-- 网站条款协议内容 -->
    <!-- aria-labelledby使用其他已存在的元素替换，此处是modal标题 -->
    <div class="modal fade" id="t_and_c_m" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="false">×</button>
                    <h4 class="modal-title" id="myModalLabel">网站声明</h4>
                </div>
                <div class="modal-body">
                    <h4>用户协议</h4>
                    <p>以下内容将用户成为甲方，中康慢病网（病友网商标拥有者及独立法人）作为乙方，其他与本网站存在合作关系的包括但不限于研究机构、卫生技术生产商等称为第三方。一，甲方同意使用个人基本信息进行病友网的注册登记，乙方确保按照相关规则（详见第六章）使用用户数据并确保安全性，根据用户设置的信息共享权限使用数据。</p>
                    <h4>相关法律</h4>
                    <p>《中华人民共和国互联网安全法》《公民文明上网条例》遵守法律，不发表辱骂、诋毁他人的信息，企图颠覆国家政权者，不传播虚假、夸大的信息，因不当言行造成他人精神、经济损失的</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">我已知晓</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/bootstrap/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/assets/bootstrap/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/assets/bootstrap/validator.js"></script>
<script src="/assets/jquery/jquery.md5.js" type="text/javascript"></script>
<script src="/javascript/logon.js" type="text/javascript"></script>
</body>
</html>
