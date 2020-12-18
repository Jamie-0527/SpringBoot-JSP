<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/2
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理</title>
</head>
<%
    //初始化一个int i，用于回去列表每行ID
    int i=1;
    String error = (String) request.getAttribute("addStudentError");
    String ok = (String) request.getAttribute("ok_addS");
    String ok_update = (String) request.getAttribute("ok_update");
%>

<script>
    window.onload=function () {
        var msg = '<%=error%>'
        if (msg != 'null'){
            alert(msg);
        }
        var ok = '<%=ok%>'
        if (ok != 'null'){
            alert(ok);
        }
        var ok_update = '<%=ok_update%>'
        if (ok_update != 'null'){
            alert(ok_update);
        }
    }
</script>

<style>
    #lastLine:last-child td,#lastLine:last-child th{border-bottom: 1px solid rgb(222,226,230);}
</style>

<body>

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/companyLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-users" aria-hidden="true"></i>&nbsp;学生管理
        </span>
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAdd">
            <i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;添加学生
        </button>
    </div>
    <%--打印学生信息--%>
    <table class="table table-striped">
        <thead>
        <tr align="center">
            <th class="border-right" scope="col">编号</th>
            <th class="border-right" scope="col">学号</th>
            <th class="border-right" scope="col">姓名</th>
            <th class="border-right" scope="col">联系电话</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${companyStudent}" var="s" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${s.s_id}</td>
                <td class="border-right">${s.s_name}</td>
                <td class="border-right">${s.s_phone}</td>
                <td>
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">
                        <i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;修改
                    </button>
                </td>
            </tr>
            <%--修改信息模态框--%>
            <div class="modal fade" id="myModify<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">
                                <i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;修改信息
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <!--此处是修改表单-->
                            <form action="companyUpdateSInfo" method="post">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentId" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" readonly="readonly" name="s_id" id="studentId" value="${s.s_id}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" name="s_name" id="studentName" value="${s.s_name}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentPhone" class="input-group-text">联系方式</label>
                                    </div>
                                    <input type="text" class="form-control" name="s_phone" id="studentPhone" value="${s.s_phone}">
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
        </c:forEach>
        </tbody>
    </table>
</div>
<%--添加学生的模态框--%>
<div class="modal fade" id="modalAdd" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add">添加学生</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="addStudentsInformation" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="addStudentId" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="s_id" id="addStudentId">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="addStudentName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="s_name" id="addStudentName">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="addStudent">提交</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


</body>
</html>
