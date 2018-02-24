<%@ page contentType="text/html;charset=utf-8" language="java" %>
<link rel="stylesheet" href="/css/common/submenu.css"/>
<div id="submenu">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col menulink">
            <a class="" href="/community/index"><i class="fa fa-group" aria-hidden="true">&nbsp;病友聊天</i></a>
            <a class=" " href="/community/playground"><i class="fa fa-hand-stop-o" aria-hidden="true">&nbsp;病友大厅</i></a>
            <a class=" " href="#"><i class="fa fa-list" aria-hidden="true">&nbsp;病友论坛</i></a>
            <a class=" " href="#"><i class="fa fa-star-o" aria-hidden="true">&nbsp;病友动态</i></a>
        </div>
        <div class="col-xs-0 col-sm-4 col-md-4 col"><div class="userentrance"><a href="#" userId="${sessionScope.LOGIN_USER_ID}"> <img class="avatar" src="/image/community/avatar.png"><span class="userName">${sessionScope.LOGIN_USER_NAME}</span></a><a href="#">&emsp;<i class="fa fa-vcard-o" aria-hidden="true">&nbsp;账户设置</i> </a></div></div>
    </div>
</div><!-- submenu -->