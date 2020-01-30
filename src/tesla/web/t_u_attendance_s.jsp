<%-- 
    Document   : t_u_attendance_s
    Created on : 9 Nov, 2016, 7:58:30 PM
    Author     : Jatin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="global_include.jsp" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<!--
<html>    <head>   </head> <body>
-->
<%
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");
    // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("D:\\5th sem\\TESLA - IT project\\tesla\\web\\temp"));
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();
            /*  out.println("<html>");
             out.println("<head>");
             out.println("<title>JSP File upload</title>");
             out.println("</head>");
             out.println("<body>");
             */

            // MY COMPLETE CUSTOM FILE NAME WILL BE : attendance_1_3_filename_jatin.xlsx
            // for result, just change attendance to result
            String customFileName = "" + session.getAttribute("customfilename");

            /*
             while (i.hasNext()) {

             FileItem fi = (FileItem) i.next();

             if (fi.isFormField()) {
             String name = fi.getFieldName();
             String value = fi.getString();
             /*FOCUS >> getting values of whichsub && teacher_id in respective order !!  
             String temp = value + "_";
             customFileName.concat(temp);
             //   out.println("name is :" + name);
             //   out.println("value is :" + value);
             } 
             }
             */
            while (i.hasNext()) {

                FileItem fi = (FileItem) i.next();

                if (!fi.isFormField()) {

                    customFileName.concat("filename:");

                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();

                    // SET FILE NAME ACCORDING TO ID that is in database
                    String fileName = fi.getName();

                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file

                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath + customFileName + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + customFileName + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    String newfilename = customFileName + fileName;
             //       session.setAttribute("D_filepath", filePath);
                    //       session.setAttribute("D_filename", newfilename );
                    fi.write(file);
            //             out.println("Uploaded Filename: " + filePath + customFileName + fileName + "<br>");
                    //   out.println( session.getAttribute("D_filepath"));
                    //            out.println( session.getAttribute("D_filename"));
                }
            }
%>  


<script>
//      document.write("heloooooooooooooooooooooooo");
    alert("File Successfully Uploaded !!");
    window.location.href = "t_dashboard.jsp";
</script>
<%
        //  out.println("</body>");
        //  out.println("</html>");
    } catch (Exception ex) {
        String err = ex.toString();
        // Set error code and reason.
        response.sendError(500, err);
    }
} else {
%>
<script>
    alert("No file Uploaded !! , Retry ");
    window.location.href = "t_u_attendance.jsp";
</script>
<%
        /*     out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet upload</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<p>No file uploaded</p>");
         out.println("</body>");
         out.println("</html>");
         */
    }

%>
<!--
    </body>
</html>
-->
