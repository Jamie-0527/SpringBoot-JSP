<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧导航栏</title>
</head>

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<style>
    .clear-fillet{
        /*修正左侧导航栏的按钮圆角*/
        -webkit-border-radius: 0 !important;
        -moz-border-radius: 0 !important;
        border-radius: 0 !important;
        border: none;
    }
    #a1,#a2,#a3,#b1,#b2,#b3{margin: 0px; display:none; font-size: 18px;}
    a:hover{text-decoration: none}

    #paperManagement,#personalCenter{color: rgb(108,117,125)}
    #paperManagement:hover,#personalCenter:hover{color: white;}

    .tail{
        position: fixed;
        bottom: 0px;
        color: #CCCCCC;
        font-size: 8px;
        text-align: center;
    }
</style>

<script src="js/modify.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<body>
<%--侧边栏--%>
<div style="background-color:rgb(32,34,42);  height: 100%; float: left; width: 15%">
    <a class="navbar-brand" href="#">
        <img src="imgs/logo.png" width="100%" height="6%" alt="武汉晴川学院" loading="lazy">
    </a>
    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="infoManagement">
        信息管理
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="studentManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a1">学生管理</div></a>
        <a href="teacherManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a2">教师管理</div></a>
        <a href="companyManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a3">企业管理</div></a>
    </div>
    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="userManagement">
        账户管理
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="studentAccountManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b1">学生账户</div></a>
        <a href="teacherAccountManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b2">教师账户</div></a>
        <a href="companyAccountManagement"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b3">企业账户</div></a>
    </div>
    <a id="paperManagement" class="btn btn-outline-secondary btn-lg btn-block clear-fillet" style="margin: 0px;">实训报告</a>
    <a id="personalCenter" class="btn btn-outline-secondary btn-lg btn-block clear-fillet" style="margin: 0px;">
        <i class="fa fa-user-o fa-lg" aria-hidden="true"></i>个人中心
    </a>

    <div class="tail text-wrap" style="width: 15%;">
        <p>Copyright &copy; 2020-2021 by 张家民 ALL Rights Reserved</p>
    </div>
</div>




</body>
</html>