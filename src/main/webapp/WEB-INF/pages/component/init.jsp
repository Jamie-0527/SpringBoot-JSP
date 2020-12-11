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

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <form action="initStudent" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="addStudentId" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" readonly="readonly" name="s_id" id="addStudentId" value="${init.userName}">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="s_pwd" class="input-group-text">&nbsp;&nbsp;&nbsp;密&nbsp;码&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="password" class="form-control" name="s_pwd" id="s_pwd">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="s_pwdConfirm" class="input-group-text">确认密码</label>
                        </div>
                        <input type="password" class="form-control" name="s_pwdConfirm" id="s_pwdConfirm">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="addStudentName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="s_name" id="addStudentName">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="addStudentGrade" class="input-group-text">&nbsp;&nbsp;&nbsp;班&nbsp;级&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="c_name" id="addStudentGrade">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="addStudentPhone" class="input-group-text">联系方式</label>
                        </div>
                        <input type="text" class="form-control" name="s_phone" id="addStudentPhone">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                            <label for="addStudentCollege" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;院&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <select class="form-control" id="addStudentCollege" name="s_college">
                            <option style="display: none;"></option>
                            <option>计算机学院</option>
                            <option>电机学院</option>
                            <option>传媒艺术学院</option>
                            <option>外语学院</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="addStudentCompany" class="input-group-text">实训公司</label>
                        </div>
                        <input type="text" class="form-control" name="company_name" id="addStudentCompany">
                    </div>
                    <p style="font-size: 10px"><span style="color: red;">*&nbsp;&nbsp;</span>标注的为必填项</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="initStudent">提交</button>
                    </div>
                </form>
                <%}else if (authority==2){%>
                    <%--教师端初始化--%>
                    <form action="initTeacher" method="post">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addTeacherId" class="input-group-text">&nbsp;&nbsp;&nbsp;工&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="text" class="form-control" readonly="readonly" name="t_id" id="addTeacherId" value="${init.userName}">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="t_pwd" class="input-group-text">&nbsp;&nbsp;&nbsp;密&nbsp;码&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="password" class="form-control" name="t_pwd" id="t_pwd">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="t_pwdConfirm" class="input-group-text">确认密码</label>
                            </div>
                            <input type="password" class="form-control" name="t_pwdConfirm" id="t_pwdConfirm">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addTeacherName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="text" class="form-control" name="t_name" id="addTeacherName">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addTeacherRank" class="input-group-text">&nbsp;&nbsp;&nbsp;职&nbsp;称&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <select class="form-control" id="addTeacherRank" name="t_rank">
                                <option style="display: none;"></option>
                                <option>教授</option>
                                <option>副教授</option>
                                <option>讲师</option>
                                <option>助教</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addTeacherCollege" class="input-group-text">&nbsp;&nbsp;&nbsp;学&nbsp;院&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <select class="form-control" id="addTeacherCollege" name="t_college">
                                <option style="display: none;"></option>
                                <option>计算机学院</option>
                                <option>电机学院</option>
                                <option>传媒艺术学院</option>
                                <option>外语学院</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addTeacherPhone" class="input-group-text">联系方式</label>
                            </div>
                            <input type="text" class="form-control" name="t_phone" id="addTeacherPhone">
                        </div>
                        <p style="font-size: 10px"><span style="color: red;">*&nbsp;&nbsp;</span>标注的为必填项</p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" id="initTeacher">提交</button>
                        </div>
                    </form>
                <%}else if (authority==3){%>
                    <%--企业员工初始化--%>
                    <form action="initCompany" method="post">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyPersonId" class="input-group-text">&nbsp;&nbsp;&nbsp;工&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="text" class="form-control" readonly="readonly" name="company_person_id" id="addCompanyPersonId" value="${init.userName}">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="c_pwd" class="input-group-text">&nbsp;&nbsp;&nbsp;密&nbsp;码&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="password" class="form-control" name="c_pwd" id="c_pwd">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="c_pwdConfirm" class="input-group-text">确认密码</label>
                            </div>
                            <input type="password" class="form-control" name="c_pwdConfirm" id="c_pwdConfirm">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyId" class="input-group-text">&nbsp;&nbsp;公司ID&nbsp;&nbsp;</label>
                            </div>
                            <input type="text" class="form-control" name="company_id" id="addCompanyId">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyName" class="input-group-text">公司名字</label>
                            </div>
                            <input type="text" class="form-control" name="company_name" id="addCompanyName">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyAddress" class="input-group-text">公司地址</label>
                            </div>
                            <input type="text" class="form-control" name="company_address" id="addCompanyAddress">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyPerson" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                            </div>
                            <input type="text" class="form-control" name="company_person" id="addCompanyPerson">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span style="color: red; font-size: 20px; margin-top: 5px">*</span>
                                <label for="addCompanyPhone" class="input-group-text">联系方式</label>
                            </div>
                            <input type="text" class="form-control" name="company_phone" id="addCompanyPhone">
                        </div>
                        <p style="font-size: 10px"><span style="color: red;">*&nbsp;&nbsp;</span>标注的为必填项</p>
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

</body>
</html>
