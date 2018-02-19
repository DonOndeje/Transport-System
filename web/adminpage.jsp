

<%@page import="java.util.Enumeration"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html>
<jsp:include page="./includes/header.jsp" />
<jsp:useBean id="users" class="com.example.Database.User" scope="request" />
<jsp:setProperty property="*" name="users"/>

<%
    // The session object is a built-in JSP object hence on need to create it when working with JSPs.
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("admin")) {

                System.out.println(cookie.getValue());
                if (session.getAttribute("admin") == null) {
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }
    System.out.println(session.getId());
    System.out.println(session.getAttribute("admin"));
    //
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

    <ul class="collapsible" data-collapsible="accordion">
        <li id="dash_users">
            <div id="dash_users_header" class="collapsible-header waves-effect"><i class="small material-icons">people</i><b>Users</b></div>
            <div id="dash_users_body" class="collapsible-body">
                <ul>
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
        <li><a class="green-text" href="index.jsp"> Logout</a></li>
    </ul>

    <nav class="green darken-2" role="navigation">
        <div class="nav-wrapper">
            <ul class="right hide-on-med-and-down">


                <li><a class='right dropdown-button' href='' data-activates='user_dropdown'><jsp:getProperty name ="users" property="email" /><i class=' material-icons right'>account_circle</i></a></li>
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
                            <sql:setDataSource var = "drivers" driver = "org.postgresql.Driver"
                                               url = "jdbc:postgresql://localhost:5432/Transport"
                                               user = "postgres"  password = "254scorpio"/>
                            <sql:query  dataSource = "${drivers}" var = "dresult">
                                SELECT * from driver;
                            </sql:query>
                            <span class="green-text text-lighten-1"><h5>Total Available Drivers: &nbsp;${dresult.rowCount}</h5></span>
                        </div>
                    </a>

                    <div class="col s1">&nbsp;</div>

                    <a href="#modal6" class="modal-trigger">
                        <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                            <i class="green-text text-lighten-1 large material-icons">airport_shuttle</i>
                            <sql:setDataSource var = "vehicle" driver = "org.postgresql.Driver"
                                               url = "jdbc:postgresql://localhost:5432/Transport"
                                               user = "postgres"  password = "254scorpio"/>
                            <sql:query  dataSource = "${vehicle}" var = "vresult">
                                SELECT * from vehicle;
                            </sql:query>
                            <span class="green-text text-lighten-1"><h5>Total Available Vehicles: &nbsp;${vresult.rowCount}</h5></span>
                        </div>
                    </a>

                    <div class="col s1">&nbsp;</div>

                    <a href="#modal2" class="modal-trigger">
                        <div style="padding: 30px;" class="grey lighten-3 col s3 waves-effect">
                            <i class="green-text text-lighten-1 large material-icons">people</i>
                            <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver"
                                               url = "jdbc:postgresql://localhost:5432/Transport"
                                               user = "postgres"  password = "254scorpio"/>
                            <sql:query  dataSource = "${snapshot}" var = "result">
                                SELECT * from users;
                            </sql:query>

                            <span class="green-text text-lighten-1"><h5>Total Registered Users: &nbsp;${result.rowCount}</h5></span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div id="modal2" class="modal modal-fixed-footer" style="position: absolute; left: 200px; top: 100px; width: 70%">
        <div class="modal-content">
            <h4>Users Available In The System</h4>
            <table class="striped">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <td><c:out value = "${row.user_name}"/></td>
                            <td><c:out value = "${row.email}"/></td>
                            <td><c:out value = "${row.contact}"/></td>
                            <td><button>delete</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">close</a>
        </div>
    </div>
    <div id="modal3" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h4>Fill In This Form To Add A New Driver</h4>
            <div class="row">
                <form class="col s12" action="addDrivers.jsp" method="post" name="addDrivers" id="addDrivers">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="driver_name" name ="driver_name"type="text" class="validate">
                            <label for='driver_name'>Driver Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="email" type="text" name ="email"class="validate">
                            <label for='email'>Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="contact" type="text" name = "contact"class="validate">
                            <label for='contact'>Contact</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
           <button type='submit' form='addDrivers' class="modal-action waves-effect waves-green btn-flat green">Add Driver</button>
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">close</a>
        </div>
    </div>
    <div id="modal4" class="modal modal-fixed-footer" style="position: absolute; left: 200px; top: 100px; width: 70%">
        <div class="modal-content">
            <h4>Drivers Available In The System</h4>
            <table class="striped">
                <thead>
                    <tr>
                        <th>Driver Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Availability</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var = "row" items = "${dresult.rows}">
                        <tr>
                            <td><c:out value = "${row.driver_name}"/></td>
                            <td><c:out value = "${row.email}"/></td>
                            <td><c:out value = "${row.contact}"/></td>
                            <td><c:out value = "${row.availability}"/></td>
                            <td><button>Change Availability</button></td>
                            <td><button>delete</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">close</a>
        </div>
    </div>
    <div id="modal5" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h4>Fill In This Form To Add A New Vehicle</h4>
            <div class="row">
                <form class="col s12" name="addVehicle" id="addVehicle" method="post" action="addVehicles.jsp">
                    <div class="row">
                        <div class="input-field col s12">
                            <select name="vehicle_type">
                                <option value="" disabled selected>Choose Vehicle Type</option>
                                <option value="Bus">Bus</option>
                                <option value="Mini-Bus">Mini-Bus</option>
                                <option value="Van">Van</option>
                                <option value="Double-Cabin">Double-Cabin</option>
                            </select>
                            <label for='vehicle_type'>Vehicle Type</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input name="number_plate" id="number_plate" type="text" class="validate">
                            <label for='number_plate'>Number Plate</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input name="capacity" id="capacity" type="text" class="validate">
                            <label for='capacity'>Capacity</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type='submit' form='addVehicle' class="modal-action modal-close waves-effect waves-green btn-flat green">Add Vehicle</button>
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">close</a>
        </div>
    </div>
    <div id="modal6" class="modal modal-fixed-footer" style="position: absolute; left: 200px; top: 100px; width: 70%">
        <div class="modal-content">
            <h4>Vehicles Available In The System</h4>
            <table class="striped">
                <thead>
                    <tr>
                        <th>Vehicle Type</th>
                        <th>Number Plate</th>
                        <th>Capacity</th>
                        <th>Availability</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var = "row" items = "${vresult.rows}">
                        <tr>
                            <td><c:out value = "${row.vehicle_type}"/></td>
                            <td><c:out value = "${row.number_plate}"/></td>
                            <td><c:out value = "${row.capacity}"/></td>
                            <td><c:out value = "${row.availability}"/></td>
                            <td><button>Change Availability</button></td>
                            <td><button>delete</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat green">close</a>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.modal-trigger').leanModal();
            $('select').material_select();
        });
    </script>
</main>
                  
<jsp:include page="./includes/footer.jsp" />
