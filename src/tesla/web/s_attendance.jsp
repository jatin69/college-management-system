<%-- 
    Document   : dashboard
    Created on : 6 Nov, 2016, 4:59:22 PM
    Author     : Jatin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="global_include.jsp" %>

<html>
    <head>

        <!-- Checking for invalid access -->
        <c:if test="${empty activeUser.username}" >
            <script> alert("Please Login to Continue !!");
                window.location.href = "login.jsp";
            </script> 
        </c:if>
        <c:if test="${activeUser.privilege != 'student'}" >
            <script> alert("Invalid Access !! ");
                alert("Please Login Again to Continue !!");
                window.location.href = "login.jsp";
            </script>
        </c:if>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance</title>
        <%@include file="resource_include.jsp" %>

        <script type="text/javascript" language="javascript" src="js/jquery-2.1.1.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="s_navigation.jsp" %>

            <div id="page-wrapper" class="gray-bg">
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-10">
                        <h2>Attendance</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a href="s_dashboard.jsp">Home</a>
                            </li>
                            <li class="active">
                                <strong>Attendance</strong>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="row wrapper white-bg" >
                    <br><br>                
                </div>

                <div class="row wrapper border-bottom white-bg" >

                </div>
            </div>
        </div>

    </body>

</html>
