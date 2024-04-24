package com;

import com.LoginFacade;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private LoginFacade loginFacade;

    @Override
    public void init() throws ServletException {
        super.init();
        loginFacade = new LoginFacade();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginType = request.getParameter("loginType");

        if ("admin".equals(loginType)) {
            loginFacade.adminLogin(request, response);
        } else if ("user".equals(loginType)) {
            loginFacade.userLogin(request, response);
        } else if ("doctor".equals(loginType)) {
            loginFacade.doctorLogin(request, response);
        } else {
            // Handle invalid login type
        }
    }
}
