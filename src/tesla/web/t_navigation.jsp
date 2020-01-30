<%-- 
    Document   : navigation
    Created on : 6 Nov, 2016, 4:53:26 PM
    Author     : Jatin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="global_include.jsp" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                        <img alt="<jsp:getProperty name="activeUser" property="username" /> " class="img-circle" src="img/<jsp:getProperty name="activeUser" property="username" />_profile_small.jpg" />
                    </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"> 
                                    <jsp:useBean id="activeUser" scope="session" class="com.tesla.beans.ActiveUser" />
                                    <jsp:getProperty name="activeUser" property="username" />
                                </strong>
                            </span> <span class="text-muted text-xs block"> 
                                <jsp:getProperty name="activeUser" property="privilege" /> 
                                <b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="t_profile.jsp">Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="logout_s.jsp">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    TESLA
                </div>
            </li>
            <li>
                <a href="t_dashboard.jsp">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">Dashboard</span>
                </a>
            </li>


            <li>
                <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">UPLOAD</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse in">
                    <li><a href="t_u_attendance.jsp">ATTENDANCE</a></li>
                    <li><a href="t_u_result.jsp">RESULT</a></li>
                </ul>
            </li>

            <li>
                <a href="t_syllabus.jsp">
                    <i class="fa fa-table"></i> 
                    <span class="nav-label">Syllabus</span>
                </a>
            </li>
            <li>
                <a href="t_notices.jsp">
                    <i class="fa fa-globe"></i>
                    <span class="nav-label">Notices</span></a>
            </li>
            <li class="special_link">
                <a href=t_subjects.jsp>
                    <i class="fa fa-database"></i> 
                    <span class="nav-label">SUBJECTS</span>
                </a>
            </li>

        </ul>

    </div>
</nav>
