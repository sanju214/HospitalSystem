package com.user.controller;

import com.dao.UserDao;
import com.db.DbConnect;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();

            UserDao dao = new UserDao(DbConnect.getConn());
            User user = dao.login(email, password);
            if (user!=null) {
                session.setAttribute("userObj", user);
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                resp.sendRedirect("user_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
