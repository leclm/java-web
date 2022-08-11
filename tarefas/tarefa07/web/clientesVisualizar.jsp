<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <c:if test="${not empty sessionScope.loginBean}" > 
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="./portal.jsp">Portal</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="./ClientesServlet?action=list">Cadastro de Clientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./inserir.jsp">Cadastro de Usuários</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./LogoutServlet">Sair</a>
                </li>
              </ul>
            </nav>

            <h4 align='center'>Usuário logado: ${loginBean.nomeUsuario}</h4>
            <br/>
            
            <div align="center">
                <form name="Voltar" action="ClientesServlet?action=list" method="post">
                    <input type="submit" class="btn btn-warning" value="Voltar">
                </form>
            </div>
            <br>            
            
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
                            ${cliente.id_cliente}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CPF
                        </td>
                        <td>
                            ${cliente.cpf_cliente}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nome
                        </td>
                        <td>
                            ${cliente.nome_cliente}
                        </td>
                    </tr>    
                    <tr>
                        <td>
                            E-mail
                        </td>
                        <td>
                            ${cliente.email_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Data
                        </td>
                        <td>
                            ${cliente.data_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Rua
                        </td>
                        <td>
                            ${cliente.rua_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Nº
                        </td>
                        <td>
                            ${cliente.nr_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            CEP
                        </td>
                        <td>
                            ${cliente.cep_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Cidade
                        </td>
                        <td>
                            ${cliente.cidade_cliente}
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            UF
                        </td>
                        <td>
                            ${cliente.uf_cliente}
                        </td>
                    </tr> 
                </table>

            <br/>
            <footer align="center">Em caso de problemas contactar o administrador:        
            E-mail: ${configuracao.email}</footer>  
        </c:if>
        
            
        <c:if test="${empty sessionScope.loginBean}" >                
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema." scope="request" />
            <jsp:forward page="index.jsp" />
        </c:if>
    </body>
</html>
