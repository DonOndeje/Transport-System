<%-- 
    Document   : index
    Created on : Oct 11, 2017, 9:50:46 AM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
       //  response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
        //   response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
       ///   response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
       // response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
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
                        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                            <form class="col s12" method="post" action="Main">
                                <div class='row'>
                                    <div class='col s12'></div>
                                </div>
                                <div class='row'>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='email' name='email' id='email' />
                                        <label for='email'>Enter your email</label>
                                    </div>

                                </div>
                                <input type="hidden" name="source" value= "login">
                                <div class='row'>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='password' name='password' id='password' />
                                        <label for='password'>Enter your password</label>
                                    </div>
                                    <label style='float: right;'>
                                        <a class='pink-text' href='forgotpass.jsp'><b>Forgot Password?</b></a>
                                    </label>
                                </div><br />
                                <center>
                                    <div class='row'>
                                        <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect green'>Login</button>
                                    </div>
                                </center>
                            </form>
                        </div>
                    </div>
                    <a href="registration.jsp">Create account</a>
                </center>
            </main>
        </div>
    </body>
</html>
