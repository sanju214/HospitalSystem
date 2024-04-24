<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="com.model.Doctor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor</title>
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

        .paint-card {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            text-align: center; /* Center align text */
        }

        .paint-card:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            color: #333;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .card-body {
            color: #666;
            font-size: 1.2rem;
            line-height: 1.5;
        }

    </style>
</head>
<body>
<c:if test="${ empty doctObj}">
    <c:redirect url="../doctor_login.jsp">Redirecting...</c:redirect>
</c:if>

<%@ include file="navbar.jsp"%>

<p class="text-center fs-3">Doctor Dashboard</p>

<%
    Doctor d = (Doctor)session.getAttribute("doctObj");
    DoctorDao dao = new DoctorDao(DbConnect.getConn());
%>

<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-2">
            <div class="card paint-card">
                <div class="card-body text-center text-dark">
                    <i class="fas fa-user-md fa-3x text-center"></i><br>
                    <p class="fs-4 text-center">
                        Doctor<br>
                        <span class="fs-2"><%= dao.countDoctor() %></span>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-dark">
                    <i class="fas fa-calendar-check fa-3x text-center"></i><br>
                    <p class="fs-4 text-center">
                        Total Appointments<br>
                        <span class="fs-2"><%= dao.countAppointmentByDoctorId(d.getId()) %></span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
