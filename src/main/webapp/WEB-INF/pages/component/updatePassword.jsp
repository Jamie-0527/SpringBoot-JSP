<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/11
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>

<%
    String error = (String) request.getAttribute("fail_update");
%>

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/init.js"></script>
<script>
    window.onload=function () {
        var error = '<%=error%>'
        if (error != 'null'){
            alert(error);
        }
    }
</script>

<body>

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%
    Integer Authority = (Integer) session.getAttribute("Authority");
    if (Authority==0) {
%>
<%@include file="adminLeft.jsp"%>
<%}else if (Authority==1){%>
<%@include file="studentLeft.jsp"%>
<%}else if (Authority==2){%>
<%@include file="teacherLeft.jsp"%>
<%}else{%>
<%@include file="companyLeft.jsp"%>
<%}%>


<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 20px 0px 20px">
            <i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;修改密码
        </span>
    </div>
    <div style="width: 30%; margin: 0px auto; margin-top: 200px;">
        <form>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="uesrName" class="input-group-text">&nbsp;&nbsp;&nbsp;账&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="uesrName" value="${login.userName}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="Roles" class="input-group-text">&nbsp;&nbsp;&nbsp;角&nbsp;色&nbsp;&nbsp;&nbsp;</label>
                </div>
                <c:set var="getAuthority" value="${login.authority}" scope="page"></c:set>
                <%
                    int checkAuthority = (int) pageContext.getAttribute("getAuthority");
                    if (checkAuthority==0){
                %>
                <input type="text" class="form-control" readonly="readonly" id="Roles" value="管理员">
                <%
                }else if (checkAuthority==1){
                %>
                <input type="text" class="form-control" readonly="readonly" id="Roles" value="学生">
                <%
                }else if (checkAuthority==2){
                %>
                <input type="text" class="form-control" readonly="readonly" id="Roles" value="教师">
                <%
                }else if (checkAuthority==3){
                %>
                <input type="text" class="form-control" readonly="readonly" id="Roles" value="企业人员">
                <%
                }else{
                %>
                <input type="text" class="form-control" readonly="readonly" id="Roles" value="无">
                <%}%>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="modifyTime" class="input-group-text">修改时间</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="modifyTime" value="${login.modifyTime}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="Status" class="input-group-text">&nbsp;&nbsp;&nbsp;状&nbsp;态&nbsp;&nbsp;&nbsp;</label>
                </div>
                <c:set var="nowStatus" value="${login.status}" scope="page"></c:set>
                <%
                    int checkStatus = (int)pageContext.getAttribute("nowStatus");
                    if (checkStatus==0){
                %>
                <p type="text" class="form-control" id="Status">
                    <span class="badge badge-success">有效</span>
                </p>
                <%
                    }else {
                %>
                <p type="text" class="form-control" id="Status">
                    <span class="badge badge-danger">禁用</span>
                </p>
                <%}%>
            </div>
        </form>
        <div class="modal-footer">
            <button class="btn btn-primary" data-toggle="modal" data-target="#modalUpdate">修改密码</button>
        </div>
    </div>
</div>
<%--修改信息的模态框--%>
<div class="modal fade" id="modalUpdate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;修改密码</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="updatePassword" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="updateUesrName" class="input-group-text">&nbsp;&nbsp;&nbsp;账&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" readonly="readonly" name="user_name" id="updateUesrName" value="${login.userName}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="old_pwd" class="input-group-text">&nbsp;&nbsp;旧密码&nbsp;</label>
                        </div>
                        <input type="password" class="form-control" name="oldPassword" id="old_pwd">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="s_pwd" class="input-group-text">&nbsp;&nbsp;&nbsp;密&nbsp;码&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="password" class="form-control" id="s_pwd">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="s_pwdConfirm" class="input-group-text">确认密码</label>
                        </div>
                        <input type="password" class="form-control" name="password" id="s_pwdConfirm">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="updatePassword">提交</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


</body>
</html>
