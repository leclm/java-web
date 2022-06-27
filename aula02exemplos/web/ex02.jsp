<%-- 
    Document   : ex02
    Created on : 24/06/2022, 10:48:37
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JAVA É ______!</h1>
        <% 
            for (int i=0; i<10; i++) {
                out.println("<p style='color: pink'>Eu ____ JAVA = " + i + "</p>");
            }
        %>
    </body>
</html>
