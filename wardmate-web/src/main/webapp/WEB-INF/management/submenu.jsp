<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/css/common/submenu.css"/>
<div id="submenu">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col menulink">
            <a class="" href="/management/index?submenuIndex=1&menuIndex=4"><i class="fa fa-group" aria-hidden="true">&nbsp;健康记录</i></a>
            <a class=" " href="/management/disease?submenuIndex=2&menuIndex=4"><i class="fa fa-hand-stop-o" aria-hidden="true">&nbsp;疾病百科</i></a>
            <a class=" " href="/management/medicine?submenuIndex=3&menuIndex=4"><i class="fa fa-list" aria-hidden="true">&nbsp;药物信息</i></a>
            <a class=" " href="/management/healthplans?submenuIndex=4&menuIndex=4"><i class="fa fa-star-o" aria-hidden="true">&nbsp;健康计划</i></a>
        </div>
        <div class="col-xs-0 col-sm-4 col-md-4 col">
            <div class="userentrance">
                <c:choose>
                    <c:when test="${sessionScope.LOGIN_USER != null}">
                        <a href="/welcome/gotoUserProfile/${sessionScope.LOGIN_USER_ID}">
                            <img class="avatar img-circle" src="${sessionScope.LOGIN_USER.avatarURL}">
                            <span class="userName">${sessionScope.LOGIN_USER_NAME}▼</span>
                        </a>|<a href="/logout" class="logout">登出</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="login">登录</a> | <a href="/welcome/createUser">注册</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div><!-- submenu -->
<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/assets/layer/layer.js"></script>
<script type="text/javascript">
    var submenuIndex = ${param.submenuIndex};
    $('.menulink a:nth-child('+submenuIndex+')').addClass('active');
    $('.userentrance .logout').click(function (event) {
        event.preventDefault();
        $.get('/logout',function (result) {
            layer.msg(result, {icon: 1,offset:'rt'},function () {
                window.location.href = '/welcome?menuIndex=1';
            });
        });
    });
</script>