<%@ page import="java.util.List" %>
<%@ page import="com.min.graduation.entity.Report" %><%--
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
<%@include file="../component/teacherLeft.jsp"%>

<div style="width: 85%;float:right;">
    <c:set var="news" value="${news}" scope="page"></c:set>
    <%
        List<Report> news = (List<Report>) pageContext.getAttribute("news");
        if (news.isEmpty()){
    %>
    <div class="text-center text-muted" style="margin-top:20%;">
        <h3>暂时没有新的消息~</h3>
    </div>
    <%} else {%>
    <div class="form-row" style="margin: 10px" >
        <c:forEach items="${news}" var="n" end="8" >
            <div class="col-md-4 mb-2">
                <div class="card text-center text-white bg-dark">
                    <div class="card-header">
                        实训报告
                        <a href="teacherGetReport" class="btn btn-outline-light" style="float: right">查看</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${n.s_id}&nbsp;&nbsp;${n.s_name}</h5>
                        <p class="card-text d-inline-block text-truncate" style="width: 100%">${n.report_context}</p>
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
    <%}%>
</div>

</body>
</html>
