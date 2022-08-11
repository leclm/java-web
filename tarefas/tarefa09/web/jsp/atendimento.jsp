<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Atendimento" %>
<%@page errorPage="/jsp/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo atendimento</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    </head>
    
    <c:if test="${loginBean == null}">
        <jsp:forward page="/index.jsp">
            <jsp:param name="msg" value="Usuário deve se autenticar para acessar o sistema."></jsp:param>
        </jsp:forward>
    </c:if>
    
    <body>
        <form action="AtendimentosServlet?action=new" method="POST" class="m-3">
            <input type="hidden" id="usuario" name="usuario" value="${userId}">
            
            <div class="form-group">
              <label for="produto">Produto</label>
              <select class="form-control" name="produto" id="produto">
                  <c:forEach var="p" items="${produtos}">
                    <option value="${p.id}">${p.name}</option>
                  </c:forEach>
               </select>
            </div>
            
            <div class="form-group">
              <label for="tipoAtendimento">Tipo do atendimento</label>
              <select class="form-control" name="tipoAtendimento" id="tipoAtendimento">
                  <c:forEach var="ta" items="${tipoAtendimentos}">
                    <option value="${ta.id}">${ta.name}</option>
                  </c:forEach>
               </select>
            </div>
            
            <div class="form-group">
              <label for="cliente">Clientes</label>
              <select class="form-control" name="cliente" id="cliente">
                  <c:forEach var="c" items="${clientes}">
                    <option value="${c.id}">${c.nome}</option>
                  </c:forEach>
               </select>
            </div>
            
            <div class="form-group">
              <label for="dscAtendimento">Descrição</label>
              <input type="text" class="form-control" name="dscAtendimento" id="dscAtendimento" maxlength="100" required>
            </div>
            
            <div class="form-group">
              <label for="dataAtendimento">Data do atendimento</label>
              <input type="text" class="form-control" name="dataAtendimento" id="dataAtendimento" value="${defaultDate}">
            </div>
            <div class="form-group">
              <label for="horaAtendimento">Horário do atendimento</label>
              <input type="time" class="form-control" name="horaAtendimento" id="horaAtendimento" value="${defaultTime}">
            </div>
            
            <div class="form-group">
              <label for="resAtendimento">Atendimento resolvido?</label>
              <input type="checkbox" name="resAtendimento" id="resAtendimento">
            </div>
            
            <button type="submit" class="btn btn-warning">Salvar</button>
            <a href="./jsp/portal.jsp"><button type="button" class="btn btn-light">Cancelar</button></a>
        </form>
    </body>
    
    <script>
      $( function() {
        $( "#dataAtendimento" ).datepicker({
                  dateFormat: 'dd/mm/yy'
              }).val();
      } );
    </script>
  
</html>
