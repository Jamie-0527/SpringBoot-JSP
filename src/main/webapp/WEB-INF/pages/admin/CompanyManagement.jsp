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
    String error = (String) request.getAttribute("addCompanyError");
    String ok = (String) request.getAttribute("ok_addC");
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
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAdd">添加企业员工</button>
    </div>
    <%--打印企业员工信息--%>
    <table class="table table-striped">
        <thead>
        <tr align="center">
            <th class="border-right" scope="col">编号</th>
            <th class="border-right" scope="col">公司ID</th>
            <th class="border-right" scope="col">公司名称</th>
            <th class="border-right" scope="col">公司地址</th>
            <th class="border-right" scope="col">负责人ID</th>
            <th class="border-right" scope="col">姓名</th>
            <th class="border-right" scope="col">联系方式</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${allCompany}" var="c" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${c.company_id}</td>
                <td class="border-right">${c.company_name}</td>
                <td class="border-right">${c.company_address}</td>
                <td class="border-right">${c.company_person_id}</td>
                <td class="border-right">${c.company_person}</td>
                <td class="border-right">${c.company_phone}</td>
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
                            <!--此处是修改表单-->
                            <form action="updateCompanyInformation" method="post">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComId" class="input-group-text">&nbsp;&nbsp;公司ID&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_id" id="ComId" value="${c.company_id}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComName" class="input-group-text">公司名称</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_name" id="ComName" value="${c.company_name}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComAddress" class="input-group-text">公司地址</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_address" id="ComAddress" value="${c.company_address}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComPersonId" class="input-group-text">负责人ID</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_person_id" id="ComPersonId" value="${c.company_person_id}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComPersonName" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_person" id="ComPersonName" value="${c.company_person}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label for="ComPhone" class="input-group-text">联系方式</label>
                                    </div>
                                    <input type="text" class="form-control" name="company_phone" id="ComPhone" value="${c.company_phone}">
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
                            <form action="deleteCompanyInformation" method="post" >
                                <input style="display: none" type="text" class="form-control" name="company_person_id" value="${c.company_person_id}">
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
<%--添加企业员工的模态框--%>
<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="add">添加企业员工</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="addCompanyInformation" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="addComPersonId" class="input-group-text">&nbsp;&nbsp;&nbsp;工&nbsp;号&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="company_person_id" id="addComPersonId">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label for="addComPerson" class="input-group-text">&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;</label>
                        </div>
                        <input type="text" class="form-control" name="company_person" id="addComPerson">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="addPerson">提交</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


</body>
</html>
