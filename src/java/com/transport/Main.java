/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transport;

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

/**
 *
 * @author JQHN
 */
public class Main extends HttpServlet {

    UserDB user = new UserDB();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String source = request.getParameter("source");
        int result = 0;

        if (source.equals("register")) {
            String contact = request.getParameter("contact");
            String username = request.getParameter("username");

            try {
                result = register(username, password, contact, email);
            } catch (SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            try {
                result = user.login(email, password);
            } catch (SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (result == 1) {
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
            HttpSession session = request.getSession();// Create a session object if it is already not created.
            session.setAttribute("admin", email); //Saves username string in the session object
            session.setMaxInactiveInterval(20);
            Cookie cookie = new Cookie("user", email);
            cookie.setMaxAge(20);

            response.addCookie(cookie);
            response.sendRedirect("adminpage.jsp");
           
        } else {
            String url = "/index.jsp";
            RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Either user name or password is wrong.</font>");
            dis.include(request, response);
        }
//        Authentication authen = new Authentication();
//        String hashedPass = null;
//        try {
//            hashedPass = authen.hash(password);
//        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
//            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        String test = "1000:41a4be983bbd87de067c1ca6b8867e3c:18094eac13314139fc49486f898dab8ee207b18dbd9313ef6267296e71bca635f05014bf84fd7b338dd581349df894f3272509c06ac23ffa8b77c103b2cdecb8";
//        String result = "No match";
//        try {
//            if(authen.validatePassword(password, test)){
//                result = "matched";
//            }
//        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
//            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        response.setContentType("text/html");
//
//        try (PrintWriter out = response.getWriter()) {
//            out.print(email + hashedPass + "\n" + result + "\n" + source);
//        }
    }

    public int register(String username, String password, String contact, String email) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException {
        int result;
        result = user.register(username, password, contact, email);
        return result;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
