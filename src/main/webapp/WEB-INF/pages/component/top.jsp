<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>顶部导航栏</title>
</head>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<%//获取当前时间
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
    String name = (String) session.getAttribute("name");
%>

<body>
<%--导航条--%>
<nav style="background-color: #e3f2fd; width: 85%; height: 5%; float: right; font-size: 20px">
    <div class="font-weight-bold" style="margin:5px 10px 0px 20px;">
        <i class="fa fa-calendar" aria-hidden="true"></i>
        当前日期: <%=now%>
        <div style="float: right;">
            <%
                if (name != "" && name != null){
            %>
            <div class="font-weight-bold">
                <i class="fa fa-user" aria-hidden="true"></i>
                <%=name%>&nbsp;&nbsp;&nbsp;
                <button href="signOut" class="btn btn-secondary" style="margin-bottom: 5px" data-toggle="modal" data-target="#logout">
                    <i class="fa fa-sign-out" aria-hidden="true">注销</i>
                </button>
            </div>

            <%} else {%>
            <div class="font-weight-bold">
                <i class="fa fa-user-secret" aria-hidden="true"></i>
                超级管理员,欢迎回来&nbsp;&nbsp;&nbsp;&nbsp;
                <button href="signOut" class="btn btn-secondary" style="margin-bottom: 5px" data-toggle="modal" data-target="#logout">
                    <i class="fa fa-sign-out" aria-hidden="true">注销</i>
                </button>
            </div>
            <%}%>
        </div>
        <%--注销模态框--%>
        <div class="modal fade" id="logout" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="del" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="del">
                            <i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Confirm
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>你确定要退出本系统吗？</p>
                        <form action="signOut" method="post" >
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-secondary">
                                    <i class="fa fa-sign-out" aria-hidden="true">退出</i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</nav>



</body>
</html>
