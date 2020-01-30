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
        <div id="wrapper">
            <%@include file="t_navigation.jsp" %>

            <div id="page-wrapper" class="gray-bg">
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-10">
                        <h2>Subjects</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a href="t_dashboard.jsp">Home</a>
                            </li>
                            <li class="active">
                                <strong>Subjects</strong>
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="row wrapper border-bottom white-bg" >
                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                       url="jdbc:mysql://localhost/tesla"
                                       user="root"  password="123456789"/>

                    <sql:query dataSource="${snapshot}" var="initialres">
                        SELECT teacher_id FROM tesla.teacher where teacher_id = 
                        (SELECT teacher_id FROM tesla.teacher where email = (SELECT email FROM tesla.user where username = '${activeUser.username}') );
                    </sql:query>

                    <sql:query dataSource="${snapshot}" var="result">
                        SELECT * FROM `tesla`.`batchsub` where teacher_id = '${initialres.rows[0].teacher_id}' ;
                    </sql:query>
                    <c:set var="noOfSub" scope="session" value="${result.rowCount}" />

                    <c:if test="${sessionScope.noOfSub >0 }">

                        <div class="row wrapper white-bg" >
                            <br><br>       <br><br>
                        </div>

                        <!-- display -->
                        <div class="col-md-8 col-md-offset-2">
                            <h3 style="font-family: serif;">
                                You are currently teaching :
                            </h3><hr>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Subject Code</th>
                                        <th>Subject Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <sql:query dataSource="${snapshot}" var="res">
                                        SELECT subject_code, subject_name FROM tesla.subject where subject_id IN
                                        (SELECT subject_id FROM tesla.batchsub where teacher_id= ?); 
                                        <sql:param value="${initialres.rows[0].teacher_id}" />
                                    </sql:query>
                                    <c:forEach var="row" items="${res.rows}">
                                        <tr> 
                                            <td>
                                                ${row.subject_code}
                                            </td>
                                            <td>
                                                ${row.subject_name}

                                            </td>
                                        </tr>     
                                    </c:forEach>

                                </tbody>
                            </table> 


                        </div>
                    </c:if>
                    <br><br>

                    <c:if test="${sessionScope.noOfSub <2 }">

                        <div class="row wrapper white-bg" >
                            <br><br>                
                        </div>
                        <div class="col-md-8 col-md-offset-2">
                            <form class="form-horizontal" action="t_subjects_s.jsp" method="POST" >

                                <input type="hidden" name="teacher_id" id="teacher_id" value="${initialres.rows[0].teacher_id}" />
                                <!-- this batch id is wrong 
 
                                <input type="hidden" name="batch_id"  id="batch_id" value="$/{result.rows[0].batch_id}" />
                                -->
                                <div class="form-group">
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label" for="exampleSelect1">Choose Subject to teach</label>
                                    <div class="col-sm-6">
                                        <select class="form-control" id="chosenSubjectId" name="chosenSubjectId">


                                            <option value="default">-- Choose subject -- </option>
                                            <sql:query dataSource="${snapshot}" var="gotresult">
                                                SELECT subject_id, subject_code ,subject_name  FROM tesla.subject where subject_id  IN 
                                                ( SELECT subject_id FROM tesla.batchsub where teacher_id is null OR teacher_id = 0) ; 
                                            </sql:query>

                                            <!-- Displaying all available subject for the teacher -->
                                            <c:forEach var="row" items="${gotresult.rows}">
                                                <option value='${row.subject_id}' > ${row.subject_code} : ${row.subject_name}  </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>
                                <div  class="form-group"><label class="col-sm-2 control-label"></label>
                                    <div class="col-lg-12 text-center ">
                                        <button type="submit" class="btn btn-primary btn-md" id="proceed" name="proceed" value="proceed"> Proceed </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </c:if>    




                </div>


            </div>
        </div>

    </body>
</html>
