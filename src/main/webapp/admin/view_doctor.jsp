<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Specialist" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.model.Doctor" %>
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


        .card-body {
            color: #666;
            font-size: 1.2rem;
            line-height: 1.5;
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

<div class="container-fluid p-3">
    <div class="row">


        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Doctor Details</p>
                    <c:if test="${not empty succMsg }">
                        <div class="success-message">${succMsg}</div>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errorMsg }">
                        <div class="error-message">${errorMsg}</div>
                        <c:remove var="errorMsg" scope="session"/>
                    </c:if>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">DOB</th>
                            <th scope="col">Qualification</th>
                            <th scope="col">Specialist</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone No.</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
                            List<Doctor> list2 = dao2.getAllDoctors();
                            for (Doctor d: list2)
                            {%>
                        <tr>
                            <td><%= d.getFullName() %></td>
                            <td><%= d.getDob() %></td>
                            <td><%= d.getQualification() %></td>
                            <td><%= d.getSpecialist() %></td>
                            <td><%= d.getEmail() %></td>
                            <td><%= d.getMobNo() %></td>

                            <td>
                                <a href="edit_doctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                                <a href="../deleteDoctor?id=<%= d.getId() %>" class="btn btn-sm btn-danger">Delete</a>

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

