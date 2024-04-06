<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i>Admin Home</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="home.jsp"><i class="fa-solid fa-right-to-bracket"></i>Administrator Login</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="doctor.jsp">Doctor Login</a></li>

                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="patient.jsp">User Login</a></li>
            </ul>

            <form class="d-flex">
                <div class="dropdown">
                    <button class = "btn btn-light dropdown-toggle" type="button"
                           id="dropdownMenuButton1" data-bs-toggle="dropdown"
                           aria-expanded="false">Admin</button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
                    </ul>
                </div>
            </form>
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
    .dropdown {
        top: 100%; /* Position the dropdown below the button */
        margin-top: 8px; /* Adjust this value to vertically center the dropdown */
    }
</style>