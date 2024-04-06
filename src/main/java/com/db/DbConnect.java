package com.db;

import com.mysql.cj.x.protobuf.MysqlxNotice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Logger;

public class DbConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Nimit2210!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
