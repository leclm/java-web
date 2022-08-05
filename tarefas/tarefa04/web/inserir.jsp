<%-- 
    Document   : inserir
    Created on : 22 de jul de 2022, 23:51:00
    Author     : lelim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir JSP</title>
        <link rel="stylesheet" href="./style.css">
    </head>
    
    <body>
        <%  if(session.getAttribute("loginBean") != null){ %>
            <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>   
            
            <header>
                <h1>Cadastrar novo usuário</h1>
                <h2>Usuário logado: <jsp:getProperty name="loginBean" property="userName" /></h2>
            </header>

            <form action="CadastrarUsuarioServlet" method="POST">
              <section class="content-cards">
                <div class="container">
                  <div class="vector-card">
                    <ul>
                      <li>
                        <label for="name">Nome:</label>
                        <input type="text" id="name" name="user_name" placeholder="nome completo">
                      </li>
                      <li>
                        <label for="mail">Login:</label>
                        <input type="text" id="mail" name="user_email" placeholder="example@example.com">
                      </li>
                      <li>
                        <label for="senha">Senha:</label>
                        <input id="senha" type="password" name="user_pw" placeholder="digite sua senha">
                      </li>
                      <li class="button">
                        <button type="submit" value="Salvar">Salvar</button>
                      </li>
                    </ul>
                  </div>
                </div>
              </section>
            </form>

            <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean"
            scope="application" />
              <footer>
                <p>Em caso de problemas, entrar em contato através do e-mail abaixo:</p>
                <p>Letícia Lima: <jsp:getProperty name="configuracao" property="email"/></p>
              </footer>
            <% } else { 
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/erro.jsp");
                response.setContentType("text/html;charset=UTF-8");
                request.setAttribute("msg", "pagina inserir.jsp: Usuário não está logado.");

                request.setAttribute("page", "index.html");
                rd.forward(request, response);  
            } 
        %>             
    </body>
</html>
