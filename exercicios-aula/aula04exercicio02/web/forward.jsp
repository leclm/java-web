<%-- 
    Document   : forward
    Created on : 11 de jul de 2022, 15:36:43
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
    <h2>Foi REDIRECIONADO</h2>
    <%  for(int i=9; i>=0; i--) { 
        out.println(i + " - ");
    }%>
  </body>
</html>
