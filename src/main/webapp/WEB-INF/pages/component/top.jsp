<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>顶部导航栏</title>
</head>

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<%//获取当前时间
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
    String name = (String) session.getAttribute("name");
%>

<body>
<%--导航条--%>
<nav style="background-color: #e3f2fd; width: 85%; height: 5%; float: right; font-size: 20px">
    <div class="font-weight-bold" style="margin:8px 10px 0px 20px;">
        <i class="fa fa-calendar" aria-hidden="true"></i>
        当前日期: <%=now%>
        <div style="float: right;">
            <%
                if (name != "" && name != null){
            %>
            <div class="font-weight-bold">
                <i class="fa fa-user" aria-hidden="true"></i>
                <%=name%>&nbsp;,&nbsp;欢迎回来&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="signOut" class="btn btn-secondary" style="margin-bottom: 5px">
                    <i class="fa fa-sign-out" aria-hidden="true">注销</i>
                </a>
            </div>

            <%} else {%>
            <div class="font-weight-bold">
                <i class="fa fa-user-secret" aria-hidden="true"></i>
                超级管理员,欢迎回来&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="signOut" class="btn btn-secondary" style="margin-bottom: 5px">
                    <i class="fa fa-sign-out" aria-hidden="true">注销</i>
                </a>
            </div>
            <%}%>
        </div>
    </div>

</nav>



</body>
</html>