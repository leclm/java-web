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
        <a href="ClientesServlet?action=list"><button type="button" class="m-3 btn btn-primary">Voltar</button></a>
        <form action="AlterarClienteServlet" method="POST" class="m-3">
            <input type="hidden" name="id" class="form-control" id="id" value="${cliente.id}">
            <div class="form-group">
              <label for="cpf">CPF</label>
              <input disabled type="text" class="form-control" name="cpf" id="cpf" placeholder="CPF" value="${cliente.getFormattedCpf()}">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input disabled type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Email" value="${cliente.email}">
            </div>
            <div class="form-group">
              <label for="nome">Nome</label>
              <input disabled type="text" class="form-control" name="nome" id="nome" placeholder="Nome" value="${cliente.nome}">
            </div>
            <div class="form-group">
              <label for="data">Data de nascimento</label>
              <input disabled type="date" class="form-control" name="data" id="data" placeholder="Data de nascimento" value="${cliente.data}">
            </div>
            <div class="form-group">
              <label for="rua">Rua</label>
              <input disabled type="text" class="form-control" name="rua" id="rua" placeholder="Rua" value="${cliente.rua}">
            </div>
            <div class="form-group">
              <label for="numero">Número</label>
              <input disabled type="number" class="form-control" name="numero" id="numero" placeholder="Número" value="${cliente.numero}">
            </div>
            <div class="form-group">
              <label for="cep">CEP</label>
              <input disabled type="text" class="form-control" name="cep" id="cep" placeholder="CEP" value="${cliente.getFormattedCep()}">
            </div>
            <div class="form-group">
                <label for="cidade">Cidade</label>
                <select disabled class="form-control" name="cidade" id="cidade"></select>
                <input disabled type="hidden" class="form-control" name="cidadeId" id="cidadeId" placeholder="Cidade" value="${cliente.idCidade}">
            </div>
        </form>
    </body>
    
    <script type="text/javascript" >
        $(document).ready(function() {
            var cidadeId = $("#cidadeId").val();
            var url = "CidadeServlet";
            if (cidadeId) {
                $.ajax({
                        url : url, 
                        data : {
                            cidadeId : cidadeId
                        },
                        dataType : 'json',
                        success : function(data) {
                            $("#cidade").empty();
                             $.each(data, function(i, obj) {
                                $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                            });
                        },
                        error : function(request, textStatus, errorThrown) {
                            alert(request.status + ', Error: ' + request.statusText);
                          
                        }
                    });
            }
        });
    </script>
</html>
