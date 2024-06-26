<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i>Admin Home</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="index.jsp">Home</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="doctor.jsp">Add Doctor</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="view_doctor.jsp">View Doctor</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="patient.jsp">Patient</a></li>
            </ul>


            <div class="dropdown">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Admin
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
                </ul>
            </div>
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
        color: #17a2b8; /* Change this to the color you prefer */
    }

</style>