<%-- 
    Document   : portal
    Created on : 22 de jul de 2022, 23:01:50
    Author     : lelim
--%>

<%@page import="com.ufpr.tads.web2.dao.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ufpr.tads.web2.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Portal Servlet</title>
    <link rel="stylesheet" href="./style.css">
  </head>

  <body>
    <header>
      <h1>Portal</h1>
    </header>

    <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/> 
    <%  if (session.getAttribute("loginBean") != null) { 
        response.setContentType("text/html;charset=UTF-8");%>
        <section class="content-cards">
            <div class="container">
                <div class="vector-card">
                    <ul>
                        <li>
                            <h2>Usuário logado: <jsp:getProperty name="loginBean" property="userName" /> </h2>
                        </li> 
                        <li class="button">
                            <button><a href="inserir.jsp">Inserir</a></button>
                        </li> 
                        <li class="button">
                            <button><a href="LogoutServlet">Logout</a></button>
                        </li> 
                    </ul>
                </div>
            </div>
        </section>    
        
        <div class="content-cards users-table">
            <table border='1'>
                <tr>
                    <th>Nome</th>
                    <th>Login</th>
                    <th>Senha</th>
                </tr>        
        
                <% List<Usuario> usuarios = new ArrayList<Usuario>();
                UsuarioDAO userDAO = new UsuarioDAO();
                usuarios = userDAO.selectAll();

                for (Usuario usuario : usuarios) { %>
                    <tr>
                      <td>
                        <%= usuario.getName() %>
                      </td>

                      <td>
                        <%= usuario.getEmail()%>
                      </td>

                      <td>
                        <%= usuario.getPw()%>
                      </td>
                    </tr>
                <% } %>                       
            </table>
        </div>

        <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application" />
        <footer>
            <p>Em caso de problemas, entrar em contato através do e-mail abaixo:</p>
            <p>Letícia Lima: <jsp:getProperty name="configuracao" property="email"/></p>
        </footer>   
        <%  } else {
                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/erro.jsp");

                request.setAttribute("msg", "pagina portal.jsp: Usuário não está logado.");

                request.setAttribute("page", "index.html");
                rd.forward(request, response);
            }
        %>
  </body>
</html>






<%-- 
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

    <div class="content-cards users-table">
      <table border='1'>
        <tr>
          <th>Nome</th>
          <th>Login</th>
          <th>Senha</th>
        </tr>
        <% for(Usuario user : listaUsuarios){ %>
            <tr>
              <td>
                out.println(user.getName()
              </td>

              <td>
                out.println(user.getEmail()
              </td>

              <td>
                out.println(user.getPw()
              </td>
            </tr>
        <% } %>
      </table>
    </div>

    <% lista.setAttribute("lista", listaUsuarios) %>
    <div class="users-btn"><button><a href="LogoutServlet">Logout</a></button></div>
      --%>