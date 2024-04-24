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
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn {
            border-radius: 5px;
        }

        .card-body {
            padding: 40px;
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

        <div class="col-md-5 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Add Doctor</p>

                    <c:if test="${not empty succMsg }">
                        <div class="success-message">${succMsg}</div>
                        <c:remove var = "succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errorMsg }">
                        <div class="error-message">${errorMsg}</div>
                        <c:remove var = "errorMsg" scope="session"/>
                    </c:if>
                    <form action="../addDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label> <input type="text" required name="fullname" class="form-control">

                        </div>

                        <div class="mb-3">
                            <label class="form-label">DOB</label> <input type="date" required name="dob" class="form-control">

                        </div>

                        <div class="mb-3">
                            <label class="form-label">Qualification</label> <input type="text" required name="qualification" class="form-control">

                        </div>

                        <div class="mb-3">
                            <label class="form-label">Specialist</label> <select name="spec" required class="form-control">
                            <option>--select--</option>

                            <% SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
                                List<Specialist> list= dao.getAllSpecialist();
                                for (Specialist s: list) {%>
                                    <option><%= s.getSpecialistName() %></option>
                                <%}
                            %>


                        </select>

                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label> <input type="email" required name="email" class="form-control">

                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mob No</label> <input type="text" required name="mobno" class="form-control">

                        </div>

                        <div class="mb-3">
                            <label class="form-label">password</label> <input type="password" required name="password" class="form-control">

                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>

                    </form>


                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>
