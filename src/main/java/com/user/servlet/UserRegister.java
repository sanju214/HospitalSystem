package com.user.servlet;

import com.dao.UserDao;
import com.db.DbConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User u = new User(fullName, email, password);

            HttpSession session = req.getSession();

            UserDao dao = new UserDao(DbConnect.getConn());
            boolean f = dao.UserRegister(u);

            if (f) {
                session.setAttribute("sucMsg", "Registered Successfully");
                resp.sendRedirect("signup.jsp");
                System.out.println("Register successful.");
            } else {
                session.setAttribute("errorMsg", "Registration failed");
                resp.sendRedirect("signup.jsp");
                System.out.println("That didn't work.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
