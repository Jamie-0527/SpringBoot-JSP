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
<%@include file="../component/teacherLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;实训报告
        </span>
        <div style="float:right;  padding-right: 20px">
            <form class="form-inline my-2 my-lg-0" action="findReportById?page=1" method="post">
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
            <c:forEach items="${gradeReport}" var="r" varStatus="status">
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
                        if (checkStatus==0 || checkStatus==2){
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

                <%if (checkStatus==0 || checkStatus==2){%>
                <%--教师审核模态框--%>
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
                                <form action="teacherReviewReport" method="post">
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
                                            <label for="teacherId">工号</label>
                                            <input type="text" class="form-control" readonly="readonly" name="t_id" id="teacherId" value="${teacher.t_id}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="teacherName">姓名</label>
                                            <input type="text" class="form-control" readonly="readonly" name="t_name" id="teacherName" value="${teacher.t_name}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="t_review_score">审核分数<span style="color: #c6c8ca">(0-100)</span></label>
                                            <input type="number" class="form-control checkNumber" name="t_review_score" id="t_review_score" onkeyup="check(this.value)" required>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="t_review_opinion">审核意见</label>
                                        <textarea type="text" rows="10" class="form-control" name="t_review_opinion" id="t_review_opinion" style="resize: none" required></textarea>
                                    </div>
                                    <p style="color: #c6c8ca">上一次审核提交时间&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.t_review_time}</span></p>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">提交审核</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%}else {%>
                <%--教师审核模态框--%>
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
                                <form action="teacherReviewReport" method="post">
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
                                            <label for="company_name1">实训公司</label>
                                            <input type="text" class="form-control" readonly="readonly" name="company_name" id="company_name1" value="${r.company_name}" required>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <label for="commitTime1">提交时间</label>
                                            <input type="text" class="form-control" readonly="readonly" name="commitTime" id="commitTime1" value="${r.commit_time}" required>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="report_context1">实训内容</label>
                                        <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_context" id="report_context1" style="resize: none" required>
                                                ${r.report_context}
                                        </textarea>
                                    </div>
                                    <div>
                                        <label for="report_experience1">实训心得</label>
                                        <textarea type="text" rows="10" class="form-control" readonly="readonly" name="report_experience" id="report_experience1" style="resize: none" required>
                                                ${r.report_experience}
                                        </textarea>
                                    </div>
                                    <hr>
                                    <div class="form-row">
                                        <div class="col-md-4 mb-4">
                                            <label for="teacherId1">工号</label>
                                            <input type="text" class="form-control" readonly="readonly" name="t_id" id="teacherId1" value="${teacher.t_id}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="teacherName1">姓名</label>
                                            <input type="text" class="form-control" readonly="readonly" name="t_name" id="teacherName1" value="${teacher.t_name}" required>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label for="t_review_score1">审核分数<span style="color: #c6c8ca">(0-100)</span></label>
                                            <input type="number" class="form-control" readonly="readonly" name="t_review_score" id="t_review_score1" value="${r.t_review_score}" required>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="t_review_opinion1">审核意见</label>
                                        <textarea type="text" rows="10" class="form-control" readonly="readonly" name="t_review_opinion" id="t_review_opinion1" style="resize: none" required>
                                            ${r.t_review_opinion}
                                        </textarea>
                                    </div>
                                    <p style="color: #c6c8ca">
                                        上一次审核提交时间:&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.t_review_time}</span>&nbsp;&nbsp;
                                        审核人:&nbsp;&nbsp;<span style="color:#000;font-weight: bold;">${r.t_name}</span>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </c:forEach>
        </tbody>
    </table>
    <%--分页组件--%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <li class="page-item">
                        <a class="page-link" href="teacherGetReport?page=${pageNum-1 }" tabindex="-1">上一页</a>
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
                            <a class="page-link" href="teacherGetReport?page=${i}">${i}<span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="teacherGetReport?page=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum < pageCount}">
                    <li class="page-item">
                        <a class="page-link" href="teacherGetReport?page=${pageNum+1 }" tabindex="-1">下一页</a>
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
