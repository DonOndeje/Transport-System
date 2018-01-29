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
        <div style="background:url(images/logo.gif);padding:60px; background-size: cover;"></div>
        <div style="font-family: fantasy; font-size: 35px; text-align: center; background-color: rgb(76, 175, 80);">TRIP MANAGEMENT SYSTEM</div>
        <div>
            <main>
                <center>
                    <h5 class="green-text">Fill In This Form To Register To The Trip Management System</h5>
                    <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                        <script type="text/javascript">
                            function validator(form){
                                if(form.username.value==""){
                                    alert("Please Enter Your Username");
                                    form.username.focus();
                                }
                                else if(form.email.value==""){
                                    alert("Please Enter Your Email");
                                    form.email.focus();
                                }
                                else if(form.contact.value==""){
                                    alert("Please Enter Your Contact");
                                    form.contact.focus();
                                }
                                else if(form.password.value==""){
                                    alert("Please Enter Your Password");
                                    form.password.focus();
                                }
                                else if(form.confirmPassword.value==""){
                                    alert("Please Confirm Your Password");
                                    form.confirmPassword.focus();
                                }
                                else{
                                    form.submit();
                                }
                            }               
                        </script>
                        <form class="col s12" method="post" action="Main">
                            
                              <div class='col s12'></div>
                            
                              <div class='input-field col s12'>
                                <input class='validate' type='text' name='username' id='username' />
                                <label for='email'>Enter your username</label>
                              </div>
                            
                            <input type="hidden" name="source" value="register">
                            
                              <div class='input-field col s12'>
                                <input class='validate' type='email' name='email' id='email' />
                                <label for='email'>Enter your email</label>
                              </div>
                            
                            
                              <div class='input-field col s12'>
                                <input class='validate' type='text' name='contact' id='contact' />
                                <label for='email'>Enter your contact</label>
                              </div>
                            
                              <div class='input-field col s12'>
                                <input class='validate' type='password' name='password' id='password' />
                                <label for='password'>Enter your password</label>
                              </div>
                            
                            
                              <div class='input-field col s12'>
                                <input class='validate' type='password' name='confirmPassword' id='password' />
                                <label for='password'>Confirm your password</label>
                              </div>
                                
                            
                            <center>
                              <div class='row'>
                                  <button style='float: right' type='submit' name='btn_login' class='col s12 btn btn-large waves-effect green' onclick='validator(this.form)'>Register</button>
                                  <br><br>
                                  
                                  <div> <a class='pink-text' href='index.jsp'><b>Already Have Account?, Login</b></a> </div>
                            </center>
                        </form>
                    </div>
                    </div>
                </center>
            </main>
        </div>
    </body>
</html>
