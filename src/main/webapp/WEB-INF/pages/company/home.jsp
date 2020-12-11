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

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<%
    String username = (String) request.getAttribute("userName");
    String authority = (String) request.getAttribute("Authority");
    if (username == null || username == ""){
        request.getRequestDispatcher("../login.jsp").forward(request,response);
    }
    session.setAttribute("userName",username);
    session.setAttribute("Authority",authority);

%>

<body>

<%--侧边栏--%>
<%@include file="../component/companyLeft.jsp"%>

</body>
</html>
