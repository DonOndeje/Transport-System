/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.transport;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.example.Database.UserDB;
import java.sql.SQLException;
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
        
        if(source.equals("register")){
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
        
        
        if (result == 1){
             response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {
            out.print("registration was sucessful");
       }
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
    
    public int register(String username, String password, String contact, String email) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException{
        int result;
        result = user.register(username, password, contact, email);
        return result;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
