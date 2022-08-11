<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Cliente" %>
<%@page errorPage="/jsp/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar cliente</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    
    <c:if test="${loginBean == null}">
        <jsp:forward page="/index.jsp">
            <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema."></jsp:param>
        </jsp:forward>
    </c:if>
    
    <body>
        <a href="AtendimentosServlet?action=list"><button type="button" class="m-3 btn btn-primary">Voltar</button></a>
        <form action="AlterarClienteServlet" method="POST" class="m-3">
            <div class="form-group">
              <label for="produto">Produto</label>
              <select disabled class="form-control" name="produto" id="produto">
                    <option value="${atendimento.produto.id}">${atendimento.produto.name}</option>
               </select>
            </div>
            
            <div class="form-group">
              <label for="tipoAtendimento">Tipo do atendimento</label>
              <select disabled class="form-control" name="tipoAtendimento" id="tipoAtendimento">
                <option value="${atendimento.tipoAtendimento.id}">${atendimento.tipoAtendimento.name}</option>
              </select>
            </div>
            
            <div class="form-group">
              <label for="cliente">Clientes</label>
              <select class="form-control" name="cliente" disabled id="cliente">
                 <option value="${atendimento.cliente.id}">${atendimento.cliente.nome}</option>
              </select>
            </div>
            
            <div class="form-group">
              <label for="dscAtendimento">Descrição</label>
              <input type="text" class="form-control" name="dscAtendimento" id="dscAtendimento" maxlength="100" required disabled value="${atendimento.dscAtendimento}">
            </div>
            
            <div class="form-group">
              <label for="dataAtendimento">Data do atendimento</label>
              <input type="text" class="form-control" name="dataAtendimento" id="dataAtendimento" disabled value="${atendimento.getFormattedDateHour()}">
            </div>
            
            <div class="form-group">
              <label>Atendimento ${atendimento.isSolved() ? "" : "não"} resolvido</label>
            </div>
        </form>
    </body>
</html>
