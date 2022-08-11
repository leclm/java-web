<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="models.Cliente" %>
<%@page errorPage="/jsp/erro.jsp" %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar clientes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    
    <c:if test="${loginBean == null}">
        <jsp:forward page="/index.jsp">
            <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema."></jsp:param>
        </jsp:forward>
    </c:if>
    
    <body>
        <table border="1" class="mt-2 table">
            <thead>
                <tr>
                  <th scope="col">CPF</th>
                  <th scope="col">Nome</th>
                  <th scope="col">Email</th>
                  <th scope="col">Visualizar</th>
                  <th scope="col">Alterar</th>
                  <th scope="col">Remover</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${clientes}">
                    <tr>
                        <td>${c.getFormattedCpf()}</td>
                        <td>${c.nome}</td>
                        <td>${c.email}</td>
                        <td><a href="ClientesServlet?action=show&id=${c.id}"><img height=40 src="https://icon-library.com/images/white-eye-icon/white-eye-icon-15.jpg" /></a></td>
                        <td><a href="ClientesServlet?action=formUpdate&id=${c.id}"><img height=40 src="https://www.pngitem.com/pimgs/m/31-313330_free-png-icons-pen-transparent-png.png" /></a></td>
                        <td><a style="cursor:pointer" onclick="removeClient(${c.id})"><img height=40 src="https://www.kindpng.com/picc/m/220-2200770_font-trash-fa-trash-icon-png-transparent-png.png" /></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div><a href="ClientesServlet?action=formNew" class="m-2 btn btn-primary">Novo cliente</a></div>
        <div><a href="./jsp/portal.jsp" class="m-2 btn btn-light">Voltar</a></div>
    </body>
    
    <script>
        function removeClient(id) {
            console.log(id)
            if (confirm("Tem certeza de que quer remover este cliente?")) {
                window.location.href = "ClientesServlet?action=remove&id=" + id;
            }
        }
    </script>
</html>
