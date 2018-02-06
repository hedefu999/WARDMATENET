<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 01/10/2017
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户信息</title>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/common/rem.css" type="text/css"/>
    <style type="text/css">
        body{font-size: 2rem;padding: 3rem;}
        #sidebar{float: left;text-align: right;width: 30%;position: fixed;}
        #sidebar .avatar{width: 100%;text-align: center;}
        #sidebar .avatar img{width: 10rem;}
        #sidebar .personal{background-color: #5bc0de;}
        #sidebar .footer{background-color: #008080}
        #details{float:right;width: 60%;}
        #details .titleBar{font-size:2.5rem;background-color: #5bc0de50;border-radius: 1rem;padding: 0.5rem;}
        #details .titleBar span{margin-left: 2rem;}
        #details .titleBar img{width:2rem; float: right;margin-right: 2rem;display: none;}
        #details .titleBar button{float: right;margin-right: 2rem;}
    </style>
</head>
<body>
<div id="sidebar">
    <div class="avatar"><img class="img-circle" src="/image/community/avatar01.jpg"></div>
    <div class="personal">
        <h1>${userAndProfile.name}</h1><a href="">注销登录</a>
        <p>${userAndProfile.email}</p>
        <p>${userAndProfile.weixinAccount}</p>
    </div>
    <div class="footer">
        我的病友网个人账户
    </div>
</div>
<div id="details">
    <div class="titleBar personaltitle">
        <span>个人信息</span><button class="btn btn-primary update" currentFunction="edit">编辑内容</button>
        <img class="loader" src="/image/common/loader.gif" alt="...">
    </div>
    <div class="personal">
        <%--modelAttribute也能从modelMap中获取--%>
        <form:form id="personalForm" modelAttribute="userAndProfile">
            <form:hidden path="userId" class="userId"/>
            <form:hidden path="name" class="userName"/>
            密码：<form:input path="password" readonly="true" placeholder="*输入密码以更改个人信息"/><br>
            <span class="feedback"></span>
            昵称：<form:input path="nickName" readonly="true"/><br>
            性别：<form:radiobuttons path="gender" items="${requestScope.genders}" delimiter="&emsp;" disabled="true"/><br>
            生日：<form:input path="birthday" readonly="true"/><br>
            绑定手机：<form:input path="phone" readonly="true"/><br>
            注册邮箱：<form:input path="email" readonly="true"/><br>
            微信：<form:input path="weixinAccount" readonly="true"/>
        </form:form>
    </div>
    <div class="titleBar">
        <span >我关注的慢病</span>
        <button class="btn btn-primary">编辑</button>
    </div>
    <div class="diseaseCared">
        糖尿病 <br>高血压 <br>高血脂<br>
    </div>
    <div class="titleBar">
        <span class="title">我收藏的内容</span>
    </div>

    <div class="collects">
        <ul>
            <li>心梗防治指南</li>
            <li>人工除颤器的使用方法</li>
            <li>磺脲类药物哪家强？来看一篇系统评价</li>
        </ul>
    </div>

</div>
<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        // $.ajax({
        //     url : '/userProfile/testAjax',
        //     type : 'post',
        //     contentType : "application/json;charset=utf-8",
        //     data :fromDataJsonObj,
        //     success:function (result) {
        //         console.log(result);
        //     }
        // });

        var radioGroupInPersonal = $('#details .personal input[type="radio"]');
        $('#details .personaltitle .update').click(function () {
            var currentFunction = $(this).attr('currentFunction');
            if (currentFunction == 'edit'){
                $('#details .personal input').attr('readonly',false);
                $(this).html('提交保存').attr('currentFunction','save');
                radioGroupInPersonal.each(function (index,element) {
                    $(element).attr('disabled',false);
                });
            }else if (currentFunction == 'save'){
                var formDataURLParam = $('#personalForm').serialize();
                formDataURLParam = decodeURIComponent(formDataURLParam,true);//取消对中文的URL编码
                var fromDataJsonStr = dataTransformer.urlParamToJsonStr(formDataURLParam);
                $(this).next().css('display','block');
                var _this = this;
                $.ajax({
                    url : '/userProfile/updateProfile',
                    type : 'post',
                    contentType : "application/json;charset=UTF-8",
                    data :fromDataJsonStr,
                    success:function (result) {
                        if(result=='success'){
                            $('#details .personal input').attr('readonly',true);
                            $(_this).html('编辑内容').attr('currentFunction','edit');
                            radioGroupInPersonal.each(function (index,element) {
                                $(element).attr('disabled',true);
                            });
                            $(_this).next().css('display','none');
                            alert("修改成功");
                        }else {
                            $(_this).next().css('display','none');
                            alert("密码错误");
                        }

                    }
                });
            }
        });

    });
    var dataTransformer = {
        //将从form中通过$('#refer').serialize()获取的值转成json
        urlParamToJsonStr: function (data) {
            data=data.replace(/&/g,"\",\"");
            data=data.replace(/=/g,"\":\"");
            data="{\""+data+"\"}";
            return data;
        }
    };
</script>


</body>
</html>
