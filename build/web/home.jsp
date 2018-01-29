<%-- 
    Document   : home
    Created on : Jan 28, 2018, 4:30:12 PM
    Author     : Josh Murunga
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
                        <p style="margin-top: -13%;">Home</p>
                    </div>
                </div>
            </li>
            
            <li id="dash_dashboard"><a class="waves-effect" href="home.jsp"><i class="small material-icons">dashboard</i><b>Dashboard</b></a></li>
            
            <ul class="collapsible" data-collapsible="accordion">
                <li id="dash_booking">
                    <div id="dash_booking_header" class="collapsible-header waves-effect"><i class="small material-icons">book</i><b>Booking</b></div>
                    <div id="dash_booking_body" class="collapsible-body">
                        <ul>
                            <li id="book">
                                <a class="waves-effect modal-trigger" href="#modal1" style="text-decoration: none;">
                                    <i class="small material-icons">person_add</i>Book
                                </a>
                            </li>
                            <li id="cancel_booking">
                                <a class="waves-effect modal-trigger" href="#modal2" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Cancel A Booking
                                </a>
                            </li>
                            <li id="postpone_booking">
                                <a class="waves-effect modal-trigger" href="#modal2" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Postpone A Booking
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="dash_your_booking">
                    <div id="dash_your_booking_header" class="collapsible-header waves-effect"><i class="small material-icons">person</i><b>Your Bookings</b></div>
                    <div id="dash_your_booking_body" class="collapsible-body">
                        <ul>
                            <li id="pending">
                                <a class="waves-effect modal-trigger" href="#modal3" style="text-decoration: none;">
                                    <i class="small material-icons">person_add</i>Pending Requests
                                </a>
                            </li>
                            <li id="confirmed">
                                <a class="waves-effect modal-trigger" href="#modal4" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Confirmed Bookings
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
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
                                <b>Your Booking Information</b>
                            </div>
                        </div>
                        
                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">person</i>
                                    <span class="green-text text-lighten-1"><h5>Your Pending Requests</h5></span>
                                </div>
                            </a>
                            
                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>
                            
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">person</i>
                                    <span class="green-text text-lighten-1"><h5>Your Confirmed Bookings</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
        </main>
    </body>
</html>
