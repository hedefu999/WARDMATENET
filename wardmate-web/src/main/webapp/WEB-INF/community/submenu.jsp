<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/css/common/submenu.css"/>
<div id="submenu">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col menulink">
            <a class="" href="/community/index?submenuIndex=1&menuIndex=4"><i class="fa fa-group" aria-hidden="true">&nbsp;病友聊天</i></a>
            <a class=" " href="/community/playground?submenuIndex=2&menuIndex=4"><i class="fa fa-hand-stop-o" aria-hidden="true">&nbsp;病友大厅</i></a>
            <a class=" " href="#?submenuIndex=3&menuIndex=4"><i class="fa fa-list" aria-hidden="true">&nbsp;病友论坛</i></a>
            <a class=" " href="#?submenuIndex=4&menuIndex=4"><i class="fa fa-star-o" aria-hidden="true">&nbsp;病友动态</i></a>
        </div>
        <div class="col-xs-0 col-sm-4 col-md-4 col">
            <div class="userentrance">
                <%--社区模块由拦截器验证是否登录，此处不必判断--%>
                <a href="#" userId="${sessionScope.LOGIN_USER_ID}">
                    <img class="avatar" src="/image/community/avatar.png">
                    <span class="userName">${sessionScope.LOGIN_USER_NAME}</span>
                </a>|
                <a href="/logout" class="logout">登出</a>|
                <a href="#">&emsp;<i class="fa fa-vcard-o" aria-hidden="true">&nbsp;账户设置</i> </a>
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