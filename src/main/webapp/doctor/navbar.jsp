<%--
  Created by IntelliJ IDEA.
  User: nimit
  Date: 15/04/24
  Time: 10:44 am
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i>Doctor Home</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="index.jsp">Home</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="patient.jsp">Appointments</a></li>

            </ul>

            <div class="dropdown">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user-circle"></i>${doctObj.fullName}
                </a>

                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
                    <li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>

                </ul>
            </div>
        </div>
    </div>
</nav>

<style>
    .nav-item {
        margin-right: 5px;
    }
    * {
        font-family: 'Source Sans Pro', sans-serif;
    }
    i {
        margin-right: 10px;
    }
    .nav-item a.nav-link.active:hover {
        color: #17a2b8; /* Change this to the color you prefer */
    }


</style>
