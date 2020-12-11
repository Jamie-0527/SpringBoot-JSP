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
    String ok = (String) request.getAttribute("ok_update");
%>

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
    window.onload=function () {
        var ok = '<%=ok%>'
        if (ok != 'null'){
            alert(ok);
        }
    }
</script>

<body>

<%--侧边栏--%>
<%@include file="../component/companyLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 20px 0px 20px">个人中心</span>
    </div>
    <div style="width: 30%; margin: 0px auto; margin-top: 200px;">
        <form>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="s_id" class="input-group-text">&nbsp;&nbsp;&nbsp;工&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="s_id" value="${company.company_person_id}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="s_name" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="s_name" value="${company.company_person}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="c_name" class="input-group-text">联系方式</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="c_name" value="${company.company_phone}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="s_college" class="input-group-text">&nbsp;&nbsp;公司ID&nbsp;&nbsp;</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="s_college" value="${company.company_id}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="s_phone1" class="input-group-text">公司名称</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="s_phone1" value="${company.company_name}">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label for="s_phone" class="input-group-text">公司地址</label>
                </div>
                <input type="text" class="form-control" readonly="readonly" id="s_phone" value="${company.company_address}">
            </div>
        </form>
        <div class="modal-footer">
            <button class="btn btn-primary" data-toggle="modal" data-target="#modalUpdate">修改个人信息</button>
        </div>
    </div>
</div>
<%--修改信息的模态框--%>
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add">修改信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="updateCompanyInformation" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_person_id" class="input-group-text">&nbsp;&nbsp;&nbsp;工&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" readonly="readonly" name="company_person_id" id="company_person_id" value="${company.company_person_id}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_person" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="company_person" id="company_person" value="${company.company_person}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_phone" class="input-group-text">联系方式</label>
                        </div>
                        <input type="text" class="form-control" name="company_phone" id="company_phone" value="${company.company_phone}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_id" class="input-group-text">&nbsp;&nbsp;公司ID&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="company_id" id="company_id" value="${company.company_id}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_name" class="input-group-text">公司名称</label>
                        </div>
                        <input type="text" class="form-control" name="company_name" id="company_name" value="${company.company_name}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="company_address" class="input-group-text">公司地址</label>
                        </div>
                        <input type="text" class="form-control" name="company_address" id="company_address" value="${company.company_address}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
