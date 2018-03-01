<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
<div id="contentDiv" class="row">
    <div class="col col-xs-3">
        <h2>中国高血压患者教育指南</h2>
        <p>《中国高血压患者教育指南》编撰委员会</p>
        <p>中华高血压杂志</p>
        <p>2013年12月第21卷第12期</p>
    </div>
    <div class="col col-xs-9">
        <embed class="content" src="/documents/${contentId}.pdf" width="100%" height="100%" type='application/pdf'>
        <%--使用iframe报Resource interpreted as Document but transferred with MIME type application/pdf，导致其后html元素和JS代码无法解析--%>
        <%--也可以使用pdf.js第三方库（https://mozilla.github.io/pdf.js/）实现--%>
    </div>
</div>
</body>

