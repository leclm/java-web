<%-- 
    Document   : include
    Created on : 11 de jul de 2022, 15:35:50
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
    <h2>Isto foi incluído</h2>
    <%  for(int i=0; i<10; i++) { 
            out.println(i + " - ");
        }
    %>
  </body>
</html>
