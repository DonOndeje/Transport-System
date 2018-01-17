/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Database;

import com.transport.Main;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JQHN
 */
public class Database {
    String jdbcUrl = "jdbc:postgresql://localhost:5432/Transport";
    String username = "postgres";
    String password = "jumbotron@94";

    protected Connection conn = null;
    protected PreparedStatement  stmt = null;
    protected ResultSet rs = null;

    public void connect() {
        try {
            // Step 2 - Open connection
            Class.forName("org.postgresql.Driver");

            try {
                // Step 2 - Open connection
                if (conn == null) {
                    conn = DriverManager.getConnection(jdbcUrl, username, password);
                }
                System.out.println("Connection created");

            } catch (SQLException e) {
                System.out.println("Failed to create a connection");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createStatement(String sql) throws SQLException {
        if (conn == null) {
            this.connect();
            stmt = this.conn.prepareStatement(sql);
        } else {
            stmt = conn.prepareStatement(sql);
        }
    }

    public void closeConnection() {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Failed to close connection");
        }
    }
}
