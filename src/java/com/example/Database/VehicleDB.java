package com.example.Database;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jqhn
 */
public class VehicleDB extends Database {

    public void addVehicle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String vehicleType = request.getParameter("vehicleType");
        String numberPlate = request.getParameter("numberPlate").toUpperCase();
        String capacity = request.getParameter("capacity");

        this.connect();
        this.createStatement("INSERT INTO vehicle (vehicle_type,number_plate,capacity) VALUES('" + vehicleType + "','" + numberPlate +"','"+ capacity +"')");

        try {
            // execute delete SQL stetement
            int i = stmt.executeUpdate();
            String text = null; 
            if(i>0){
                response.setStatus(200);
                text = "Vehicle added successfully";
            }else {
                response.setStatus(403);
                text = "Failed to add vehicle at the moment";
            }
            

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(text);

        } catch (SQLException e) {
            
            String text = "Failed to delete vehicle at the moment: ";
            System.out.println(e.getMessage());

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(403);
            response.getWriter().write(text);

        } finally {

            if (stmt != null) {
                //stmt.close();
            }

            if (conn != null) {
                //conn.close();
            }

        }
    }

    public void deleteVehicle(HttpServletRequest request, HttpServletResponse response, String id) throws SQLException, IOException {
        this.connect();
        this.createStatement("UPDATE vehicle SET deleted=" + 1 + " where vehicle_id=" + id);

        try {
            // execute delete SQL stetement
            stmt.executeUpdate();

            String text = "Vehicle successfully deleted";

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(200);
            response.getWriter().write(text);

        } catch (SQLException e) {
            String text = "Failed to delete vehicle at the moment: " + e.getMessage();

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(403);
            response.getWriter().write(text);

        } finally {

            if (stmt != null) {
                //stmt.close();
            }

            if (conn != null) {
                //conn.close();
            }

        }
    }

    public void changeAvailability(HttpServletRequest request, HttpServletResponse response, String id) {

    }

}
