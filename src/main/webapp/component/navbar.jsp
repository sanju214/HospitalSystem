<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i>MEDICO</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${empty userObj }">
                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="admin_login.jsp"><i
                            class="fa-solid fa-right-to-bracket"></i>Administrator Login</a></li>

                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="doctor_login.jsp">Doctor Login</a></li>

                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="user_appointment.jsp">Book an Appointment</a></li>

                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="user_login.jsp">User Login</a></li>
                </c:if>


                <c:if test="${not empty userObj}">
                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="user_appointment.jsp">Book an Appointment</a></li>
                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="view_appointment.jsp">View Appointment</a></li>

                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-circle-user"></i>${userObj.fullName}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </div>

                </c:if>
            </ul>
        </div>
    </div>
</nav>

<style>
    li {
        margin-right: 5px;
    }

    * {
        font-family: 'Source Sans Pro', sans-serif;
    }

    i {
        margin-right: 10px;
    }

    .nav-item a.nav-link.active:hover {
        color: #17a2b8;
    }

</style>