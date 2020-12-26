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
    String getName = (String) session.getAttribute("name");
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

<script>
    $(document).ready(function(){
        $('.toast').toast({animation: false, delay: 5000});
        $('.toast').toast('show');
    });
</script>
<%--轻量弹窗--%>
<div class="toast" style="position: absolute; top: 50px; right: 0px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
        <i class="fa fa-square" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;</i>
        <strong class="mr-auto">New message&nbsp;&nbsp;&nbsp;&nbsp;</strong>
        <small class="text-muted">now</small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="toast-body">
        <span style="font-size: 20px;">欢迎回来，<%=getName%></span>
    </div>
</div>

</body>
</html>
