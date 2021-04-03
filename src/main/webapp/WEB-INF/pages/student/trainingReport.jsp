<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/12
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>实训报告</title>
</head>

<%--<link rel="stylesheet" href="/css/bootstrap.min.css">--%>
<%--<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css">--%>

<%--<script src="js/jquery-3.5.1.min.js"></script>--%>
<%--<script src="js/popper.min.js"></script>--%>
<%--<script src="js/bootstrap.min.js"></script>--%>

<%--<script src="js/bootstrap-datetimepicker.min.js"></script>--%>
<%--<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>--%>

<%
    //初始化一个int i，用于回去列表每行ID
    int i=1;
    String ok = (String) request.getAttribute("ok_submit");
%>
<script>
    window.onload=function () {
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
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/studentLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;实训报告
        </span>
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAdd">
            <i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;添加实训报告
        </button>
    </div>

<table class="table table-striped">
<thead>
<tr align="center">
    <th class="border-right" scope="col">编号</th>
    <th class="border-right" scope="col">学号</th>
    <th class="border-right" scope="col">姓名</th>
    <th class="border-right" scope="col">班级</th>
    <th class="border-right" scope="col">学院</th>
    <th class="border-right" scope="col">提交时间</th>
    <th class="border-right" scope="col">实训公司</th>
    <th class="border-right" scope="col">实训内容</th>
    <th class="border-right" scope="col">状态</th>
    <th scope="col">操作</th>
</tr>
</thead>
    <tbody>
        <c:forEach items="${myReport}" var="r" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${r.s_id}</td>
                <td class="border-right">${r.s_name}</td>
                <td class="border-right">${r.c_name}</td>
                <td class="border-right">${r.s_college}</td>
                <td class="border-right">${r.commit_time}</td>
                <td class="border-right">${r.company_name}</td>
                <td class="border-right">
                <span class="d-inline-block text-truncate" style="max-width: 200px;">
                    ${r.report_context}
                </span>
                </td>
                <c:set var="nowStatus" value="${r.report_status}" scope="page"></c:set>
                <%
                    int checkStatus = (int)pageContext.getAttribute("nowStatus");
                    if (checkStatus==0 || checkStatus==1 || checkStatus==2){
                %>
                <td class="border-right">
                    <span class="badge badge-info">待审核</span>
                </td>
                <%} else if (checkStatus==4){%>
                <td class="border-right">
                    <span class="badge badge-danger">已打回</span>
                </td>
                <%} else if (checkStatus==3){%>
                <td class="border-right">
                    <span class="badge badge-success">审核通过</span>
                </td>
                <%}%>
                <td>
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">
                        <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看详情
                    </button>
                </td>
            </tr>

            <%if (checkStatus==0 || checkStatus==1 || checkStatus==2 || checkStatus==3){%>
            <%--查看详情模态框--%>
            <div class="modal fade" id="myModify<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel1">
                                <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;审核实训报告
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <%--此处是修改表单--%>
                            <form action="studentSubmitReport" method="post">
                                <div class="form-row">
                                    <input type="number" style="display: none;" name="id" value="${r.id}">
                                    <input type="number" style="display: none;" name="report_status" value="${r.report_status}">
                                    <div class="col-md-3 mb-3">
                                        <label for="studentId1">学号</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_id" id="studentId1" value="${r.s_id}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentName1">姓名</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_name" id="studentName1" value="${r.s_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentGrade1">班级</label>
                                        <input type="text" class="form-control" readonly="readonly" name="c_name" id="studentGrade1" value="${r.c_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentCollege1">学院</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_college" id="studentCollege1" value="${r.s_college}" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-9">
                                        <label for="companyName1">实训公司</label>
                                        <input type="text" class="form-control" readonly="readonly" name="company_name" id="companyName1" value="${r.company_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="commitTime1">提交时间</label>
                                        <input type="text" class="form-control" readonly="readonly" name="commitTime" id="commitTime1" value="${r.commit_time}" required>
                                    </div>
                                </div>
                                <div>
                                    <label for="reportContext1">实训内容</label>
                                    <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_context" id="reportContext1" style="resize: none" required>
                                            ${r.report_context}
                                    </textarea>
                                </div>
                                <div>
                                    <label for="reportExperience1">实训心得</label>
                                    <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_experience" id="reportExperience1" style="resize: none" required>
                                            ${r.report_experience}
                                    </textarea>
                                </div>
                                <p style="color: #c6c8ca">
                                    上一次提交时间:&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.commit_time}</span>&nbsp;&nbsp;
                                    审核人:&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.t_name}&nbsp;&nbsp;${r.company_person}</span>
                                </p>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
