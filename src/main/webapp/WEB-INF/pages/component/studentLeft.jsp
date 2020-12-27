<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧导航栏</title>
</head>

<link rel="stylesheet" href="css/bootstrap.min.css" >
<%--<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">--%>
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<style>
    .clear-fillet{
        /*修正左侧导航栏的按钮圆角*/
        -webkit-border-radius: 0 !important;
        -moz-border-radius: 0 !important;
        border-radius: 0 !important;
        border: none;
    }

    #b4,#b5{margin: 0px; display:none; font-size: 18px;}
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
</style>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/modify.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>

<body>
<%--侧边栏--%>
<div style="background-color:rgb(32,34,42);  height: 100%; float: left; width: 15%">
    <a class="navbar-brand" href="studentToHome">
        <img src="imgs/logo.png" width="100%" height="6%" alt="武汉晴川学院" loading="lazy">
    </a>
    <a id="paperManagement" href="findMyReport?page=1" class="btn btn-outline-secondary btn-lg btn-block clear-fillet" style="margin: 0px;">
        <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;实训报告
    </a>
    <div class="btn btn-outline-secondary btn-lg btn-block clear-fillet dropdown-toggle" id="studentPersonalCenter">
        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;个人中心
    </div>
    <div style="background-color: rgb(22,24,29); ">
        <a href="studentPersonInformation"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b4">个人信息</div></a>
        <a href="adminToUpdatePassword"><div class="btn btn-outline-light btn-lg btn-block clear-fillet" id="b5">修改密码</div></a>
    </div>

    <div class="tail text-wrap" style="width: 15%;">
        <p>Copyright &copy; 2020-2021 by 张家民 ALL Rights Reserved</p>
    </div>
</div>




</body>
</html>
