<%-- 
    Document   : erro
    Created on : 20 de jul de 2022, 22:41:38
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Erro ao acessar a Servlet</title>
    <link rel="stylesheet" href="./style.css">
  </head>
  <body>
    <%              
        //pega o atributo msg e salva na mensagem
        String mensagem = "pagina erro.jsp: Usuário/Senha não encontrado! Erro ao acessar a página solicitada";
        
        if ((String)request.getAttribute("msg") != null){
            mensagem = (String)request.getAttribute("msg");
        }    
        //pega o atributo page
        String pagina = "index.html";
        if ((String)request.getAttribute("page") != null){
            pagina = (String)request.getAttribute("page");
        }
    %>
        
    <header>
        <h1>Erro!</h1>
        <h2>Mensagem: <%=mensagem%></h2>
    </header>
    
    <section class="content-cards">
        <div class="container">
            <div class="vector-card">
                <ul>
                    <li>
                        Clique no botão abaixo para retornar à página principal
                    </li> 
                    <li class="button">
                        <button><a href="<%=pagina%>">Home</a></button>
                    </li> 
                </ul>
            </div>
        </div>
    </section>
   
    <footer>
      <p>Em caso de problemas, entrar em contato através do e-mail abaixo:</p>
      <p>Letícia Lima: <jsp:getProperty name="configuracao" property="email"/></p>
    </footer>
  </body>
</html>