<%--                                    <button type="submit" class="btn btn-primary">提交审核</button>--%>
<%--                                </div>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%}else {%>
            <%--新建模态框--%>
            <div class="modal fade" id="myModify<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">
                                <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;审核实训报告
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                                <%--此处是修改表单--%>
                            <form action="studentSubmitReport" method="post">
                                <div class="form-row">
                                    <input type="number" style="display: none;" name="id" value="${r.id}">
                                    <input type="number" style="display: none;" name="report_status" value="${r.report_status}">
                                    <div class="col-md-3 mb-3">
                                        <label for="studentId">学号</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_id" id="studentId" value="${r.s_id}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentName">姓名</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_name" id="studentName" value="${r.s_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentGrade">班级</label>
                                        <input type="text" class="form-control" readonly="readonly" name="c_name" id="studentGrade" value="${r.c_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="studentCollege">学院</label>
                                        <input type="text" class="form-control" readonly="readonly" name="s_college" id="studentCollege" value="${r.s_college}" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-9">
                                        <label for="companyName">实训公司</label>
                                        <input type="text" class="form-control" readonly="readonly" name="company_name" id="companyName" value="${r.company_name}" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="commitTime">提交时间</label>
                                        <input type="text" class="form-control" readonly="readonly" name="commitTime" id="commitTime" value="${r.commit_time}" required>
                                    </div>
                                </div>
                                <div>
                                    <label for="reportContext">实训内容</label>
                                    <textarea type="text" rows="10" class="form-control" name="report_context" id="reportContext" style="resize: none" required>
                                            ${r.report_context}
                                    </textarea>
                                </div>
                                <div>
                                    <label for="reportExperience">实训心得</label>
                                    <textarea type="text" rows="10" class="form-control" name="report_experience" id="reportExperience" style="resize: none" required>
                                            ${r.report_experience}
                                    </textarea>
                                </div>
                                <p style="color: #c6c8ca">上一次提交时间&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.commit_time}</span></p>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">提交审核</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </c:forEach>
    </tbody>
</table>

    <%--添加实训报告的模态框--%>
    <div class="modal fade" id="modalAdd" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="add">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;添加实训报告
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
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
                                <select class="custom-select" id="s_college" name="s_college" required>
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
                        <div class="modal-footer">
                            <button style="float: right" class="btn btn-primary" type="submit">提交</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <%--分页组件--%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <li class="page-item">
                        <a class="page-link" href="findMyReport?page=${pageNum-1 }" tabindex="-1">上一页</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="javascript:void(0)" tabindex="-1" >上一页</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <%-- 当总页数不足10页，显示所有页数 --%>
                <c:when test="${pageCount <=10}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pageCount}"/>
                </c:when>
                <c:otherwise>
                    <%-- 当总页数大于10页，通过公式计算出begin和end --%>
                    <c:set var="begin" value="${pageNum-5}"/>
                    <c:set var="end" value="${pageNum+4}"/>
                    <%-- 头溢出 --%>
                    <c:if test="${begin<1}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="10"/>
                    </c:if>
                    <%-- 尾溢出 --%>
                    <c:if test="${end>pageCount}">
                        <c:set var="begin" value="${pageCount-9}"/>
                        <c:set var="end" value="${pageCount}"/>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <%-- 循环遍历页码列表 --%>
            <c:forEach var="i" begin="${begin}" end="${end}">
                <c:choose>
                    <c:when test="${i eq pageNum}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="findMyReport?page=${i}">${i}<span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="findMyReport?page=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum < pageCount}">
                    <li class="page-item">
                        <a class="page-link" href="findMyReport?page=${pageNum+1 }" tabindex="-1">下一页</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="javascript:void(0)" tabindex="-1" >下一页</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
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
