<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>test</title>
</head>
<body>
<span class="timeLeft">4</span>秒后<a class="targetURL" href="/login">跳转</a>

<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var count = 3;
        setInterval(function () {
            if(count > 0){
                $('.timeLeft').html(count--);
            }else {
                window.location = $('.targetURL').attr('href');
            }
        },1000);

    });
</script>
</body>
</html>
