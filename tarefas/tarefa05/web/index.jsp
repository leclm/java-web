<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Página Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    
    <body>
        <div class="jumbotron text-center">
            <h1 style="color:black;">Bem-vindo ao meu sistema!</h1>
            <p> <%
                String mensagem = ""; 
                if ((String)request.getAttribute("msg") != null){
                    mensagem = (String)request.getAttribute("msg");%>
                    <h3 style="color:Tomato;"><%=mensagem%></h3>
                <% } %>           

                <form name="Formulario" action="LoginServlet" method="post">
                   Login: <input type="text" name="login" value="" /> <br/>
                   Senha: <input type="password" name="senha" value="" /> <br/>

                   <input type="submit" value="Logar">
               </form>                  
            </p> 
        </div>
        
        <br/><br/><br/>
        
        <footer align="center">Em caso de problemas contactar o administrador:        
            E-mail: <jsp:getProperty name="configuracao" property="email"/>
        </footer> 
    </body>
</html>
