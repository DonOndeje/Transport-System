/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Database;

/**
 *
 * @author Norris
 */
import java.io.Serializable;

public class vehicle implements Serializable {
    private String vehicletype;
    private String numberplate;
    private String capacity;
    
    public vehicle(){
        this.vehicletype="";
        this.numberplate="";
        this.capacity="";
    }
    public String getVehicletype(){
        return vehicletype;
    }
    public void setVehicletype(String vehicletype){
        this.vehicletype = vehicletype;
    }
    public String getNumberplate(){
        return numberplate;
    }
    public void setNumberplate(String numberplate){
        this.numberplate = numberplate;
    }
    public String getcapacity(){
        return capacity;
    }
    public void setCapacity(String capacity){
        this.capacity = capacity;
    }
            
            
            }
