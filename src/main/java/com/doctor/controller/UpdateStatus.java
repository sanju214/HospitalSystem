package com.doctor.controller;

import com.dao.AppointmentDao;
import com.db.DbConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            int did = Integer.parseInt(request.getParameter("did"));
            String comm = request.getParameter("comm");

            AppointmentDao dao = new AppointmentDao(DbConnect.getConn());

            HttpSession session = request.getSession();

            if (dao.updateAppointmentStatus(id ,did,comm)) {

                session.setAttribute("succMsg", "Comment Updated Successfully");
                response.sendRedirect("doctor/patient.jsp");

            }else {

                session.setAttribute("errorMsg", "Something wrong on server");
                response.sendRedirect("doctor/patient.jsp");

            }

        }catch (Exception e) {
            e.printStackTrace();
        }

    }

}
