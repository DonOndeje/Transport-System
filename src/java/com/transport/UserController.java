package com.transport;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.Database.UserDB;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jqhn
 */
public class UserController extends HttpServlet {
    
    UserDB user = new UserDB();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        if (action.equals("delete")) {
            user.deleteUser(request, response, id);
        } else if (action.equals("changeAvailability")) {
            user.changeAvailability(request, response, id);
        } else {
            String text = "The action you are trying to access is not available";

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(403);
            response.getWriter().write(text);
        }

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
