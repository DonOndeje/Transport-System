<%-- 
    Document   : addVehicles
    Created on : Feb 19, 2018, 4:48:32 PM
    Author     : jqhn
--%>
<%@page import="com.transport.Main"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.Database.Database" %>

<%
    String vehicleType = request.getParameter("vehicle_type");
    String numberPlate = request.getParameter("number_plate").toUpperCase();
    String capacity = request.getParameter("capacity");
    
    Connection conn = null;
    String jdbcUrl = "jdbc:postgresql://localhost:5432/Transport";
    String username = "postgres";
    String password = "gemini";
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
    
    Statement st = conn.createStatement();
    
     int i = st.executeUpdate("INSERT INTO vehicle (vehicle_type,number_plate,capacity) VALUES('" +
             
             vehicleType + "','" + numberPlate +"','"+ capacity +"')");
     
      if(i>0){
//          String url = "/adminpage.jsp";
//          String message = "You have succefully added a drive";
//          request.setAttribute("message", message);
//          RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
//          dis.forward(request, response);
            response.sendRedirect("adminpage.jsp");
          
          
      } else {
//          String url = "/adminpage.jsp";
//          String message = "FAILED PLEASE TRY AGAIN";
//          request.setAttribute("message", message);
//          RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
//          dis.forward(request, response);
          response.sendRedirect("adminpage.jsp");
      }
    

%>