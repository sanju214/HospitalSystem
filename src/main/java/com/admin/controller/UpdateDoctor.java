package com.admin.controller;

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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            String fullname = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String Specialist = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");
            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullname, dob, qualification, Specialist, email, mobno, password);

            DoctorDao dao = new DoctorDao(DbConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Doctor details updated successfully!");
                resp.sendRedirect("admin/view_doctor.jsp");
            }else {
                session.setAttribute("errorMsg", "Error occured.");
                resp.sendRedirect("admin/view_doctor.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
