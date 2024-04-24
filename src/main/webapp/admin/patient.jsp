<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="com.model.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.model.Doctor" %><%--
  Created by IntelliJ IDEA.
  User: sanja
  Date: 21/04/2024
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@include file="../component/allcss.jsp" %>
    <style>
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

        .card-icon {
            color: #000; /* Set icon color to black */
            font-size: 3rem;
            margin-bottom: 10px; /* Adjust margin */
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

<%@ include file="navbar.jsp" %>

<div class="col-md-12">
    <div class="card paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Patient Details</p>
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
                    <th scope="col">Doctor Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>

                <%
                    AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
                    DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
                    List<Appointment> list = dao.getAllAppointment();

                    for (Appointment ap : list)
                    {
                Doctor d = dao2.getDoctorById(ap.getDoctorId());
                %>
                        <tr>
                            <th><%= ap.getFullName() %></th>
                            <td><%= ap.getGender() %></td>
                            <td><%= ap.getAge() %></td>
                            <td><%= ap.getAppoinDate() %></td>
                            <td><%= ap.getEmail() %></td>
                            <td><%= ap.getPhNo() %></td>
                            <td><%= ap.getDiseases() %></td>
                            <td><%= d.getFullName() %></td>
                            <td><%= ap.getAddress() %></td>
                            <td><%= ap.getStatus() %></td>
                        </tr>
                    <%}
                %>


                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
