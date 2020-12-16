<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/6
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    String username = (String) session.getAttribute("userName");
    if (username == null || username == ""){
        request.getRequestDispatcher("../login.jsp").forward(request,response);
    }

    String ok = (String) request.getAttribute("ok_init");
%>
<script>
    window.onload=function () {
        var ok = '<%=ok%>'
        if (ok != 'null'){
            alert(ok);
        }
    }
</script>
<body>

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/companyLeft.jsp"%>

<div style="width: 85%;float:right;">

    <div class="form-row" style="margin: 10px" >
        <c:forEach items="${news}" var="n" end="1">
            <div class="col-md-6 mb-6">
                <div class="card text-center text-white bg-dark">
                    <div class="card-header">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${n.s_id}&nbsp;&nbsp;${n.s_name}</h5>
                        <p class="card-text d-inline-block text-truncate" style="width: 100%">${n.report_context}</p>
                        <a href="getCompanyReport" class="btn-outline-light">查看</a>
                    </div>
                    <div class="card-footer text-muted">
                        更新于
                        <fmt:formatNumber maxFractionDigits="0" value="${n.updatedOn/24}"/>
                        天${n.updatedOn%24}小时前
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="form-row" style="margin: 10px" >
        <c:forEach items="${news}" begin="2" end="4" var="n">
            <div class="col-md-4 mb-4">
                <div class="card text-center text-white bg-secondary">
                    <div class="card-body">
                        <h5 class="card-title">${n.s_id}&nbsp;&nbsp;${n.s_name}</h5>
                        <p class="card-text d-inline-block text-truncate" style="width: 100%">${n.report_context}</p>
                        <a href="getCompanyReport" class="btn btn-outline-light">查看</a>
                    </div>
                    <div class="card-footer text-muted">
                        更新于
                        <fmt:formatNumber maxFractionDigits="0" value="${n.updatedOn/24}"/>
                        天${n.updatedOn%24}小时前
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="form-row" style="margin: 10px" >
        <c:forEach items="${news}" begin="4" var="n">
            <div class="col-md-3 mb-3">
                <div class="card text-center bg-light">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${n.s_id}&nbsp;&nbsp;${n.s_name}</h5>
                        <p class="card-text d-inline-block text-truncate" style="width: 100%">${n.report_context}</p>
                        <a href="getCompanyReport" class="btn btn-outline-dark">查看</a>
                    </div>
                    <div class="card-footer text-muted">
                        更新于
                        <fmt:formatNumber maxFractionDigits="0" value="${n.updatedOn/24}"/>
                        天${n.updatedOn%24}小时前
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>



</body>
</html>
