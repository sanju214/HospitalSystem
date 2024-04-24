<%@ page import="javax.xml.stream.events.Comment" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="com.model.Appointment" %>
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

<div class="container-fluid backImg p-5">
    <p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3">
    <div class="row">



        <div class="col-md-6 offset-md-3">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-4">Patient Comment</p>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDao dao = new AppointmentDao(DbConnect.getConn());

                        Appointment ap = dao.getAppointmentBYId(id);
                    %>

                    <form class="row" action="../updateStatus" method="post">
                        <div class="col-md-6">
                            <label>Patient Name</label> <input type="text" readonly value="<%= ap.getFullName() %>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label>Age</label> <input type="text" readonly value="<%= ap.getAge() %>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label>Mob No</label> <input type="text" readonly value="<%= ap.getPhNo() %>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label>Diseases</label> <input type="text" readonly value="<%= ap.getDiseases() %>" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <br> <label>Comment</label>
                            <textarea required name="comm" class="form-control" rows="3" cols=""></textarea>
                        </div>
                        <input type="hidden" name="id" value="<%= ap.getId() %>">
                        <input type="hidden" name="did" value="<%= ap.getDoctorId() %>">

                        <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
