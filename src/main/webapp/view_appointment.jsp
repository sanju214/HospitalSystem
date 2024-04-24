<%@ page import="com.model.Appointment" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.model.Doctor" %>
<%@ page import="com.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Appointment List</title>
    <%@include file="component/allcss.jsp"%>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

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


        .paint-card {
            background-color: #fff;
        }

        .table th, .table td {
            border-top: none;
        }

        .table th {
            border-bottom: 2px solid #dee2e6;
            vertical-align: middle;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

    </style>
</head>
<body>

<%@include file="component/navbar.jsp" %>

<c:if test="${empty userObj}" >
    <:c:redirect url="user_login.jsp"></:c:redirect>
</c:if>

<div class="container-fluid">
    <h2 class="text-dark text-center p-3">Appointment List</h2>
</div>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-9">
            <div class="card paint-card">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Appointment Date</th>
                            <th>Diseases</th>
                            <th>Doctor Name</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            User user = (User) session.getAttribute("userObj");
                            AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
                            DoctorDao dao2 = new DoctorDao(DbConnect.getConn());

                            List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                            for (Appointment ap: list)
                            {
                                Doctor d = dao2.getDoctorById(ap.getDoctorId());
                        %>
                        <tr>
                            <td><%= ap.getFullName() %></td>
                            <td><%= ap.getGender() %></td>
                            <td><%= ap.getAge() %></td>
                            <td><%= ap.getAppoinDate() %></td>
                            <td><%= ap.getDiseases() %></td>
                            <td><%= d.getFullName() %></td>
                            <td>
                                <%
                                    if ("Pending".equals(ap.getStatus()) ) {
                                %>
                                <span class="text-warning">Pending</span>
                                <%
                                } else {
                                %>
                                <%= ap.getStatus() %>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <img src="img/doctor.jpeg" alt="Doctor Image" class="img-fluid">
        </div>

    </div>
</div>

</body>
</html>
