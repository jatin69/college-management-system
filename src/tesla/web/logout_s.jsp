<%-- 
    Document   : logout
    Created on : 6 Nov, 2016, 7:06:37 PM
    Author     : Jatin
--%>


<%@include file="global_include.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
My name is : $/{sessionScope.g_username}
<br>
-->

<c:remove var="g_username" />
<c:remove var="g_privilege" />

<% 
    session.invalidate();
%>


<!--
My name is : $/{sessionScope.g_username}
-->

<script>
        alert("You have been Successfully Logged out !!");
        window.location.href = "login.jsp";
</script>   


<!-- just testing 
</% response.sendRedirect("home.jsp"); %>
-->
