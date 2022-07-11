<%-- 
    Document   : pagina
    Created on : 11 de jul de 2022, 14:05:31
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
    <% if(session.getAttribute("logado") == null) { %>
        <h1 style="color:red">Você não está logado</h1>
        <a href="index.html">Login</a>
    <% } else { %>
        <h1 style="color:blue">Outra página linda</h1>
        <a href="OutraServlet">OutraServlet</a>
        <a href="LogoutServlet">Logout</a>
    <% } %>
  </body>
</html>
