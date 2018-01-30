<%-- 
    Document   : adminpage
    Created on : Jan 17, 2018, 6:17:59 PM
    Author     : Josh Murunga
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
    
    String userName = (String) session.getAttribute("admin");
    if (null == userName) {
        out.append("session has ended..");
        String url = "/index.jsp";
        RequestDispatcher dis = getServletContext().getRequestDispatcher(url);

       
        dis.include(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration</title>
        <link rel="stylesheet" href="materialize/css/materialize1.css">
        <script language="javascript" type="text/javascript" src="materialize/js/materialize.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/material.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/materiali.js"></script>
        <link rel="stylesheet" href="materialize/css/materialicons.css">
    </head>
    <body style="background-color: whitesmoke;">

        <%
            // this will allow the user to have acess only if the session exits.
            Enumeration names = session.getAttributeNames();
            String temp= (String)names.nextElement();
            String admin = (String) session.getAttribute("admin"); // each jsp page has its own  default session 
           String username = (String)session.getAttribute("admin");
            
          
          
           
            
        %>
        
        <ul id="slide-out" class="side-nav fixed z-depth-2" style="background-color: whitesmoke">
            <li class="center no-padding">
                <div class="green darken-2 white-text" style="height: 175px;">
                    <div class="row">
                        <img style="margin-top: 5%;" width="100" height="100" src="images/egertonlogo.jpg" class="circle" /><br><br>
                        <p style="margin-top: -13%;">Administration</p>
                    </div>
                </div>
            </li>
            
            <li id="dash_dashboard"><a class="waves-effect" href="<%response.encodeURL("adminpage.jsp");  %>"><i class="small material-icons">dashboard</i><b>Dashboard</b></a></li>
            
            <ul class="collapsible" data-collapsible="accordion">
                <li id="dash_users">
                    <div id="dash_users_header" class="collapsible-header waves-effect"><i class="small material-icons">people</i><b>Users</b></div>
                    <div id="dash_users_body" class="collapsible-body">
                        <ul>
                            <li id="add_user">
                                <a class="waves-effect modal-trigger" href="#modal1" style="text-decoration: none;">
                                    <i class="small material-icons">person_add</i>Add User
                                </a>
                            </li>
                            <li id="remove_user">
                                <a class="waves-effect modal-trigger" href="#modal2" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Remove User
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="dash_driver">
                    <div id="dash_driver_header" class="collapsible-header waves-effect"><i class="small material-icons">people</i><b>Drivers</b></div>
                    <div id="dash_driver_body" class="collapsible-body">
                        <ul>
                            <li id="add_driver">
                                <a class="waves-effect modal-trigger" href="#modal3" style="text-decoration: none;">
                                    <i class="small material-icons">person_add</i>Add Driver
                                </a>
                            </li>
                            <li id="remove_driver">
                                <a class="waves-effect modal-trigger" href="#modal4" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Remove Driver
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="dash_vehicle">
                    <div id="dash_vehicle_header" class="collapsible-header waves-effect"><i class="small material-icons">airport_shuttle</i><b>Vehicles</b></div>
                    <div id="dash_vehicle_body" class="collapsible-body">
                        <ul>
                            <li id="add_vehicle">
                                <a class="waves-effect modal-trigger" href="#modal5" style="text-decoration: none;">
                                    <i class="small material-icons">add</i>Add Vehicles
                                </a>
                            </li>
                            <li id="remove_vehicle">
                                <a class="waves-effect modal-trigger" href="#modal6" style="text-decoration: none;">
                                    <i class="small material-icons">remove</i>Remove Vehicles
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
                <li><a class="green-text" href="" onclick="<%
                                      if (session.getAttribute("admin") == null || !temp.equals("admin")) {
                                            response.sendRedirect("index.jsp");
                                            session.invalidate();
                                       } 
                                     Cookie[] cookies = request.getCookies();
                                            if (cookies != null) {
                                    for (Cookie cookie : cookies) {
                                  if (cookie.getName().equals("user")) {
                                userName = cookie.getValue();
                        }
                }
            }
                                            session.invalidate();
                       %>"> Logout</a></li>
            </ul>
            
            <nav class="green darken-2" role="navigation">
                <div class="nav-wrapper">
                    <ul class="right hide-on-med-and-down">
                        
                        <li><%
                        out.append(username);
                        
                          
                        %><a class='right dropdown-button' href='' data-activates='user_dropdown'><i class=' material-icons'>account_circle</i></a></li>
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
                                <b>System Information</b>
                            </div>
                        </div>
                        
                        <div class="row">
                            <a href="#modal4" class="modal-trigger">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">people</i>
                                    <span class="green-text text-lighten-1"><h5>Total Available Drivers</h5></span>
                                </div>
                            </a>
                            
                            <div class="col s1">&nbsp;</div>
                            
                            <a href="#modal6" class="modal-trigger">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">airport_shuttle</i>
                                    <span class="green-text text-lighten-1"><h5>Total Available Vehicles</h5></span>
                                </div>
                            </a>
                            
                            <div class="col s1">&nbsp;</div>
                            
                            <a href="#modal2" class="modal-trigger">
                                <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                                    <i class="green-text text-lighten-1 large material-icons">people</i>
                                    <span class="green-text text-lighten-1"><h5>Total Registered Users</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h4>Modal Header</h4>
                    <p>This is modal1</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">Agree</a>
                </div>
            </div>
            <div id="modal2" class="modal" >
                <div class="modal-content">
                    <h4>Test Table</h4>
                    <p>This is modal2</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">Agree</a>
                </div>
            </div>
            <div id="modal3" class="modal">
                <div class="modal-content">
                    <h4>Fill In This Form To Add A New Driver</h4>
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="driver_name" type="text" class="validate">
                                    <label for='driver_name'>Driver Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="email" type="text" class="validate">
                                    <label for='email'>Email</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="contact" type="text" class="validate">
                                    <label for='contact'>Contact</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">submit</a>
                </div>
            </div>
            <div id="modal4" class="modal">
                <div class="modal-content">
                    <h4>Modal Header</h4>
                    <p>This is modal4</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">Agree</a>
                </div>
            </div>
            <div id="modal5" class="modal">
                <div class="modal-content">
                    <h4>Fill In This Form To Add A New Vehicle</h4>
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="vehicle_type" type="text" class="validate">
                                    <label for='vehicle_type'>Vehicle Type</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="number_plate" type="text" class="validate">
                                    <label for='number_plate'>Number Plate</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="capacity" type="text" class="validate">
                                    <label for='capacity'>Capacity</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">Submit</a>
                </div>
            </div>
            <div id="modal6" class="modal">
                <div class="modal-content">
                    <h4>Modal Header</h4>
                    <p>This is modal6</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">Agree</a>
                </div>
            </div>
            
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.modal-trigger').leanModal();
                });
            </script>
        </main>
    </body>
</html>