<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="/jsp/erro.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <h2 class="text-center text-danger">${msg}</h2>
        
        <% if (request.getParameter("msg") != null) { %>
            <h2 class="text-center text-danger"><%= request.getParameter("msg") %></h2>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="container">
              <label for="login"><b>Login</b></label>
              <input type="text" placeholder="Login" name="login" required>
              <br>
              <label for="senha"><b>Senha</b></label>
              <input type="password" placeholder="Senha" name="senha" required>
              <br>
              <button type="submit">Logar</button>
            </div>
        </form> 
    </body>
</html>
