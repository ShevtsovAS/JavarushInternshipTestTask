<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Javarush test task</title>
    <style type="text/css">
        .table_blur {
            background: #f5ffff;
            border-collapse: collapse;
            text-align: left;
        }

        .table_blur th {
            border-top: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
            background: linear-gradient(#9595b6, #5a567f);
            color: white;
            padding: 10px 15px;
            position: relative;
        }

        .table_blur th:after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            top: 25%;
            height: 25%;
            width: 100%;
            background: linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, .08));
        }

        .table_blur tr:nth-child(odd) {
            background: #ebf3f9;
        }

        .table_blur th:first-child {
            border-left: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }

        .table_blur th:last-child {
            border-right: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }

        .table_blur td {
            border: 1px solid #e3eef7;
            padding: 10px 15px;
            position: relative;
            transition: all 0.5s ease;
        }

        .table_blur tbody:hover td {
            color: transparent;
            text-shadow: 0 0 3px #a09f9d;
        }

        .table_blur tbody:hover tr:hover td {
            color: #444444;
            text-shadow: none;
        }

        .col-md-2 {
            display: inline;
        }

        .row {
            padding-bottom: 2px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title ">
                <div align="left"><a class="aCreateUser" href="createUser">Create new user</a></div>
            </h3>
        </div>
        <div class="panel-body" align="center">
            <c:if test="${empty userList}">
                There are no Users
            </c:if>
            <c:if test="${not empty userList}">
                <form action="searchUser">
                    <div class="row">
                        <div class="col-md-2">Search users by name:</div>
                        <div class="col-md-2"><input type="text" name="searchName" id="searchName"
                                                     placeholder="type name here.."></div>
                        <div class="col-md-2"><input class="btn btn-xs" type='submit' value='Search'/></div>
                    </div>
                </form>

                <table class="table_blur">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Is Admin</th>
                        <th>Created date</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <th><c:out value="${user.id}"/></th>
                            <th><c:out value="${user.name}"/></th>
                            <th><c:out value="${user.age}"/></th>
                            <th><c:out value="${user.isAdmin}"/></th>
                            <th><c:out value="${user.createdDate}"/></th>
                            <th><a class="aEdit" href="editUser?id=<c:out value='${user.id}'/>">Edit</a></th>
                            <th><a class="aDelete" href="deleteUser?id=<c:out value='${user.id}'/>">Delete</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
        <div class="panel-footer" id="pagination" align="center">
            <c:if test="${not empty userList}">
                <c:url value="/" var="prev">
                    <c:param name="page" value="${page-1}"/>
                </c:url>
                <c:if test="${page > 1}">
                    <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
                </c:if>

                <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                    <c:choose>
                        <c:when test="${page == i.index}">
                            <span>${i.index}</span>
                        </c:when>
                        <c:otherwise>
                            <c:url value="/" var="url">
                                <c:param name="page" value="${i.index}"/>
                            </c:url>
                            <a href='<c:out value="${url}"/>'>${i.index}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:url value="/" var="next">
                    <c:param name="page" value="${page + 1}"/>
                </c:url>
                <c:if test="${page + 1 <= maxPages}">
                    <a href='<c:out value="${next}" />' class="pn next">Next</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
