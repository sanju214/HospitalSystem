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

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            String fullname = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String Specialist = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullname, dob, qualification, Specialist, email, mobno, "");

            DoctorDao dao = new DoctorDao(DbConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.editDoctorProfile(d)) {
                Doctor updateDoctor=dao.getDoctorById(id);
                session.setAttribute("succMsgd", "Doctor details updated successfully!");
                session.setAttribute("doctObj", updateDoctor);
                resp.sendRedirect("doctor/edit_profile.jsp");
            }else {
                session.setAttribute("errorMsgd", "Error occured.");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
