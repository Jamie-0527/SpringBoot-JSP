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
    String error = (String) request.getAttribute("addTeacherError");
    String ok = (String) request.getAttribute("ok_addT");
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

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/adminLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-users" aria-hidden="true"></i>&nbsp;教师管理
        </span>
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAdd">
            <i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;添加教师
        </button>
    </div>
    <%--打印教师信息--%>
    <table class="table table-striped">
        <thead>
        <tr align="center">
            <th class="border-right" scope="col">编号</th>
            <th class="border-right" scope="col">工号</th>
            <th class="border-right" scope="col">姓名</th>
            <th class="border-right" scope="col">职称</th>
            <th class="border-right" scope="col">学院</th>
            <th class="border-right" scope="col">联系电话</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${allTeacher}" var="t" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${t.t_id}</td>
                <td class="border-right">${t.t_name}</td>
                <td class="border-right">${t.t_rank}</td>
                <td class="border-right">${t.t_college}</td>
                <td class="border-right">${t.t_phone}</td>
                <td>
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">
                        <i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;修改
                    </button>
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalDel<%=i%>">
                        <i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除
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
                            <form action="updateTeacherInformation">
                                <div class="form-row">
                                    <div class="col-md-6 mb-3">
                                        <label for="teacherId">工号</label>
                                        <input type="text" class="form-control" name="t_id" id="teacherId" value="${t.t_id}" required>
                                        <div class="invalid-feedback">
                                            请输入工号
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="teacherName">姓名</label>
                                        <input type="text" class="form-control" name="t_name" id="teacherName" value="${t.t_name}" required>
                                        <div class="invalid-feedback">
                                            请输入姓名
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <label for="teacherRank">职称</label>
                                    <select class="custom-select" id="teacherRank" name="t_rank" required>
                                        <option selected disabled></option>
                                        <option>教授</option>
                                        <option>副教授</option>
                                        <option>讲师</option>
                                        <option>助教</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        请输入职称
                                    </div>
                                </div>
                                <div>
                                    <label for="teacherCollege">学院</label>
                                    <select class="custom-select" id="teacherCollege" name="t_college" required>
                                        <option selected disabled></option>
                                        <option>计算机学院</option>
                                        <option>电机学院</option>
                                        <option>传媒艺术学院</option>
                                        <option>外语学院</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        请选择学院
                                    </div>
                                </div>
                                <div>
                                    <label for="teacherPhone">联系方式</label>
                                    <input type="text" class="form-control" name="t_phone" id="teacherPhone" value="${t.t_phone}" required>
                                    <div class="invalid-feedback">
                                        请输入联系方式
                                    </div>
                                </div>
                                <br>
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
            <div class="modal fade" id="modalDel<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="del" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="del">
                                <i class="fa fa-trash" aria-hidden="true"></i>&nbsp;Confirm
                            </h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>数据不可恢复，你确定要删除此条记录吗？</p>
                            <form action="deleteTeacherInformation" method="post" >
                                <input style="display: none" type="text" class="form-control" name="t_id" value="${t.t_id}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">
                                        <i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除
                                    </button>
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
<%--添加教师的模态框--%>
<div class="modal fade" id="modalAdd" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add">
                    <i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;添加教师
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="addTeacherInformation" method="post" class="needs-validation" novalidate>
                    <div class="col-md-12">
                        <label for="addTeacherId">工号</label>
                        <input type="text" class="form-control" name="t_id" id="addTeacherId" required>
                        <div class="invalid-feedback">
                            请输入工号
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="addTeacherName">姓名</label>
                        <input type="text" class="form-control" name="t_name" id="addTeacherName" required>
                        <div class="invalid-feedback">
                            请输入姓名
                        </div>
                    </div>
                    <br>
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
