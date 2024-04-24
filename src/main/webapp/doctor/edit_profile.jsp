<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="com.model.Specialist" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nimit
  Date: 22/04/24
  Time: 7:02 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 15px;
        }

        .card-body {
            padding: 40px;
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn {
            border-radius: 5px;
        }

        .text-decoration-none {
            text-decoration: none;
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
    </style>
</head>
<body>
<c:if test="${ empty doctObj}">
    <c:redirect url="../doctor_login.jsp">Redirecting...</c:redirect>
</c:if>

<%@ include file="navbar.jsp"%>
<div class="container p-4">
    <div class="row">
        <div class="col-md-5">
            <div class="card paint-card">
                <div class="container-fluid">
                    <h2 class="text-dark text-center">Edit Profile</h2>
                </div>
                <c:if test="${not empty succMsgd}">
                    <div class="success-message">${succMsgd}</div>
                    <c:remove var="succMsgd" scope="session"/>
                </c:if>

                <c:if test="${not empty errorMsgd}">
                    <div class="error-message">${errorMsgd}</div>
                    <c:remove var="errorMsgd" scope="session"/>
                </c:if>
                <div class="paint-card card">
                    <form action="../doctorUpdateProfile" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label> <input type="text" required name="fullname" class="form-control" value="${doctObj.fullName}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">DOB</label> <input type="date" required name="dob" class="form-control" value="${doctObj.dob}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Qualification</label> <input type="text" required name="qualification" class="form-control" value="${doctObj.qualification}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" required class="form-control">
                                <option>${doctObj.specialist}</option>
                                <% SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
                                    List<Specialist> list= dao.getAllSpecialist();
                                    for (Specialist s: list) {%>
                                <option><%= s.getSpecialistName() %></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label> <input type="email" name="email" readonly class="form-control" value="${doctObj.email}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mob No</label> <input type="text" required name="mobno" class="form-control" value="${doctObj.mobNo}">
                        </div>

                        <input type="hidden" name="id" value="${doctObj.id}">

                        <button type="submit" class="btn btn-primary">Update Changes</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-1"></div>

        <div class="col-md-5">
            <div class="card paint-card">
                <div class="container-fluid">
                    <h2 class="text-dark text-center">Change Password</h2>
                </div>
                <c:if test="${not empty succMsg}">
                    <div class="success-message">${succMsg}</div>
                    <c:remove var="succMsg" scope="session"/>
                </c:if>

                <c:if test="${not empty errorMsg}">
                    <div class="error-message">${errorMsg}</div>
                    <c:remove var="errorMsg" scope="session"/>
                </c:if>
                <div class="card-body">
                    <form action="../doctChangePassword" method="post">
                        <div class="mb-3">
                            <label>Enter New Password</label> <input type="text" name="newPassword" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Enter Old Password</label> <input type="text" name="oldPassword" class="form-control" required>
                        </div>
                        <input type="hidden" value="${doctObj.id}" name="uid">
                        <button class="btn btn-success col-md-12">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="container p-4">
    <div class="row">
        <div class="col-md-4">
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
                    <form action="../doctChangePassword" method="post">
                        <div class="mb-3">
                            <label>Enter New Password</label> <input type="text" name="newPassword" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Enter Old Password</label> <input type="text" name="oldPassword" class="form-control" required>
                        </div>
                        <input type="hidden" value="${doctObj.id}" name="uid">
                        <button class="btn btn-success col-md-12">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5 offset-md-2">
        <div class="card paint-card">
            <div class="container-fluid">
                <h2 class="text-dark text-center">Edit Profile</h2>
            </div>
            <c:if test="${not empty succMsgd }">
                <div class="success-message">${succMsgd}</div>
                <c:remove var = "succMsgd" scope="session"/>
            </c:if>

            <c:if test="${not empty errorMsgd }">
                <div class="error-message">${errorMsgd}</div>
                <c:remove var = "errorMsgd" scope="session"/>
            </c:if>
            <div class="paint-card">
                <form action="../doctorUpdateProfile" method="post">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label> <input type="text" required name="fullname" class="form-control" value="${doctObj.fullName}">

                    </div>

                    <div class="mb-3">
                        <label class="form-label">DOB</label> <input type="date" required name="dob" class="form-control" value="${doctObj.dob}">

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Qualification</label> <input type="text" required name="qualification" class="form-control" value="${doctObj.qualification}">

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Specialist</label>
                        <select name="spec" required class="form-control">
                            <option>${doctObj.specialist}</option>

                            <% SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
                                List<Specialist> list= dao.getAllSpecialist();
                                for (Specialist s: list) {%>
                            <option><%= s.getSpecialistName() %></option>
                            <%}
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label> <input type="email" name="email" readonly class="form-control" value="${doctObj.email}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mob No</label> <input type="text" required name="mobno" class="form-control" value="${doctObj.mobNo}">
                    </div>

                    <input type="hidden" name="id" value="${doctObj.id}">



                    <button type="submit" class="btn btn-primary">Update Changes</button>

                </form>


            </div>
        </div>

    </div>--%>

</body>
</html>
