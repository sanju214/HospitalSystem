<%--
  Created by IntelliJ IDEA.
  User: nimit
  Date: 15/04/24
  Time: 4:42 pm
  To change this template use File | Settings | File Templates.
--%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache") ;
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="com.model.Doctor" %>
<%@page import="java.util.List" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="javax.print.Doc" %>
<%@ page import="com.db.DbConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Appointment</title>
    <%@include file="component/allcss.jsp"%>
    <style>

        .paint-card {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .paint-card:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

<div class="container p-3">
    <div class="row">
        <div class="col-md-6 p-5">
            <img src="img/doctor.jpeg" style="width: 400px" alt="doctor">
        </div>

        <div class="col-md-6">
            <div class="paint-card card">
                <div class="card-body">
                    <p class="text-center fs-3">User Appointment</p>
                    <c:if test="${not empty succMsg }">
                        <div class="success-message">${succMsg}</div>
                        <c:remove var = "succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errorMsg }">
                        <div class="error-message">${errorMsg}</div>
                        <c:remove var = "errorMsg" scope="session"/>
                    </c:if>

                    <form class="row g-3" action="addAppointment" method="post">
                        <input type="hidden" name="userid" value="${not empty userObj ? userObj.id : ''}">
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label><input required type="text" class="form-control" name="fullname">
                        </div>


                        <div class="col-md-6">
                            <label class="form-label">Gender</label> <select required class="form-control" name="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Age</label> <input required type="number" class="form-control" name="age">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Appointment Date</label> <input required type="date" class="form-control" name="appoint_date">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Email</label> <input required type="email" class="form-control" name="email">
                        </div>


                        <div class="col-md-6">
                            <label class="form-label">Phone Number</label> <input required maxlength="10" type="number" class="form-control" name="phno">
                        </div>


                        <div class="col-md-6">
                            <label class="form-label">Diseases</label> <input required type="text" class="form-control" name="diseases">
                        </div>


                        <div class="col-md-6">
                            <label class="form-label">Doctor</label> <select required class="form-control" name="doct">
                            <option value=""> --select-- </option>

                            <% DoctorDao dao = new DoctorDao(DbConnect.getConn());
                            List<Doctor> list = dao.getAllDoctors();
                            for (Doctor d: list) {
                                %>
                                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                <%

                            }
                            %>

                        </select>
                        </div>

                        <div class="col-md-12">
                            <label>Full Address</label>
                            <textarea required name="address" class="form-control" rows="3" cols=""></textarea>
                        </div>

                        <c:if test = "${empty userObj}">
                            <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                        </c:if>
                        <c:if test = "${ not empty userObj}">
                            <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
