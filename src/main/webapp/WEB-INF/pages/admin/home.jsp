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
<%@include file="../component/adminLeft.jsp"%>


<div style="width: 85%;float:right;">

    <div class="text-center text-muted" style="margin-top:20%;">
        <h3>暂时没有新的消息~</h3>
    </div>
</div>



</div>


</body>
</html>