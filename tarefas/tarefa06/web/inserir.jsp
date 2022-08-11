<%-- 
Author: lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    
        <title>Inserir JSP</title>
    </head>
    <body>
        <%  if(session.getAttribute("loginBean") != null){ %>
        
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link" href="./portal.jsp">Portal</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./ClientesServlet?action=list">Cadastro de Clientes</a>
                    </li>
                    <li class="nav-item  active">
                      <a class="nav-link" href="./inserir.jsp">Cadastro de Usuários</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./LogoutServlet">Sair</a>
                    </li>
                  </ul>
                </nav>
                
                <h4 align='center'>Usuário logado: <jsp:getProperty name="loginBean" property="nomeUsuario" /></h4>
                <br/>
                
                <h4 align='center'>Cadastrar Usuário</h4>
                
               <div align="center">
                    <form name='Formulario' action='CadastrarUsuarioServlet' method='post'>
                        <table class='table mx-auto w-auto'>
                            <thead class="thead-dark">
                                <tr>
                                   <th scope="col">Atributo</th>
                                   <th scope="col">Valor</th>
                                </tr>
                            </thead>

                            
                            <tr>
                                <td>
                                    Nome
                                </td>                                    
                                <td>
                                    <input type='text' name='nome' value=''/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    Login
                                </td>                                    
                                <td>
                                    <input type='text' name='login' value=''/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    Senha
                                </td>                                    
                                <td>
                                    <input type='password' name='senha' value=''/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" name="action" class="btn btn-danger" formaction="portal.jsp" value="Cancelar">
                                </td>
                                <td>
                                   <input type="submit" name="action" class="btn btn-primary" value="Cadastrar">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

                <footer align="center">Em caso de problemas contactar o administrador:        
                E-mail: ${configuracao.email} </footer>    
        <%  }else{ 
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro.jsp");
            
                request.setAttribute("msg", "Usuário não está logado.");

                request.setAttribute("page", "index.html");
                rd.forward(request, response);  
            } 
        %>             
    </body>
</html>
