package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect { //Singleton design pattern
    private static Connection conn = null;

    private DbConnect() {
        // private constructor to prevent instantiation
    }

    public static synchronized Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Nimit2210!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
