<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="com.model.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Doctor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../component/allcss.jsp"%>
    <style type="text/css">
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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

<div class="container p-3">
    <div class="row">

        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <div class="container-fluid">
                        <h2 class="text-dark">Patient List</h2>
                    </div>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center error-message">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <p class="fs-4 text-center success-message">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Age</th>
                            <th scope="col">Appointment Date</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mob No</th>
                            <th scope="col">Diseases</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            Doctor d = (Doctor) session.getAttribute("doctObj");
                            AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
                            List<Appointment> list =  dao.getAllAppointmentByDoctorLogin(d.getId());
                            for (Appointment ap : list)
                            {%>
                                <tr>
                                    <th><%= ap.getFullName() %></th>
                                    <td><%= ap.getGender() %></td>
                                    <td><%= ap.getAge() %></td>
                                    <td><%= ap.getAppoinDate() %></td>
                                    <td><%= ap.getEmail() %></td>
                                    <td><%= ap.getPhNo() %></td>
                                    <td><%= ap.getDiseases() %></td>
                                    <td><%= ap.getStatus() %></td>
                                    <td>

                                        <%
                                            if ("Pending".equals(ap.getStatus()))
                                            {%>
                                                <a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-sm btn-success">Comment</a>
                                            <%}else {%>
                                                <a href="#" class="btn btn-sm btn-success disabled">Comment</a>
                                            <%}
                                        %>

                                    </td>
                                </tr>
                            <%}
                        %>


                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
</div>


</body>
</html>
