<%@ page import="com.min.graduation.entity.Login" %><%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/6
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实习实训管理系统</title>
</head>

<%
    //获取权限
    Login init = (Login) request.getAttribute("init");
    Integer authority = init.getAuthority();
%>

<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/init.js"></script>

<body>

<div class="jumbotron">
    <h1 class="display-4">您好！欢迎使用本系统</h1>
    <p class="lead">为了您账号的安全性，不影响本系统的使用状态，<span style="color: red">请您尽快更改此账户的密码和有关信息!</span></p>
    <hr class="my-4">
    <p>点击下方按钮即可修改信息</p>
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" role="button">点击修改</button>
</div>

<div class="modal fade" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">欢迎使用本系统！</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%--学生端初始化--%>
                <%if (authority==1){%>
                <form action="initStudent" method="post" class="needs-validation" novalidate>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="addStudentId">学号</label>
                            <input type="text" class="form-control" readonly="readonly" name="s_id" id="addStudentId" value="${init.userName}" required>
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
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="s_pwd">密码</label>
                            <input type="password" class="form-control" name="s_pwd" id="s_pwd" required>
                            <div class="invalid-feedback">
                                请输入密码
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="s_pwdConfirm">确认密码</label>
                            <input type="password" class="form-control" name="s_pwdConfirm" id="s_pwdConfirm" required>
                            <div class="invalid-feedback">
                                请输入密码
                            </div>
                        </div>
                    </div>

                    <label for="addStudentGrade">班级</label>
                    <input type="text" class="form-control" name="c_name" id="addStudentGrade" required>
                    <div class="invalid-feedback">
                        请输入班级
                    </div>

                    <label for="addStudentCollege">学院</label>
                    <select class="custom-select" id="addStudentCollege" name="s_college" required>
                        <option selected disabled></option>
                        <option>计算机学院</option>
                        <option>电机学院</option>
                        <option>传媒艺术学院</option>
                        <option>外语学院</option>
                    </select>
                    <div class="invalid-feedback">
                        请选择学院
                    </div>

                    <label for="addStudentPhone">联系方式</label>
                    <input type="text" class="form-control" name="s_phone" id="addStudentPhone" required>
                    <div class="invalid-feedback">
                        请输入联系方式
                    </div>

                    <label for="addStudentCompany">实训公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="font-italic" style="color: #c6c8ca">注：此处可选填</span>
                    </label>
                    <input type="text" class="form-control" name="company_name" id="addStudentCompany"><br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="initStudent">提交</button>
                    </div>
                </form>
                <%}else if (authority==2){%>
                    <%--教师端初始化--%>
                    <form action="initTeacher" method="post" class="needs-validation" novalidate>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="addTeacherId">工号</label>
                                <input type="text" class="form-control" readonly="readonly" name="t_id" id="addTeacherId" value="${init.userName}" required>
                                <div class="invalid-feedback">
                                    请输入工号
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="addTeacherName">姓名</label>
                                <input type="text" class="form-control" name="t_name" id="addTeacherName" required>
                                <div class="invalid-feedback">
                                    请输入姓名
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="t_pwd">密码</label>
                                <input type="password" class="form-control" name="t_pwd" id="t_pwd" required>
                                <div class="invalid-feedback">
                                    请输入密码
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="t_pwdConfirm">确认密码</label>
                                <input type="password" class="form-control" name="t_pwdConfirm" id="t_pwdConfirm" required>
                                <div class="invalid-feedback">
                                    请输入密码
                                </div>
                            </div>
                        </div>

                        <label for="addTeacherRank">职称</label>
                        <select class="custom-select" id="addTeacherRank" name="t_rank" required>
                            <option selected disabled></option>
                            <option>教授</option>
                            <option>副教授</option>
                            <option>讲师</option>
                            <option>助教</option>
                        </select>
                        <div class="invalid-feedback">
                            请选择职称
                        </div>

                        <label for="addTeacherCollege">学院</label>
                        <select class="custom-select" id="addTeacherCollege" name="t_college" required>
                            <option selected disabled></option>
                            <option>计算机学院</option>
                            <option>电机学院</option>
                            <option>传媒艺术学院</option>
                            <option>外语学院</option>
                        </select>
                        <div class="invalid-feedback">
                            请选择学院
                        </div>

                        <label for="addTeacherPhone">联系方式</label>
                        <input type="text" class="form-control" name="t_phone" id="addTeacherPhone" required>
                        <div class="invalid-feedback">
                            请输入联系方式
                        </div><br>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" id="initTeacher">提交</button>
                        </div>
                    </form>
                <%}else if (authority==3){%>
                    <%--企业员工初始化--%>
                    <form action="test" method="post" class="needs-validation" novalidate>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="addCompanyPersonId">工号</label>
                                <input type="text" class="form-control" readonly="readonly" name="company_person_id" id="addCompanyPersonId" value="${init.userName}" required>
                                <div class="invalid-feedback">
                                    请输入工号
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="addCompanyPerson">姓名</label>
                                <input type="text" class="form-control" name="company_person" id="addCompanyPerson" required>
                                <div class="invalid-feedback">
                                    请输入姓名
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="c_pwd">密码</label>
                                <input type="password" class="form-control" name="c_pwd" id="c_pwd" required>
                                <div class="invalid-feedback">
                                    请输入密码
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="c_pwdConfirm">确认密码</label>
                                <input type="password" class="form-control" name="c_pwdConfirm" id="c_pwdConfirm" required>
                                <div class="invalid-feedback">
                                    请输入密码
                                </div>
                            </div>
                        </div>

                        <label for="addCompanyPhone">联系方式</label>
                        <input type="text" class="form-control" name="company_phone" id="addCompanyPhone" required>
                        <div class="invalid-feedback">
                            请输入联系方式
                        </div>

                        <label for="addCompanyId">公司ID</label>
                        <input type="text" class="form-control" name="company_id" id="addCompanyId" required>
                        <div class="invalid-feedback">
                            请输入公司ID
                        </div>

                        <label for="addCompanyName">公司名称</label>
                        <input type="text" class="form-control" name="company_name" id="addCompanyName" required>
                        <div class="invalid-feedback">
                            请输入公司名称
                        </div>

                        <label for="addCompanyAddress">公司地址</label>
                        <input type="text" class="form-control" name="company_address" id="addCompanyAddress" required>
                        <div class="invalid-feedback">
                            请输入公司地址
                        </div><br>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" id="initCompany">提交</button>
                        </div>
                    </form>
                <%}%>
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
