/*
package com.admin.controller;

import com.model.User;

import javax.controller.ServletException;
import javax.controller.annotation.WebServlet;
import javax.controller.http.HttpServlet;
import javax.controller.http.HttpServletRequest;
import javax.controller.http.HttpServletResponse;
import javax.controller.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                session.setAttribute("adminObj", new User());
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                resp.sendRedirect("admin_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
*/


package com.admin.controller;

import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User admin = new User.UserBuilder()
                        .email(email)
                        .password(password)
                        .build();
                session.setAttribute("adminObj", admin);
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                resp.sendRedirect("admin_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
