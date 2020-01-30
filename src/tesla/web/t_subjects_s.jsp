<%-- 
    Document   : dashboard
    Created on : 6 Nov, 2016, 4:59:22 PM
    Author     : Jatin
--%>

<%@include file="global_include.jsp" %>
<!-- my name is  : $/{g_username} -->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <!-- Checking for invalid access -->
        <c:if test="${empty activeUser.username}" >
            <script> alert("Please Login to Continue !!");
                window.location.href = "login.jsp";
            </script> 
        </c:if>
        <c:if test="${activeUser.privilege != 'teacher'}" >
            <script> alert("Invalid Access !! ");
                alert("Please Login Again to Continue !!");
                window.location.href = "login.jsp";
            </script>
        </c:if>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subjects</title>
        <%@include file="resource_include.jsp" %>

        <script type="text/javascript" language="javascript" src="js/jquery-2.1.1.js"></script>
    </head>
    <body>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/tesla"
                           user="root"  password="123456789"/>

        <!-- param teacher id is: $/{param.teacher_id}
         <br>
         param chosenSubjectId is : $/{param.chosenSubjectId}
         <br>
        -->
        <sql:query var="getbatch" dataSource="${snapshot}">
            SELECT batch_id FROM tesla.batchsub where teacher_id is null and subject_id = ? ;
            <sql:param value="${param.chosenSubjectId}" />
        </sql:query>

        <!--    param teacher id is: $/{param.teacher_id}
        <br>
        param chosenSubjectId is : $/{param.chosenSubjectId}
        <br>
        got batch id is : $/{getbatch.rows[0].batch_id}
        -->

        <sql:update dataSource="${snapshot}" var="count">
            UPDATE `tesla`.`batchsub` SET `teacher_id`=? WHERE `batch_id`=? and`subject_id`=?;
            <sql:param value="${param.teacher_id}" />
            <sql:param value="${getbatch.rows[0].batch_id}" />
            <sql:param value="${param.chosenSubjectId}" />
        </sql:update>

        <c:choose>
            <c:when test="${count == 1}">
                <!-- success -->
                <script>
                alert("Subject Assigned Successfully !!");
                window.location.href = "t_subjects.jsp";
                </script>         
            </c:when>
            <c:otherwise>
                <!--   failure -->
                <script>
                    alert(" ${count} Oops !! Could not assign Subject !! Retry !!");
                    window.location.href = "t_subjects.jsp";
                </script> 
            </c:otherwise>
        </c:choose>


        <!-- Made database entry of the subjects & redirect to dashboard asap-->

    </body>
</html>
