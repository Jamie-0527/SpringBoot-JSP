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

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/init.js"></script>
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

<%--侧边栏--%>
<%@include file="../component/teacherLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 20px 0px 20px">学生管理</span>
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAdd">添加学生</button>
    </div>
    <%--打印学生信息--%>
    <table class="table table-striped">
        <thead>
        <tr align="center">
            <th class="border-right" scope="col">编号</th>
            <th class="border-right" scope="col">学号</th>
            <th class="border-right" scope="col">姓名</th>
            <th class="border-right" scope="col">班级</th>
            <th class="border-right" scope="col">联系电话</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${classStudent}" var="s" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${s.student.s_id}</td>
                <td class="border-right">${s.student.s_name}</td>
                <td class="border-right">${s.grade.c_name}</td>
                <td class="border-right">${s.student.s_phone}</td>
                <td>
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">修改</button>
                </td>
            </tr>
            <%--修改信息模态框--%>
            <div class="modal fade" id="myModify<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <!--此处是修改表单-->
                            <form action="teacherUpdateSInfo" method="post">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentId" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" readonly="readonly" name="s_id" id="studentId" value="${s.student.s_id}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" name="s_name" id="studentName" value="${s.student.s_name}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentGrade" class="input-group-text">&nbsp;&nbsp;&nbsp;班&nbsp;级&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" name="c_name" id="studentGrade" value="${s.grade.c_name}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="studentPhone" class="input-group-text">联系方式</label>
                                    </div>
                                    <input type="text" class="form-control" name="s_phone" id="studentPhone" value="${s.student.s_phone}">
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
