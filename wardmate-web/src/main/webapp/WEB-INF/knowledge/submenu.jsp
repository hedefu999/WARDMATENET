<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/css/common/submenu.css"/>
<body>
<div id="submenu">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8 col menulink">
            <a class="" href="/knowledge/aboutEBM?submenuIndex=1&menuIndex=2"><i class="fa fa-binoculars" aria-hidden="true">&nbsp;关于循证医学</i></a>
            <a class="" href="/knowledge/queryKnowledgeCard?submenuIndex=2&menuIndex=2"><i class="fa fa-book" aria-hidden="true">&nbsp;专业术语</i></a>
            <a class="" href="#&menuIndex=4&menuIndex=2"><i class="fa fa-wrench" aria-hidden="true">&nbsp;循证实践</i></a>
            <a class="" href="#&menuIndex=4&menuIndex=2"><i class="fa fa-gavel" aria-hidden="true">&nbsp;卫生技术评估</i></a>
        </div>
        <div class="col-xs-0 col-sm-4 col-md-4 col">
            <div class="userentrance">
                <%--需要在引用页面导入标签--%>
                <c:choose>
                    <c:when test="${sessionScope.LOGIN_USER != null}">
                        <a href="#">
                            <img class="avatar" src="/image/community/avatar.png">&emsp;${sessionScope.LOGIN_USER_NAME}
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
    $('a[class="logout"]').click(function () {
        $.get({
            url:'/logout',
            success:function () {
                layer.msg('您登出了病友网，许多功能不能用了', {icon: 5},function () {
                    $('.userentrance').html('<a href="/login" class="login">登录</a> | <a href="/welcome/createUser">注册</a>');
                });
            }
        });
        return false;
    });
    $('a[class="login"]').click(function () {
        $.get({
            async:'true',
            url:'/login',
            success:function (html) {
                layer.open({
                    type:1,
                    closeBtn:1,
                    shadeClose:true,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['100rem', '60rem'],
                    content:html
                });
            }
        });
        return false;
    });

</script>
</body>

