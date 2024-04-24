<%--
  Created by IntelliJ IDEA.
  User: nimit
  Date: 22/04/24
  Time: 3:29 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Change Password</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .paint-card {
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease;
        }

        .paint-card:hover {
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 10px;
            margin-bottom: 10px;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin-bottom: 10px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 40px;
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <c:if test="${empty userObj}" >
        <:c:redirect url="user_login.jsp"></:c:redirect>
    </c:if>

    <div class="container p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="container-fluid">
                        <h2 class="text-dark">Change Password</h2>
                    </div>
                    <c:if test="${not empty succMsg }">
                        <div class="success-message">${succMsg}</div>
                        <c:remove var = "succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errorMsg }">
                        <div class="error-message">${errorMsg}</div>
                        <c:remove var = "errorMsg" scope="session"/>
                    </c:if>
                    <div class="card-body">
                        <form action="userChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label> <input type="text" name="newPassword" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label> <input type="text" name="oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" value="${userObj.id}" name="uid">
                            <button class="btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
