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
    <title>账户管理</title>
</head>
<%
    //初始化一个int i，用于回去列表每行ID
    int i=1;
    String error = (String) request.getAttribute("addStudentError");
    String ok = (String) request.getAttribute("ok_addS");
%>


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
<%@include file="../component/top.jsp"%>
<%--侧边栏--%>
<%@include file="../component/adminLeft.jsp"%>

<div style="width: 85%;float:right;">
    <div class="border-bottom" style="background-color: rgb(248,249,250);font-size: 16px;line-height: 50px">
        <span class="font-weight-bold" style="margin: 10px 50px 0px 20px">
            <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;学生账户管理
        </span>
    </div>
    <%--打印账户信息--%>
    <table class="table table-striped">
        <thead>
        <tr align="center">
            <th class="border-right" scope="col">编号</th>
            <th class="border-right" scope="col">用户名</th>
            <th class="border-right" scope="col">姓名</th>
            <th class="border-right" scope="col">账号创建时间</th>
            <th class="border-right" scope="col">密码修改时间</th>
            <th class="border-right" scope="col">状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${studentAccount}" var="s" varStatus="status">
            <%--此处累加i的值，获取不同模态的数据--%><% i++; %>
            <tr align="center" id="lastLine">
                <th class="border-right" scope="row">${status.index+1}</th>
                <td class="border-right">${s.login.userName}</td>
                <td class="border-right">${s.student.s_name}</td>
                <td class="border-right">${s.login.createTime}</td>
                <td class="border-right">${s.login.modifyTime}</td>
                <c:set var="nowStatus" value="${s.login.status}" scope="page"></c:set>
                <%
                    int checkStatus = (int)pageContext.getAttribute("nowStatus");
                    if (checkStatus==0){
                %>
                <td class="border-right">
                    <span class="badge badge-success">有效</span>
                </td>
                <td>
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalDel<%=i%>">
                        <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;禁用
                    </button>
                </td>
            </tr>

            <%--禁用账户模态框--%>
            <div class="modal fade" id="modalDel<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="disableAccount" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="disableAccount">
                                <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;Confirm
                            </h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>你确定要禁用此账户吗？</p>
                            <form action="disableAccount" method="post" >
                                <input style="display: none" type="text" class="form-control" name="user_name" value="${s.login.userName}">
                                <input style="display: none" type="text" class="form-control" name="authority" value="${s.login.authority}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">
                                        <i class="fa fa-remove" aria-hidden="true"></i>&nbsp;禁用
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
                <%} else {%>
                <td class="border-right">
                    <span class="badge badge-danger">禁用</span>
                </td>
                <td>
                    <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalDel<%=i%>">
                        <i class="fa fa-check" aria-hidden="true"></i>&nbsp;启用
                    </button>
                </td>
            </tr>

            <%--启用账户模态框--%>
            <div class="modal fade" id="modalDel<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="enableAccount" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="enableAccount">
                                <i class="fa fa-check" aria-hidden="true"></i>&nbsp;Confirm
                            </h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>你确定要启用此账户吗？</p>
                            <form action="enableAccount" method="post" >
                                <input style="display: none" type="text" class="form-control" name="user_name" value="${s.login.userName}">
                                <input style="display: none" type="text" class="form-control" name="authority" value="${s.login.authority}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-success">
                                        <i class="fa fa-check" aria-hidden="true"></i>&nbsp;启用
                                    </button>
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
    <%--分页组件--%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <li class="page-item">
                        <a class="page-link" href="studentAccountManagement?page=${pageNum-1 }" tabindex="-1">Previous</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="javascript:void(0)" tabindex="-1" >Previous</a>
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
                            <a class="page-link" href="studentAccountManagement?page=${i}">${i}<span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="studentAccountManagement?page=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum < pageCount}">
                    <li class="page-item">
                        <a class="page-link" href="studentAccountManagement?page=${pageNum+1 }" tabindex="-1">Next</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <a class="page-link" href="javascript:void(0)" tabindex="-1" >Next</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>

</body>
</html>
