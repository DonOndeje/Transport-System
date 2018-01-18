<%-- 
    Document   : adminpage
    Created on : Jan 17, 2018, 6:17:59 PM
    Author     : Josh Murunga
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
         
    String userName = (String) session.getAttribute("admin");
    if (null == userName) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        String url = "/index.jsp";
            RequestDispatcher dis = getServletContext().getRequestDispatcher(url);
             
            out.println("<font color=red>Either user name or password is wrong.</font>");
            dis.include(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link rel="stylesheet" href="materialize/css/materialize.css">
        <script language="javascript" type="text/javascript" src="materialize/js/materialize.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/material.js"></script>
        <script language="javascript" type="text/javascript" src="materialize/js/materiali.js"></script>
    </head>
    <body style="background-color: whitesmoke">

        <%
            // this will allow the user to have acess only if the session exits.
            String admin = (String) session.getAttribute("admin"); // each jsp page has its own  default session 
            if (session.getAttribute("admin") == null || admin.equals("admin")) {
                response.sendRedirect("index.jsp");
            }
       
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                }
            }
            session.removeAttribute("admin");
            session.invalidate();
        %>
        <ul id="slide-out" class="side-nav fixed z-depth-2" >
            <li class="center no-padding">
                <div class="indigo darken-2 white-text" style="height: 180px;">
                    <div class="row">
                        <img style="margin-top: 5%;" width="100" height="100" src="" class="circle responsive-img" />
                        <div></div>
                        <p style="margin-top: -13%;">
                            The Administrator
                        </p>
                    </div>
                </div>
            </li>

            <li id="dash_dashboard"><a class="waves-effect" href="adminpage.jsp"><b>Dashboard</b></a></li>

            <ul class="collapsible" data-collapsible="accordion">
                <li id="dash_users">
                    <div id="dash_users_header" class="collapsible-header waves-effect"><b>Users</b></div>
                    <div id="dash_users_body" class="collapsible-body">
                        <ul>
                            <li id="users_seller">
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Add Users</a>
                            </li>

                            <li id="users_customer">
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Remove Users</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li id="dash_products">
                    <div id="dash_products_header" class="collapsible-header waves-effect"><b>Drivers</b></div>
                    <div id="dash_products_body" class="collapsible-body">
                        <ul>
                            <li id="products_product">
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Add Drivers</a>
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Remove Drivers</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li id="dash_categories">
                    <div id="dash_categories_header" class="collapsible-header waves-effect"><b>Vehicles</b></div>
                    <div id="dash_categories_body" class="collapsible-body">
                        <ul>
                            <li id="categories_category">
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Add Vehicles</a>
                            </li>

                            <li id="categories_sub_category">
                                <a class="waves-effect" style="text-decoration: none;" href="#!">Remove Vehicle</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </ul>

        <header>
            <ul class="dropdown-content" id="user_dropdown">
                <li><a class="indigo-text" href="#!">Profile</a></li>
                <li><a class="indigo-text" href="#!">Logout</a></li>
            </ul>

            <nav class="indigo" role="navigation">
                <div class="nav-wrapper">
                    <a data-activates="slide-out" class="button-collapse show-on-" href="#!"><img style="margin-top: 17px; margin-left: 5px;" src="" /></a>

                    <ul class="right hide-on-med-and-down">
                        <li>
                            <a class='right dropdown-button' href='' data-activates='user_dropdown'><i class=' material-icons'>account_circle</i></a>
                        </li>
                    </ul>

                    <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                </div>
            </nav>

            <nav>
                <div class="nav-wrapper indigo darken-2">
                    <a style="margin-left: 20px;" class="breadcrumb" href="#!">Admin</a>
                    <a class="breadcrumb" href="#!">Index</a>

                    <div style="margin-right: 20px;" id="timestamp" class="right"></div>
                </div>
            </nav>
        </header>

        <main>
            <div class="row">
                <div class="col s6">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>User Management</b>
                            </div>
                        </div>

                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">person</i>
                                    <span class="indigo-text text-lighten-1"><h5>Seller</h5></span>
                                </div>
                            </a>
                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>

                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">people</i>
                                    <span class="indigo-text text-lighten-1"><h5>Customer</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col s6">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>Product Management</b>
                            </div>
                        </div>
                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">store</i>
                                    <span class="indigo-text text-lighten-1"><h5>Product</h5></span>
                                </div>
                            </a>

                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>

                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">assignment</i>
                                    <span class="indigo-text text-lighten-1"><h5>Orders</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>Brand Management</b>
                            </div>
                        </div>

                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">local_offer</i>
                                    <span class="indigo-text text-lighten-1"><h5>Brand</h5></span>
                                </div>
                            </a>

                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>

                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">loyalty</i>
                                    <span class="indigo-text text-lighten-1"><h5>Sub Brand</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col s6">
                    <div style="padding: 35px;" align="center" class="card">
                        <div class="row">
                            <div class="left card-title">
                                <b>Category Management</b>
                            </div>
                        </div>
                        <div class="row">
                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">view_list</i>
                                    <span class="indigo-text text-lighten-1"><h5>Category</h5></span>
                                </div>
                            </a>
                            <div class="col s1">&nbsp;</div>
                            <div class="col s1">&nbsp;</div>

                            <a href="#!">
                                <div style="padding: 30px;" class="grey lighten-3 col s5 waves-effect">
                                    <i class="indigo-text text-lighten-1 large material-icons">view_list</i>
                                    <span class="truncate indigo-text text-lighten-1"><h5>Sub Category</h5></span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 24px;">
                <a class="btn-floating btn-large pink waves-effect waves-light">
                    <i class="large material-icons">add</i>
                </a>

                <ul>
                    <li>
                        <a class="btn-floating red"><i class="material-icons">note_add</i></a>
                        <a href="" class="btn-floating fab-tip">Add a note</a>
                    </li>

                    <li>
                        <a class="btn-floating yellow darken-1"><i class="material-icons">add_a_photo</i></a>
                        <a href="" class="btn-floating fab-tip">Add a photo</a>
                    </li>

                    <li>
                        <a class="btn-floating green"><i class="material-icons">alarm_add</i></a>
                        <a href="" class="btn-floating fab-tip">Add an alarm</a>
                    </li>

                    <li>
                        <a class="btn-floating blue"><i class="material-icons">vpn_key</i></a>
                        <a href="" class="btn-floating fab-tip">Add a master password</a>
                    </li>
                </ul>
            </div>
        </main>

        <footer class="indigo page-footer">
            <div class="container">
                <div class="row">
                    <div class="col s12">
                        <h5 class="white-text">Icon Credits</h5>
                        <ul id='credits'>
                            <li>
                                Gif Logo made using <a href="" title="Form Type Maker">Form Type Maker</a> from <a href="" title="romannurik">romannurik</a>
                            </li>
                            <li>
                                Icons made by <a href="">Google</a>, available under <a href="" target="_blank">Apache License Version 2.0</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    <span>Made By <a style='font-weight: bold;' href="" target="_blank">Tirth Patel</a></span>
                </div>
            </div>
        </footer>
    </body>
</html>
