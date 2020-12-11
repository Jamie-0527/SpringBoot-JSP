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
    int authority = (int) request.getAttribute("Authority");
    if (username == null || username == ""){
       request.getRequestDispatcher("../login.jsp").forward(request,response);
    }
    session.setAttribute("userName",username);
    session.setAttribute("Authority",authority);

%>

<body>
<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/adminLeft.jsp"%>

<i class="fa fa-arrow-right" title="Submit My Tax Return"></i>
<i class="fa fa-envelope" aria-hidden=”true”></i>
<i class="icon-camera-retro"></i>
<i class="fa fa-address-book" aria-hidden="true"></i>
<div style="width: 85%;float:right;">
    <ul class="list-group">
        <a class="list-group-item active"> 我的帖子 </a>
        <div class="list-group-item">
            <a href="#" style="color:grey">
                <h4 class="list-group-item-heading" style="color:black">
                    主论坛标题</h4>帖子标题
            </a> <a href="#" style="float: right">编辑</a>
            <a href="#" style="float: right">申请精华贴&nbsp;</a>
            <p style="float: right;margin-right: 50px">
                浏览量:&nbsp;评论量:&nbsp;发表日期:</p>
        </div>
    </ul>
    <button class="btn btn-outline-info btn-lg btn-block " >Action</button>
</div>



</div>


</body>
</html>