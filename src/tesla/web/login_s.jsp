<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : login
    Created on : 6 Nov, 2016, 12:28:08 PM
    Author     : Jatin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/tesla"
                           user="root"  password="123456789"/>

        <sql:query dataSource="${conn}" var="result">
            SELECT * FROM user WHERE email=? AND password=?;
            <sql:param value="${param.email}" />
            <sql:param value="${param.password}" />
        </sql:query>

        <c:if test="${result.rowCount == 0}">
            <script>
                alert("Invalid Credentials, Retry !!");
                window.location.href = "login.jsp";
            </script>

        </c:if>

        <c:forEach var="row" items="${result.rows}">
            <!-- Storing data in session variables -->
            <c:set var="g_username" scope="session" value="${row.username}"/>
            <c:set var="g_privilege" scope="session" value="${row.privilege}"/>
            <!-- Holding data in bean -->
            <jsp:useBean id="activeUser" scope="session" class="com.tesla.beans.ActiveUser" />
            <jsp:setProperty name="activeUser" property="username" value="${row.username}" />
            <jsp:setProperty name="activeUser" property="privilege" value="${row.privilege}" />
        </c:forEach>  
            
        

        <c:choose>
            <c:when test="${ sessionScope.g_privilege == 'admin'}">
                <script>
                    alert("Welcome Admin !!");
                    window.location.href = "a_dashboard.jsp";
                </script>
            </c:when>
            <c:when test="${ sessionScope.g_privilege == 'student'}">
                <script>
                    alert("Welcome ${sessionScope.g_username} !!");
                    window.location.href = "s_dashboard.jsp";
                </script>
            </c:when>
                <c:when test="${ sessionScope.g_privilege == 'teacher'}">
                <script>
                    alert("Welcome ${sessionScope.g_username} !!");
                    window.location.href = "t_dashboard.jsp";
                </script>
            </c:when>
        </c:choose>

    </body>
</html>
