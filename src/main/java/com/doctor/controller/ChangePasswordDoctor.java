package com.doctor.controller;

import com.dao.DoctorDao;
import com.db.DbConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctChangePassword")
public class ChangePasswordDoctor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        DoctorDao dao = new DoctorDao(DbConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.checkOldPassword(uid, oldPassword)) {
            if (dao.changePassword(uid, newPassword)) {
                session.setAttribute("succMsg", "Password changed successfully");
                resp.sendRedirect("doctor/edit_profile.jsp");
            } else {
                session.setAttribute("errorMsg", "Error on server");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        } else {
            session.setAttribute("errorMsg", "Old Password incorrect");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
    }
}
