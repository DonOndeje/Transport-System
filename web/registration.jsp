<%-- 
    Document   : registration
    Created on : Jan 17, 2018, 4:39:03 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
       //String userName = (String) session.getAttribute("admin");
     
     %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="materialize/css/materialize.css">
        <script language="javascript" type="text/javascript" src="materialize/js/materialize.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/material.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/materiali.js"></script>
    </head>
    <body style="background-color: whitesmoke">
        <div>
            <main>
                <center>
                    <h5 class="indigo-text">Registration</h5>
                    <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                        <form class="col s12" method="post" action="Main">
                            <div class='row'>
                              <div class='col s12'></div>
                            </div>
                            <div class='row'>
                              <div class='input-field col s12'>
                                <input class='validate' type='text' name='username' id='username' />
                                <label for='email'>Enter your username</label>
                              </div>
                            </div>
                            <input type="hidden" name="source" value="register">
                            <div class='row'>
                              <div class='input-field col s12'>
                                <input class='validate' type='email' name='email' id='email' />
                                <label for='email'>Enter your email</label>
                              </div>
                            </div>
                            <div class='row'>
                              <div class='input-field col s12'>
                                <input class='validate' type='text' name='contact' id='contact' />
                                <label for='email'>Enter your contact</label>
                              </div>
                            </div>
                            <div class='row'>
                              <div class='input-field col s12'>
                                <input class='validate' type='password' name='password' id='password' />
                                <label for='password'>Enter your password</label>
                              </div>
                            </div>
                            <div class='row'>
                              <div class='input-field col s12'>
                                <input class='validate' type='password' name='confirmPassword' id='password' />
                                <label for='password'>Confirm your password</label>
                              </div>
                                <label style='float: right;'>
                                    <a class='white-text' ><b>Forgot Password?</b></a>
                                            </label>
                            </div>
                            <center>
                              <div class='row'>
                                  <button style="float: right" type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Register</button>
                                  <br><br><label style='float: right;'>
                                                <a class='pink-text' href='index.jsp'><b>Already Have Account?, Login</b></a>
                                            </label>
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
