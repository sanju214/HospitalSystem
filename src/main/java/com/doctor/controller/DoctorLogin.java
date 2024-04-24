package com.doctor.controller;

import com.dao.DoctorDao;

import com.db.DbConnect;
import com.model.Doctor;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();

            DoctorDao dao = new DoctorDao(DbConnect.getConn());
            Doctor doctor = dao.login(email, password);
            if (doctor!=null) {
                session.setAttribute("doctObj", doctor);
                resp.sendRedirect("doctor/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                resp.sendRedirect("doctor_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
