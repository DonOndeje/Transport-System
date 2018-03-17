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
    String id=request.getParameter("id");
    String did=request.getParameter("did");
    String vid=request.getParameter("vid");
    
    Connection conn = null;
    String jdbcUrl = "jdbc:postgresql://localhost:5432/Transport";
    String username = "postgres";
    String password = "1234";
    
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
    
     int i = st.executeUpdate("DELETE FROM users WHERE user_id ="+id);
     int j = st.executeUpdate("DELETE FROM driver WHERE driver_id ="+did);
     int k = st.executeUpdate("DELETE FROM vehicle WHERE vehicle_id ="+vid);
     
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
