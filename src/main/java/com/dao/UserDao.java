package com.dao;

import com.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean UserRegister(User u) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user_dtls(full_name, email, password) VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User login(String email, String password) {
        User u = null;
        try {
            String sql = "SELECT * FROM user_dtls WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

/*
            while(rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
*/

            while (rs.next()) {
                u = new User.UserBuilder()
                        .fullName(rs.getString("full_name"))
                        .email(rs.getString("email"))
                        .password(rs.getString("password"))
                        .build();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }



    public boolean checkOldPassword(int userid, String oldPassword) {
        boolean f = false;

        try {
            String sql = "SELECT * FROM user_dtls WHERE id=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean changePassword(int userid, String newPassword) {
        boolean f = false;

        try {
            String sql = "UPDATE user_dtls SET password=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
