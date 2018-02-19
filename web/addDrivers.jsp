<%-- 
    Document   : addDrivers
    Created on : Feb 19, 2018, 6:58:57 AM
    Author     : Norris
--%>

<%@page import="com.transport.Main"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.Database.Database" %>

<%
    String driver_name = request.getParameter("driver_name");
    String email = request.getParameter("email").toUpperCase();
    String contact = request.getParameter("contact");
    
    Connection conn = null;
    String jdbcUrl = "jdbc:postgresql://localhost:5432/Transport";
    String username = "postgres";
    String password = "254scorpio";
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
    
     int i = st.executeUpdate("INSERT INTO driver (driver_name,email,contact) VALUES('" +
             
             driver_name + "','" + email +"','"+ contact +"')");
     
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
