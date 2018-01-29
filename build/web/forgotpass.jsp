<%-- 
    Document   : forgotpass
    Created on : Jan 25, 2018, 10:11:04 AM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
   %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trip Management</title>
        <link rel="stylesheet" href="materialize/css/materialize.css">
        <script language="javascript" type="text/javascript" src="materialize/js/materialize.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/material.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/materiali.js"></script>
    </head>
    <body style="background-color: whitesmoke">
   
        <div style="background:url(images/logo.gif);padding:60px; background-size: cover;"></div>
        <div style="font-family: fantasy; font-size: 35px; text-align: center; background-color: rgb(76, 175, 80);">TRIP MANAGEMENT SYSTEM</div>
        <br>
        <div>
            <main>
                <center>
                    <div class="container">
                        <h5 class="green-text">Forgot Password? Submit Your Email</h5>
                        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                            <form class="col s12" method="post" action="">
                                <div class='row'>
                                    <div class='col s12'></div>
                                </div>
                                
                                    <div class='input-field col s12'>
                                <input class='validate' type='email' name='email' id='email' />
                                <label for='email'>Enter your email</label>
                              </div>
                                <center>
                                    <div class='row'>
                                        <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect green'>SUBMIT</button>
                                    </div>
                                </center>
                            </form>
                        </div>
                    </div>
                </center>
            </main>
        </div>
    </body>
</html>
