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
    
        <title>Inserir JSP</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.loginBean}" >
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
                
            <h4 align='center'>Usuário logado: ${loginBean.nomeUsuario} </h4>
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
                                <input type='text' name='nome' value='' maxlength="50"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Login
                            </td>                                    
                            <td>
                                <input type='text' name='login' value='' maxlength="50"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Senha
                            </td>                                    
                            <td>
                                <input type='password' name='senha' value='' maxlength="50"/>
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
            </c:if>
        
            <c:if test="${empty sessionScope.loginBean}" >                
                <c:set var="msg" value="Usuário não está logado." scope="request" />
                <c:set var="page" value="index.jsp" scope="request" />
                <jsp:forward page="Erro.jsp" />
            </c:if>           
        </body>
</html>
