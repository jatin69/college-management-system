/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tesla.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jatin
 */
@WebServlet("/AppExceptionHandler")
public class AppExceptionHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Throwable throwable = (Throwable) request
                    .getAttribute("javax.servlet.error.exception");
            Integer statusCode = (Integer) request
                    .getAttribute("javax.servlet.error.status_code");
            String servletName = (String) request
                    .getAttribute("javax.servlet.error.servlet_name");
            if (servletName == null) {
                servletName = "Unknown";
            }
            String requestUri = (String) request
                    .getAttribute("javax.servlet.error.request_uri");
            if (requestUri == null) {
                requestUri = "Unknown";
            }

            // Set response content type
            response.setContentType("text/html");

            out.write("<html><head>");

            if (statusCode == 404) {
                out.write("  <meta charset=\"utf-8\">\n"
                        + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "\n"
                        + "        <title>TESLA | 404 Error</title>\n"
                        + "\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "        <link href=\"http://localhost:8080/tesla/font-awesome/css/font-awesome.css\" rel=\"stylesheet\">\n"
                        + "\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/animate.css\" rel=\"stylesheet\">\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/style.css\" rel=\"stylesheet\">\n"
                        + "\n"
                        + "    </head>\n"
                        + "    <body class=\"gray-bg\">\n"
                        + "\n"
                        + "\n"
                        + "        <div class=\"middle-box text-center animated fadeInDown\">\n"
                        + "            <h1>404</h1>\n"
                        + "            <h3 class=\"font-bold\">Page Not Found</h3>\n"
                        + "\n"
                        + "            <div class=\"error-desc\">\n"
                        + "                Sorry, but the page you are looking for has note been found. Try checking the URL for error, then hit the refresh button on your browser or try found something else in our app.\n"
                        + "                You can go back to main page: <br/><a href=\"login.jsp\" class=\"btn btn-primary m-t\">Dashboard</a>\n"
                        + "                </form>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "\n"
                        + "        <!-- Mainly scripts -->\n"
                        + "        <script src=\"js/jquery-2.1.1.js\"></script>\n"
                        + "        <script src=\"js/bootstrap.min.js\"></script>\n"
                        + "");
                /*  
                 out.write("<h3>Error Details</h3>");
                 out.write("<strong>Status Code</strong>:" + statusCode + "<br>");
                 out.write("<strong>Requested URI</strong>:" + requestUri);
                 */
            } else if (statusCode == 500) {

                out.write(" <meta charset=\"utf-8\">\n"
                        + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "\n"
                        + "        <title>TESLA | 500 Error</title>\n"
                        + "\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "        <link href=\"http://localhost:8080/tesla/font-awesome/css/font-awesome.css\" rel=\"stylesheet\">\n"
                        + "\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/animate.css\" rel=\"stylesheet\">\n"
                        + "        <link href=\"http://localhost:8080/tesla/css/style.css\" rel=\"stylesheet\">\n"
                        + "\n"
                        + "    </head>\n"
                        + "\n"
                        + "    <body class=\"gray-bg\">\n"
                        + "\n"
                        + "\n"
                        + "        <div class=\"middle-box text-center animated fadeInDown\">\n"
                        + "            <h1>500</h1>\n"
                        + "            <h3 class=\"font-bold\">Internal Server Error</h3>\n"
                        + "\n"
                        + "            <div class=\"error-desc\">\n"
                        + "                The server encountered something unexpected that didn't allow it to complete the request. We apologize.<br/>\n"
                        + "                You can go back to main page: <br/><a href=\"login.jsp\" class=\"btn btn-primary m-t\">Dashboard</a>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "\n"
                        + "        <!-- Mainly scripts -->\n"
                        + "        <script src=\"js/jquery-2.1.1.js\"></script>\n"
                        + "        <script src=\"js/bootstrap.min.js\"></script>\n"
                        + "");

                out.write("<div class=\"error-desc\"><h3>Exception Details</h3>");
                out.write("<ul><li>Servlet Name:" + servletName + "</li>");
                out.write("<li>Exception Name:" + throwable.getClass().getName() + "</li>");
                out.write("<li>Requested URI:" + requestUri + "</li>");
                out.write("<li>Exception Message:" + throwable.getMessage() + "</li>");
                out.write("</ul></div>");

            }

            /* out.write("<br><br>");
             out.write("<a href=\"index.html\">Home Page</a>");
             
             */
            out.write("</body></html>");

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
