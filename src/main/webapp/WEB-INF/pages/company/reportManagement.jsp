<%--
  Created by IntelliJ IDEA.
  User: Zhangjiamin
  Date: 2020/12/14
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>实训报告</title>
</head>

<style>
    #lastLine:last-child td,#lastLine:last-child th{border-bottom: 1px solid rgb(222,226,230);}
</style>

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
<body>

<%--导航条--%>
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/companyLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;实训报告
        </span>
        <div style="float:right;  padding-right: 20px">
            <form class="form-inline my-2 my-lg-0" action="findReportById" method="post">
                <span>
                    <i class="fa fa-search" aria-hidden="true"></i>&nbsp;查询实训报告&nbsp;&nbsp;
                </span>
                <input class="form-control mr-sm-2" name="s_id" type="search" placeholder="请输入学号..." aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
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
            <c:forEach items="${companyReport}" var="r" varStatus="status">
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
                        if (checkStatus==0 || checkStatus==1){
                    %>
                    <td class="border-right">
                        <span class="badge badge-info">待审核</span>
                    </td>
                    <td>
                        <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">
                            <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看详情
                        </button>
                    </td>
                    <%} else if (checkStatus==4){%>
                    <td class="border-right">
                        <span class="badge badge-secondary">已打回</span>
                    </td>
                    <td>
                        <span class="badge badge-info">待重新提交</span>
<%--                        <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">查看详情</button>--%>
                    </td>
                    <%} else {%>
                    <td class="border-right">
                        <span class="badge badge-success">审核通过</span>
                    </td>
                    <td>
                        <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModify<%=i%>">
                            <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;查看详情
                        </button>
                        <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#reDo<%=i%>">
                            <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;打回重做
                        </button>
                    </td>
                    <%}%>
                </tr>
                <%--打回重做模态框--%>
                <div class="modal fade" id="reDo<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="reDoLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="reDoLabel">
                                    <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;审核实训报告
                                </h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>你确定要将此份实训报告打回重做吗？</p>
                                <form action="backReDo" method="post" >
                                    <input style="display: none" type="text" class="form-control" name="s_id" value="${r.s_id}">
                                    <input style="display: none" type="number" class="form-control" name="id" value="${r.id}">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-danger">
                                            <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;打回重做
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%--审核模态框--%>
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
                                <form action="companyReviewReport" method="post">
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
                                            <label for="company_name">实训公司</label>
                                            <input type="text" class="form-control" readonly="readonly" name="company_name" id="company_name" value="${r.company_name}" required>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <label for="commitTime">提交时间</label>
                                            <input type="text" class="form-control" readonly="readonly" name="commitTime" id="commitTime" value="${r.commit_time}" required>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="report_context">实训内容</label>
                                        <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_context" id="report_context" style="resize: none" required>
                                                ${r.report_context}
                                        </textarea>
                                    </div>
                                    <div>
                                        <label for="report_experience">实训心得</label>
                                        <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_experience" id="report_experience" style="resize: none" required>
                                                ${r.report_experience}
                                        </textarea>
                                    </div>
                                    <hr>
                                    <div class="form-row">
                                        <div class="col-md-4 mb-4">
                                            <label for="company_person_id">工号</label>
                                            <input type="text" class="form-control" readonly="readonly" name="company_person_id" id="company_person_id" value="${company.company_person_id}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="company_person">姓名</label>
                                            <input type="text" class="form-control" readonly="readonly" name="company_person" id="company_person" value="${company.company_person}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="emp_review_score">审核分数<span style="color: #c6c8ca">(0-100)</span></label>
                                            <input type="number" class="form-control checkNumber" name="emp_review_score" id="emp_review_score" onkeyup="check(this.value)" required>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="emp_review_opinion">审核意见</label>
                                        <textarea type="text" rows="10" class="form-control" name="emp_review_opinion" id="emp_review_opinion" style="resize: none" required></textarea>
                                    </div>
                                    <p style="color: #c6c8ca">上一次审核提交时间&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.emp_review_time}</span></p>
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

<script>
    function check(str){
        var re=/^(?:[1-9]?\d|100)$/;
        if(re.test(str)){
            $(".checkNumber").val(str);
        }else{
            $(".checkNumber").val('');
        }
    }
</script>
</body>
</html>
