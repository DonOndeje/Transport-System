<%-- 
    Document   : fleethome
    Created on : Jan 28, 2018, 4:31:15 PM
    Author     : Josh Murunga
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fleet Assistant</title>
        <link rel="stylesheet" href="materialize/css/materialize1.css">
        <script language="javascript" type="text/javascript" src="materialize/js/materialize.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/material.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/materiali.js"></script>
        <link rel="stylesheet" href="materialize/css/materialicons.css">
    </head>
    <body style="background-color: whitesmoke;">

        
        
        <ul id="slide-out" class="side-nav fixed z-depth-2" style="background-color: whitesmoke">
            <li class="center no-padding">
                <div class="green darken-2 white-text" style="height: 175px;">
                    <div class="row">
                        <img style="margin-top: 5%;" width="100" height="100" src="images/egertonlogo.jpg" class="circle" /><br><br>
                        <p style="margin-top: -13%;">Fleet Assistant</p>
                    </div>
                </div>
            </li>
            
            <li id="dash_dashboard"><a class="waves-effect" href="fleethome.jsp"><i class="small material-icons">dashboard</i><b>Dashboard</b></a></li>
            
            <ul class="collapsible" data-collapsible="accordion">
                
            </ul> 
        </ul>
        
        <header>
            <ul class="dropdown-content" id="user_dropdown">
                <li><a class="green-text" href="#!">Profile</a></li>
                <li><a class="green-text" href="index.jsp">Logout</a></li>
            </ul>
            
            <nav class="green darken-2" role="navigation">
                <div class="nav-wrapper">
                    <ul class="right hide-on-med-and-down">
                        <li><a class='right dropdown-button' href='' data-activates='user_dropdown'><i class=' material-icons'>account_circle</i></a></li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <main>
            <div class="row">
                <div class="col s12">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>Booking Information</b>
                            </div>
                        </div>
                        
                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">person</i>
                                    <span class="green-text text-lighten-1"><h5>Total Booking Requests</h5></span>
                                </div>
                            </a>
                            
                            <div class="col s1">&nbsp;</div>
                            
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">person</i>
                                    <span class="green-text text-lighten-1"><h5>Total Postpone Requests</h5></span>
                                </div>
                            </a>
                            
                            <div class="col s1">&nbsp;</div>
                            
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">book</i>
                                    <span class="green-text text-lighten-1"><h5>Total Confirmed Bookings</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
