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
        <title>Upload | Attendance</title>
        <%@include file="resource_include.jsp" %>

        <script type="text/javascript" language="javascript" src="js/jquery-2.1.1.js"></script>

        <script>
                function submittext() {
                    //  alert("hellloooo");
                    ////////////////////////// NOW click thhe submit button of text attendance file  
                    ////////////////////////////// or just submit the formmmm
                    document.getElementById("textattendanceform").submit();// Form submission
                    // alert($/{param.whichsub});
                }
        </script>


    </head>
    <body>
        <div id="wrapper">
            <%@include file="t_navigation.jsp" %>

            <div id="page-wrapper" class="gray-bg">


                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-10">
                        <h2>Upload Attendance</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a href="a_dashboard.jsp">Home</a>
                            </li>
                            <li>
                                <a>Upload</a>
                            </li>
                            <li class="active">
                                <strong>Attendance</strong>
                            </li>
                        </ol>
                    </div>
                </div>

                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                   url="jdbc:mysql://localhost/tesla"
                                   user="root"  password="123456789"/>


                <div class="row wrapper white-bg" >
                    <br><br>                
                </div>

                <sql:query dataSource="${snapshot}" var="initialres">
                    SELECT teacher_id FROM tesla.teacher where teacher_id = 
                    (SELECT teacher_id FROM tesla.teacher where email = (SELECT email FROM tesla.user where username = '${activeUser.username}') );
                </sql:query>

                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * FROM `tesla`.`batchsub` where teacher_id = '${initialres.rows[0].teacher_id}' and attendance_file_id is null  ;
                </sql:query>

                <c:set var="noOfSub" scope="session" value="${result.rowCount}" />

                <!-- IF, un-submitted attendance !=2 , then display this -->
                <c:if test="${sessionScope.noOfSub != 2 }">

                    <div class="row wrapper border-bottom white-bg" >
                        <!-- display table section -->


                        <!-- display -->
                        <div class="col-md-8 col-md-offset-2">
                            <h3 style="font-family: serif;">
                                Already Uploaded for :
                            </h3><hr>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Subject Code</th>
                                        <th>Subject Name</th>
                                        <th>Uploaded file</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <sql:query dataSource="${snapshot}" var="res">
                                        SELECT * FROM tesla.subject where subject_id IN (SELECT subject_id FROM tesla.batchsub where teacher_id= ? and attendance_file_id is not null);
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
                                            <td>
                                                <sql:query dataSource="${snapshot}" var="reso">
                                                    SELECT * FROM tesla.files where file_id IN (SELECT attendance_file_id FROM tesla.batchsub where subject_id= ? and teacher_id= ?);
                                                    <sql:param value="${row.subject_id}" />
                                                    <sql:param value="${initialres.rows[0].teacher_id}" />
                                                </sql:query>
                                                ${reso.rows[0].file_name}



                                            </td>
                                        </tr>     
                                    </c:forEach>

                                </tbody>
                            </table> 
                        </div>
                    </div>
                </c:if>

                <div class="row wrapper white-bg" >
                    <br><br>       
                </div>





                <!-- IF, un-submitted attendance > 0 , then display this option of display -->
                <c:if test="${sessionScope.noOfSub >0 }">

                    <div class="row wrapper border-bottom white-bg" >
                        <!-- display table section -->

                        <!-- display -->
                        <div class="col-md-8 col-md-offset-2">
                            <form class="form-horizontal" action="t_u_attendance.jsp" id="textattendanceform" method="POST" >
                                <h3 style="font-family: serif;">
                                    Upload attendance for :
                                </h3><hr>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Subject Code</th>
                                            <th>Subject Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query dataSource="${snapshot}" var="res">
                                            SELECT * FROM tesla.subject where subject_id IN
                                            (SELECT subject_id FROM tesla.batchsub where teacher_id= ? and attendance_file_id is null ); 
                                            <sql:param value="${initialres.rows[0].teacher_id}" />
                                        </sql:query>
                                        <c:forEach var="row" items="${res.rows}">
                                            <tr> 
                                                <td>
                                                    <label><input type="radio" onclick="submittext()" id="whichsub" name="whichsub" value="${row.subject_id}"  ${param.whichsub==row.subject_id?'checked':''} required ></label>

                                                </td>
                                                <td>
                                                    ${row.subject_code}
                                                </td>
                                                <td>
                                                    ${row.subject_name}

                                                </td>
                                            </tr>     
                                        </c:forEach>
                                    <input type="hidden" name="textsubmitted" value="true" />
                                    <button style="visibility: hidden" type="submit" class="btn btn-primary btn-md" id="uploadtext" name="uploadtext" > </button>


                                    </tbody>
                                </table> 
                            </form> </div>

                        <!-- file upload section -->

                        <div class="col-md-8 col-md-offset-2">
                            <form class="form-horizontal" action="t_u_attendance_s.jsp" id="attendanceform" method="POST" enctype="multipart/form-data" >
                                <!-- teacher hidden field -->
                                <!--   <input type="hidden" name="teacher_id" id="teacher_id" value="$/{initialres.rows[0].teacher_id}" /> -->

                                <!-- file-->
                                <div  class="form-group">
                                    <label class="col-sm-4 control-label">Choose Attendance File (.xls/.csv)</label>
                                    <div class="col-sm-6 custom-file ">
                                        <input type="file"  accept=".xlsx, .csv,text/csv" size="50" id="file_attendance" name="file_attendance" class="custom-file-input" required>
                                    </div>
                                </div> 
                                <br>
                                <div  class="form-group"><label class="col-sm-2 control-label"></label>
                                    <div class="col-lg-12 text-center ">
                                        <button type="submit" onclick="myfunc()" class="btn btn-primary btn-md" id="upload" > Upload </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </c:if>
            </div>

            <div class="row wrapper white-bg" > <br><br><br> </div>
            <hr>

        </div>
        <br><br>             
    </div>

    <!-- make unique id somehow 
    we need to find a way to pass this javascript variable to JSTL code, which can then create unique id's-->

    <script>
        // when text box is selected, make database entry,, this is ERRRORRR
        // find some more suitable way


        function myfunc() {
        <c:if test="${param.textsubmitted}">

            //       var whichsubval=$('[name="whichsub"]:checked').val();
            // <//c:set var="whichsubval" value="$//{request.whichsub} " /> 
            //   alert($/{whichsubval});
            //return false;



            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/tesla"
                               user="root"  password="123456789"/>

            <sql:query var="getbatch" dataSource="${snapshot}">
            SELECT
            batch_id
            FROM
            tesla.batchsub
            where
                    teacher_id = ? and subject_id = ?;
                <sql:param value="${initialres.rows[0].teacher_id}" />
                <sql:param value="${param.whichsub}" />
            </sql:query>
            //    alert($/{getbatch.rows[0].batch_id});
            //    document.write(" my batch is "+$/{getbatch.rows[0].batch_id});
            <c:set var="whichbatch" value="${getbatch.rows[0].batch_id}" />
            <c:set var="customfilename" scope="session" value="attendance_b${whichbatch}_s${param.whichsub}_t${initialres.rows[0].teacher_id}_filename_" />
            <c:set var="filepath" scope="page" value="root" />
            <sql:transaction dataSource="${snapshot}">
                <sql:update var="countaff">
            INSERT
            INTO
                    `tesla`.`files` (`file_name`, `file_path`) VALUES (?, ?);
                    <sql:param value="${customfilename}" />
                    <sql:param value="${filepath}" />
                </sql:update>
                <sql:query var="nextIdTable" >
            SELECT
            LAST_INSERT_ID()
            AS
            lastId;
                </sql:query >
            </sql:transaction>
            <c:if test="${countaff>0}" >

            // make file entry
                <sql:update dataSource="${snapshot}" var="entrycount" >
            UPDATE
                    `tesla`.`batchsub` SET `attendance_file_id` = ? WHERE `batch_id` = ? and`subject_id` = ?;
                    <sql:param value="${ nextIdTable.rows[0].lastId }" />
                    <sql:param value="${whichbatch}" />
                    <sql:param value="${param.whichsub}" />
                </sql:update>

            </c:if>
        </c:if>
        }

    </script>


</body>
</html>
