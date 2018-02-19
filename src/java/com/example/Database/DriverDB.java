/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Database;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jqhn
 */
public class DriverDB extends Database {

    public void deleteDriver(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, SQLException {
        this.connect();
        this.createStatement("UPDATE driver SET deleted="+ 1 + " where driver_id=" + id);

        try {
            // execute delete SQL stetement
            stmt.executeUpdate();

            String text = "Driver successfully deleted";

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(200);
            response.getWriter().write(text);

        } catch (SQLException e) {
            String text = "Failed to delete driver at the moment: " + e.getMessage();

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(403);
            response.getWriter().write(text);

        } finally {

            if (stmt != null) {
                stmt.close();
            }

            if (conn != null) {
                conn.close();
            }

        }

    }

    public void changeAvailability(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {

        String text = "The action you are trying to access is not available";

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(403);
        response.getWriter().write(text);
    }

}
