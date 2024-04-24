<%@ page import="com.dao.DoctorDao" %>
<%@ page import="javax.print.Doc" %>
<%@ page import="com.db.DbConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
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

<c:if test="${ empty adminObj}">
    <c:redirect url="../admin_login.jsp">Redirecting...</c:redirect>
</c:if>

<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>
    <c:if test="${not empty sucMsg }">
        <div class="success-message">${sucMsg}</div>
        <c:remove var="sucMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty errorMsg }">
        <div class="error-message">${errorMsg}</div>
        <c:remove var="errorMsg" scope="session"/>
    </c:if>

    <% DoctorDao dao = new DoctorDao(DbConnect.getConn()); %>

        <div
        class="row">
        <div class="col-md-4">
            <div class="card paint-card">
                <i class="fas fa-user-md card-icon"></i>
                <p class="card-title text-center">Doctors</p>
                <p class="card-body text-center">Total: <%=dao.countDoctor()%></p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card paint-card">
                <i class="fas fa-user-circle card-icon"></i>
                <p class="card-title text-center">Users</p>
                <p class="card-body text-center">Total:  <%=dao.countUser()%></p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card paint-card">
                <i class="far fa-calendar-check card-icon"></i>
                <p class="card-title text-center">Total Appointments</p>
                <p class="card-body text-center">Total:  <%=dao.countAppointment()%></p>
            </div>
        </div>

        <div class="col-md-4 mt-2">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class="far fa-calendar-check card-icon"></i>
                <p class="card-title text-center">Specialists</p>
                <p class="card-body text-center">Total:  <%=dao.countSpecialist()%></p>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">

                    <div class="form-group">
                        <label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control">
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
