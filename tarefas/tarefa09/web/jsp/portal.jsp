<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/jsp/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal</title>
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
        <h1>Olá, <c:out value="${loginBean.name}"/></h1>
        <div class="list-group">
            <a class="list-group-item list-group-item-action" href="../ClientesServlet">Cadastro de clientes</a>
            <a class="list-group-item list-group-item-action" href="../AtendimentosServlet">Mostrar atendimentos</a>
            <a class="list-group-item list-group-item-action" href="../AtendimentosServlet?action=formNew">Efetuar atendimento</a>
            <hr>
            <a class="list-group-item list-group-item-action" href="../GeradorRelatorioServlet?report=pessoas">Relatório de pessoas</a>
            <a class="list-group-item list-group-item-action" href="../GeradorRelatorioServlet?report=atendimentos">Relatório de atendimentos</a>
            <a class="list-group-item list-group-item-action" href="../GeradorRelatorioServlet?report=atendimentos-resolvidos">Relatório de atendimentos resolvidos</a>
            <a class="list-group-item list-group-item-action" href="../GeradorRelatorioServlet?report=atendimentos-tipo">Relatório de reclamações</a>
            <hr>
            <a class="list-group-item list-group-item-action" href="../LogoutServlet">Sair</a>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
