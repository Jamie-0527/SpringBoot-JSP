<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/6
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>

<%
    String username = (String) session.getAttribute("userName");
    if (username == null || username == ""){
        request.getRequestDispatcher("../login.jsp").forward(request,response);
    }
%>
<body>

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/studentLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="text-center text-muted" style="margin-top:20%;">
       <h3>暂时没有新的消息~</h3>
    </div>
</div>

</body>
</html>
