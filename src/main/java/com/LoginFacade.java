package com;

import com.admin.controller.AdminLogin;
import com.doctor.controller.DoctorLogin;
import com.user.controller.UserLogin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFacade {
    private AdminLogin adminLogin;
    private UserLogin userLogin;
    private DoctorLogin doctorLogin;

    public LoginFacade() {
        this.adminLogin = new AdminLogin();
        this.userLogin = new UserLogin();
        this.doctorLogin = new DoctorLogin();
    }

    public void adminLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        adminLogin.doPost(req, resp);
    }

    public void userLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userLogin.doPost(req, resp);
    }

    public void doctorLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doctorLogin.doPost(req, resp);
    }
}
