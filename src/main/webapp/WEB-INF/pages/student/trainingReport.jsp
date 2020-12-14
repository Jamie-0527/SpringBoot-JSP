<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/12
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实训报告</title>
</head>

<link rel="stylesheet" href="/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css">

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>



<body>

<%--侧边栏--%>
<%@include file="../component/studentLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 20px 0px 20px">实训报告</span>
    </div>0
    <div style="width: 50%; margin: 0px auto;">
        <form class="needs-validation" action="studentSubmitReport" method="post" novalidate>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="s_id">学号</label>
                    <input type="text" class="form-control" name="s_id" id="s_id" required>
                    <div class="invalid-feedback">
                        请输入学号
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="s_name">姓名</label>
                    <input type="text" class="form-control" name="s_name" id="s_name" required>
                    <div class="invalid-feedback">
                        请输入姓名
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="c_name">班级</label>
                    <input type="text" class="form-control" name="c_name" id="c_name" required>
                    <div class="invalid-feedback">
                        请输入班级
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="s_college">学院</label>
                    <input type="text" class="form-control" name="s_college" id="s_college" required>
                    <div class="invalid-feedback">
                        请输入学院
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="begin_time">开始时间</label>
                    <input type="text" class="form-control" name="start_time" id="begin_time" required>
                    <div class="invalid-feedback">
                        请输入开始时间
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="end_time">结束时间</label>
                    <input type="text" class="form-control" name="over_time" id="end_time" required>
                    <div class="invalid-feedback">
                        请输入结束时间
                    </div>
                </div>
            </div>

            <label for="company_name">实训公司</label>
            <input type="text" class="form-control" name="company_name" id="company_name" required>
            <div class="invalid-feedback">
                请输入结束时间
            </div>

            <div class="mb-3">
                <label for="report_context">实训内容</label><span></span>
                <textarea style="resize: none" class="form-control" name="report_context" id="report_context" rows="6" required></textarea>
                <div class="invalid-feedback">
                    请输入实训内容
                </div>
            </div>
            <div class="mb-3">
                <label for="report_experience">实训心得</label>
                <textarea style="resize: none" class="form-control" name="report_experience" id="report_experience" rows="5" required></textarea>
                <div class="invalid-feedback">
                    请输入实训心得
                </div>
            </div>
            <button style="float: right" class="btn btn-primary" type="submit">提交</button>
        </form>
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

    $(document).ready(function() {
        $('#begin_time').datetimepicker({
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            minView: "month",
            autoclose: true,
            todayBtn: "linked",
        }).on("click", function () {
           $("#begin_time").datetimepicker("setEndDate", $("#end_time").val());
        });
        $('#end_time').datetimepicker({
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            minView: "month",
            autoclose: true,
            todayBtn: "linked"
        }).on("click", function () {
           $("#end_time").datetimepicker("setStartDate", $("#begin_time").val());
        });
    });
</script>
</body>
</html>
