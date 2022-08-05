<%@page import="com.ufpr.tads.web2.dao.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="java.util.List"%>
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
        
        <title>Lista de Clientes</title>
    </head>
    <body>  
        <%if(session.getAttribute("loginBean") != null){ %>
            <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>

            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="./portal.jsp">Portal</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="./ClientesServlet">Cadastro de Clientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./inserir.jsp">Cadastro de Usuários</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./LogoutServlet">Sair</a>
                </li>
              </ul>
            </nav>

            <h4 align='center'>Usuário logado: <jsp:getProperty name="loginBean" property="nome" /></h4>
            <br/>
            
            <div align="center">
                <form name="Novo" action="FormNovoClienteServlet" method="post">
                    <input type="submit" class="btn btn-success" value="Novo">
                </form>
            </div>
            <br>
            
            <table class='table mx-auto w-auto'>
                <thead class="thead-dark">
                    <tr>
                       <th scope="col">CPF</th>
                       <th scope="col">Nome</th>
                       <th scope="col">E-mail</th>
                       <th scope="col">Ações</th>
                    </tr>
                </thead>

                <% List<Cliente> listaClientes = new ArrayList<Cliente>();
                listaClientes = (List<Cliente>)request.getAttribute("listaClientes");

                for(Cliente cliente : listaClientes){ %>
                    <tr>
                        <td>
                            <%=cliente.getCpf()%>
                        </td>

                        <td>
                            <%=cliente.getNome()%>
                        </td>

                        <td>
                            <%=cliente.getEmail()%>
                        </td>                            

                        <td>                                
                            <a href="./VisualizarClienteServlet?id=<%=cliente.getId()%>"><i class="bi bi-search"></i></a>
                            <a href="./FormAlterarClienteServlet?id=<%=cliente.getId()%>"><i class="bi bi-pencil"></i></a>
                            <a href="" onclick='confirmarExclusao()'><i class="bi bi-trash"></i></a>
                        </td>                            

                    </tr>
                    
                    <script language=javascript>
                        function confirmarExclusao(){
                            if (confirm("Você realmente deseja excluir este cliente?"))
                                window.location = "./RemoverClienteServlet?id=<%=cliente.getId()%>";
                            }
                    </script>
                <%} %>                       
                </table>

            <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean"
            scope="application" />
            
            <br/>
            
            <footer align="center">Em caso de problemas contactar o administrador:        
            E-mail: <jsp:getProperty name="configuracao" property="email"/>
            </footer>   
            
        <%} else { 
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");

            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema.");
            request.setAttribute("page", "index.jsp");

            rd.forward(request, response);  
        }
       %> 
       
    </body>
</html>
