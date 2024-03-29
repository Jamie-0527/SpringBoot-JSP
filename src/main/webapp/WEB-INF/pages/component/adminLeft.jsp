<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧导航栏</title>
</head>

<link rel="stylesheet" href="css/bootstrap.min.css">
<%--<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">--%>
<link rel="stylesheet" href="css/font-awesome.min.css">
<style>
    .clear-fillet{
        /*修正左侧导航栏的按钮圆角*/
        -webkit-border-radius: 0 !important;
        -moz-border-radius: 0 !important;
        border-radius: 0 !important;
        border: none;
    }
    #a1,#a2,#a3,#b1,#b2,#b3,#b4{margin: 0px; display:none; font-size: 18px;}
    a:hover{text-decoration: none}

    #paperManagement{color: rgb(108,117,125)}
    #paperManagement:hover{color: white;}

    .tail{
        position: fixed;
        bottom: 0px;
        color: #CCCCCC;
        font-size: 8px;
        text-align: center;
    }
    html,body{height:100%;}
</style>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modify.js"></script>

<body >
<%--侧边栏--%>
<div style="background-color:rgb(32,34,42); min-height: 100%; float: left; width: 15%">
    <a class="navbar-brand" href="adminToHome">
        <img src="imgs/logo.png" width="100%" height="6%" alt="武汉晴川学院" loading="lazy">
    </a>
    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="infoManagement">
        <i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;信息管理
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="studentManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a1">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;学生管理
            </div>
        </a>
        <a href="teacherManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a2">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;教师管理
            </div>
        </a>
        <a href="companyManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="a3">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;企业管理
            </div>
        </a>
    </div>
    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="userManagement">
        <i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;账户管理
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="studentAccountManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b1">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;学生账户
            </div>
        </a>
        <a href="teacherAccountManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b2">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;教师账户
            </div>
        </a>
        <a href="companyAccountManagement?page=1">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b3">
                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>&nbsp;企业账户
            </div>
        </a>
    </div>
    <a id="paperManagement" href="findAllReport?page=1" class="btn btn-outline-secondary btn-lg btn-block clear-fillet" style="margin: 0px;">
        <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;实训报告
    </a>

    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="personalCenter">
        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;个人中心
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="adminToUpdatePassword">
            <div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b4">
                <i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;修改密码
            </div>
        </a>
    </div>

    <div class="tail text-wrap" style="width: 15%;">
        <p>Copyright &copy; 2020-2021 by 张家民 ALL Rights Reserved</p>
    </div>
</div>




</body>
</html>
