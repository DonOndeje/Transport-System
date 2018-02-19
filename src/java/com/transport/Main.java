
package com.transport;

import com.example.Database.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.example.Database.UserDB;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;


public class Main extends HttpServlet {

    UserDB user = new UserDB();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          User users = new User(); 
        String email = request.getParameter("email");  // Obtain email parameter from the index.jsp file
        String password = request.getParameter("password"); // Obtain password parameter from the index.jsp file
        String source = request.getParameter("source");  // this is a hidden field used to determine the source of the request either registration or login
        int result = 0;
        users.setEmail(email);
        users.setPassword(password);
        if (source.equals("register")) {
           
            // the registration page for other users is handle here.
            String contact = request.getParameter("contact");  // Obtain contact parameter from the registration.jsp file
            String username = request.getParameter("username"); // Obtain contact username from the registration.jsp file
             users.setUsername(username);
             
             users.setContact(contact);
             users.setPassword(password);
              HttpSession session = request.getSession();// Create a session object if it is already not created.
            session.setAttribute("user", users); //Saves email string in the session object
            session.setMaxInactiveInterval(1800);
             String url = "/index.jsp";
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher(url); //returns a RequestDispatcher object for the specified url. 
            dispatch.forward(request, response); // forwards the response and request object to another resource on the server.
            
            try {
                result = register(users);  // we pass the parameters to the UserDb.java file for user regestration
            } catch (SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            try {
                // this handles requests form the login.jsp file
                result = user.login(users); //returns 1 if there is a sucessful password match.
            } catch (SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (result == 1) { // on sucessful login 
           // response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
           // response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
          //  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            //response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
            users.setEmail(email);
            HttpSession session = request.getSession();// Create a session object if it is already not created.
            session.setAttribute("admin", users); //Saves email string in the session object
            session.setMaxInactiveInterval(10); // sets the session to last for 1800 seconds afterwrds login is required.
            Cookie cookie = new Cookie("admin", users.getEmail());
            cookie.setPath("/"); //allows access to the entire application.
            cookie.setMaxAge(1800);

            // we forward the request and response to the jsp page.
            response.addCookie(cookie); // add the cookie to the response 
            String url = "/adminpage.jsp";
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher(url);
            dispatch.forward(request, response);
           
        } else {
            String url = "/index.jsp";
            String message = "Either user name or password is wrong.";
            RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
            request.setAttribute("message", message);
            dis.include(request, response);
        }

    }

    public int register(User users) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException {
        int result;
        result = user.register(users);
        return result;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
