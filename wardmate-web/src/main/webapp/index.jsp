<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--javax.servlet-api.jar提供api--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <%--<base href="<%=basePath%>"/>--%>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>index</title>
  </head>
  <body>
  <%--使用jsp标签url栏显示localhost:8080--%>
  <%--<jsp:forward page="/WEB-INF/welcome.jsp"/>--%>
  <%--主页经过springMVC便于国际化等，主页url localhost:8080/index--%>
  <c:redirect url="/welcome"/>
  </body>
</html>
