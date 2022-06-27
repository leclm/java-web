<%-- 
    Document   : ex01
    Created on : 26 de jun de 2022, 20:24:59
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Escreva uma JSP que mostra seu nome 100 vezes (usando laço) -->
    </head>
    <body>
        <h1>Meu lindo nome várias vezes *-*</h1>
        <%
            for (int i = 0; i < 100; i++) {
                out.println("<p>Letícia</p>");
            }
        %>
    </body>
</html>
