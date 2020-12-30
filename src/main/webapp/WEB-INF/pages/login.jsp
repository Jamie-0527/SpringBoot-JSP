<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/10/6
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录页面</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<style>
    body{
        font-size: 18px;
        font-family: 微软雅黑;
        background-image: url("./imgs/bg.png");
    }

    .login-form{
        height: auto;
        width: 25%;
        background-color: rgba(255,255,255,0.9);
        margin: 180px auto;
        padding: 20px 50px;
    }

    .form-control-feedback {
        line-height: 50px;
        left: 20px;
    }

</style>

<body>
<div class="login-form">
    <img src="imgs/login-logo.png" width="100%" height="80" alt="武汉晴川学院" loading="lazy">
    <h3 style="text-align: center; font-weight: bold">实习实训信息管理系统</h3>
    <form method="post" action="/login" style="padding-top: 20px" class="needs-validation" novalidate>
        <div class="form-group">
            <input type="text" class="form-control" name="loginName" placeholder="用户名" required>
            <div class="invalid-feedback">
                请输入用户名
            </div>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="密码" required>
            <div class="invalid-feedback">
                请输入密码
            </div>
            <small class="form-text text-danger">${error}</small><small class="form-text text-success">${ok_update}</small>
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100%">登录</button>
    </form>
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
