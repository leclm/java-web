<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
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
            
            <h4 align='center'>Alterar Cliente</h4>
            
            <%Cliente cliente = new Cliente();
            cliente = (Cliente)request.getAttribute("cliente");%>

            <div align="center">
                <form name = "AlterarCliente" action="AlterarClienteServlet" method="post">
                    <table class='table mx-auto w-auto'>
                        <thead class="thead-dark">
                            <tr>
                               <th scope="col">Atributo</th>
                               <th scope="col">Valor</th>
                            </tr>
                        </thead>
                            <tr>
                                <td>
                                    ID
                                </td>
                                <td>
                                    <input type="text" name="id" readonly="true" value="<%=cliente.getId()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    CPF
                                </td>
                                <td>
                                   <input type="text" name="CPF" value="<%=cliente.getCpf()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Nome
                                </td>
                                <td>
                                   <input type="text" name="Nome" value="<%=cliente.getNome()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    E-mail
                                </td>
                                <td>
                                   <input type="text" name="Email" value="<%=cliente.getEmail()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Data
                                </td>
                                <td>
                                   <input type="text" name="Data" value="<%=cliente.getData()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Rua
                                </td>
                                <td>
                                   <input type="text" name="Rua" value="<%=cliente.getRua()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Nº
                                </td>
                                <td>
                                   <input type="text" name="Numero" value="<%=cliente.getNr()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    CEP
                                </td>
                                <td>
                                   <input type="text" name="CEP" value="<%=cliente.getCep()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Cidade
                                </td>
                                <td>
                                   <input type="text" name="Cidade" value="<%=cliente.getCidade()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    UF
                                </td>
                                <td>
                                   <input type="text" name="UF" value="<%=cliente.getUf()%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" name="action" class="btn btn-danger" formaction="ClientesServlet" value="Cancelar">
                                </td>
                                <td>
                                   <input type="submit" name="action" class="btn btn-primary" value="Alterar">
                                </td>
                            </tr>
                    </table>
                </form>
            </div>
            

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
