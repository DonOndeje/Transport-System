/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Database;

import com.transport.Authentication;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;

/**
 *
 * @author JQHN
 */
public class UserDB extends Database{
    
    Authentication authen = new Authentication();
    
    public void login (String email, String password)
    {
        
    }  
    
    public int register (String username, String password, String contact, String email) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException{
        String hashedPass = authen.hash(password);
        
        String sql = "INSERT INTO users (user_name, password, user_type, email, contact) VALUES(?, ?, ?, ?,?)";
        this.createStatement(sql);
        stmt.setString(1, username); 
        stmt.setString(2,hashedPass);
        stmt.setInt(3,0);
        stmt.setString(4,email);
        stmt.setString(5,contact);
        
         int i = stmt.executeUpdate();
         
        return i;
    }
}
