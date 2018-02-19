/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Database;

import java.io.Serializable;
/**
 *
 * @author Norris
 */
public class driver implements Serializable{
    private String drivername;
    private String email;
    private String contact;
    
    public driver(){
        this.drivername="";
        this.email="";
        this.contact="";
    }
   
    public String getDrivername(){
        return drivername;
    }
    public void setDrivername(String drivername){
        this.drivername = drivername;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getContact(){
        return contact;
    }
    public void setContact(String contact){
        this.contact = contact;
    }
    
}
