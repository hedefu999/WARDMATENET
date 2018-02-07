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
    <style type="text/css">
        .grid-item { width: 20%; }
        .grid-item--width2 { width: 40%;}
    </style>
</head>
<body>
<div class="grid">
    <div class="grid-item">123</div>
    <div class="grid-item grid-item--width2">234</div>
    <div class="grid-item">456</div>
</div>

<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
<script type="text/javascript">
    $(function () {
        $('.grid').masonry({
            // options
            itemSelector: '.grid-item',
            columnWidth: 200
        });
    });
</script>
</body>
</html>
