<%-- 
    Document   : tester
    Created on : Feb 16, 2018, 8:31:21 AM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String vehicletype = request.getParameter("vehicle_type");
            String numberplate = request.getParameter("number_plate");
            String capacity = request.getParameter("capacity");
        %>
        
        <br>
        <p><%= vehicletype %></p>
        <p><%= numberplate %></p>
        <p><%= capacity %></p>
        
        <br><br>
        
        <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver"
         url = "jdbc:postgresql://localhost:5432/Transport"
         user = "postgres"  password = "254scorpio"/>

         <sql:query  dataSource = "${snapshot}" var = "result">
            SELECT * from users;
         </sql:query>
            
            ${result.rowCount}
 
      
    </body>
</html>
