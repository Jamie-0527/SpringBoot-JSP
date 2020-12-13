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
    <title>用户管理</title>
</head>
<%
    //初始化一个int i，用于回去列表每行ID
    int i=1;
    String error = (String) request.getAttribute("addStudentError");
    String ok = (String) request.getAttribute("ok_addS");
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
    }
</script>

<style>
    #lastLine:last-child td,#lastLine:last-child th{border-bottom: 1px solid rgb(222,226,230);}
</style>

<body>

<%--导航条--%>
<%--<%@include file="../component/top.jsp"%>--%>
<%--侧边栏--%>
<%@include file="../component/adminLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 20px 0px 20px">用户管理</span>
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
            <th class="border-right" scope="col">学院</th>
            <th class="border-right" scope="col">实习公司</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${allStudent}" var="s" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${s.s_id}</td>
                <td class="border-right">${s.s_name}</td>
                <td class="border-right">${s.grade.c_name}</td>
                <td class="border-right">${s.s_phone}</td>
                <td class="border-right">${s.s_college}</td>
                <td class="border-right">${s.company_name}</td>
                <td>
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">修改</button>
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalDel<%=i%>">删除</button>
                </td>
            </tr>
            <%--修改信息模态框--%>
            <div class="modal fade" id="myModify<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <%--此处是修改表单--%>
                            <form action="test" method="post" class="needs-validation" novalidate>
                                <div class="form-row">
                                    <div class="col-md-6 mb-3">
                                        <label for="studentId">学号</label>
                                        <input type="text" class="form-control" name="s_id" id="studentId" value="${s.s_id}" required>
                                        <div class="invalid-feedback">
                                            请输入学号
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="studentName">姓名</label>
                                        <input type="text" class="form-control" name="s_name" id="studentName" value="${s.s_name}" required>
                                        <div class="invalid-feedback">
                                            请输入姓名
                                        </div>
                                    </div>
                                </div>

                                <label for="studentGrade">班级</label>
                                <input type="text" class="form-control" name="c_name" id="studentGrade" value="${s.grade.c_name}" required>
                                <div class="invalid-feedback">
                                    请输入班级
                                </div>

                                <label for="studentCollege">学院</label>
                                <select class="custom-select" id="studentCollege" name="s_college" required>
                                    <option selected disabled></option>
                                    <option>计算机学院</option>
                                    <option>电机学院</option>
                                    <option>传媒艺术学院</option>
                                    <option>外语学院</option>
                                </select>
                                <div class="invalid-feedback">
                                    请选择学院
                                </div>

                                <label for="studentPhone">联系方式</label>
                                <input type="text" class="form-control" name="s_phone" id="studentPhone" value="${s.s_phone}" required>
                                <div class="invalid-feedback">
                                    请输入联系方式
                                </div>

                                <label for="studentCompany">实训公司
                                </label>
                                <input type="text" class="form-control" name="company_name" id="studentCompany" value="${s.company_name}"><br>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%--删除学生模态框--%>
            <div class="modal fade" id="modalDel<%=i%>" tabindex="-1" role="dialog" aria-labelledby="del" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="del">confirm</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>数据不可恢复，你确定要删除此条记录吗？</p>
                            <form action="deleteStudentsInformation" method="post" >
                                <input style="display: none" type="text" class="form-control" name="s_id" value="${s.s_id}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">删除</button>
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
<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add">添加学生</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="addStudentsInformation" method="post" class="needs-validation" novalidate>
                    <div class="col-md-6 mb-3">
                        <label for="addStudentId">学号</label>
                        <input type="text" class="form-control" name="s_id" id="addStudentId" required>
                        <div class="invalid-feedback">
                            请输入学号
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="addStudentName">姓名</label>
                        <input type="text" class="form-control" name="s_name" id="addStudentName" required>
                        <div class="invalid-feedback">
                            请输入姓名
                        </div>
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

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>


</body>
</html>
