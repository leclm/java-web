<%-- 
    Document   : ex03
    Created on : 24/06/2022, 10:50:25
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Data/Hora Atual!</h1>
        <p style='background-color: #cecece; border: solid 1px red; width: 300px; text-align: center'>
            <% out.println( new Date() ); %>
        </p>
    </body>
</html>
