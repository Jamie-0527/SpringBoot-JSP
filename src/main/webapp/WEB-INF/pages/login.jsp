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
<link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style>

    *{
        font-family: "微软雅黑";
        font-size: 22px;
    }
    
    body{
        background-image: url("./imgs/bg.png");
    }
    
    form{
        height: 30%;
        width: 20%;
        margin: 0 auto;
        margin-top: 10%;
    }


</style>

<body>

<form method="post" action="/login">
    <div class="form-group">
        <label for="loginName">LoginName</label>
        <input type="text" class="form-control" id="loginName" name="loginName" aria-describedby="emailHelp">
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password">
        <small class="form-text text-danger">${error}</small><small class="form-text text-success">${ok_update}</small>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>