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
        <script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
        
        <script>
            jQuery(function($){
                $("#cpf").mask("999.999.999-99");
                $("#data").mask("99/99/9999");
                $("#data" ).datepicker({ dateFormat: 'dd/mm/yy' });
                $("#cep").mask("99999-999");
                
                $("#cpf").blur(function(){
                    var cpf = $("#cpf").val().replace(/[^0-9]/g, '').toString();
                    var isCpfRepetido = 0;
                    
                    for(var i = 0; i < 10; i++){
                        if(cpf[i] === cpf[i+1]){
                            isCpfRepetido++;
                        }
                    }
                                        
                    if( cpf.length === 11 && isCpfRepetido !== 10){
                        var v = [];

                        v[0] = 1 * cpf[0] + 2 * cpf[1] + 3 * cpf[2];
                        v[0] += 4 * cpf[3] + 5 * cpf[4] + 6 * cpf[5];
                        v[0] += 7 * cpf[6] + 8 * cpf[7] + 9 * cpf[8];
                        v[0] = v[0] % 11;
                        v[0] = v[0] % 10;

                        v[1] = 1 * cpf[1] + 2 * cpf[2] + 3 * cpf[3];
                        v[1] += 4 * cpf[4] + 5 * cpf[5] + 6 * cpf[6];
                        v[1] += 7 * cpf[7] + 8 * cpf[8] + 9 * v[0];
                        v[1] = v[1] % 11;
                        v[1] = v[1] % 10;

                        if ((v[0] != cpf[9]) || (v[1] != cpf[10])){
                            alert('CPF inválido: ' + cpf);
                        }
                    }
                    else{
                        alert('CPF inválido:' + cpf);
                    }
                });
            });
        </script>
        
        <script type="text/javascript" >
            $(document).ready(function() {
                $( "#estado" ).change(function() {
                    getCidades();
                    
                    var optionEstado = $('#estado').find(":selected").text();
                    $('#ufHidden').val(optionEstado);
                });
                
                $('#cidade').change(function() {
                    var optionCidade = $('#cidade').find(":selected").text();
                    $('#cidadeHidden').val(optionCidade);
                });
            });
            function getCidades(){
                var estadoId = $("#estado").val();
                var url = "AJAXServlet";
                
                $.ajax({
                    url : url, 
                    data : {
                        estadoId : estadoId
                    }, 
                    dataType : 'json',
                    success : function(data) {
                        $("#cidade").empty();
                        $.each(data, function(i, obj) {
                            $("#cidade").append('<option value=' + obj.id_cidade + '>' + obj.nome_cidade +
                            '</option>');
                        });
                    },
                    error : function(request, textStatus, errorThrown) {
                        alert(request.status + ', Error: ' + request.statusText);
                       
                    }
                });
            }
                        
            
        </script>

        
        <title>Novo Cliente</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.loginBean}" >
            <c:if test="${requestScope.form eq 'novo'}" >   
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
                <div align="center">
                    <form name="Cancelar" action="ClientesServlet?action=list" method="post">
                        <input type="submit" class="btn btn-warning" value="Cancelar">
                    </form>
                </div>
                <br/>

                <h4 align='center'>Cadastrar Cliente</h4>    
 <div align="center">
                    <form id="cadCliente" name="CadastrarCliente" action="ClientesServlet?action=new" method="post">
                        <table class='table mx-auto w-auto'>
                            <thead class="thead-dark">
                                <tr>
                                   <th scope="col">Atributo</th>
                                   <th scope="col">Valor</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td>
                                        CPF
                                    </td>
                                    <td>
                                        <input type="text" id="cpf" name="CPF" value="" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nome
                                    </td>
                                    <td>
                                       <input type="text" name="Nome" value="" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        E-mail
                                    </td>
                                    <td>
                                       <input type="email" name="Email" value="" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Data
                                    </td>
                                    <td>
                                       <input type="text" id="data" name="Data" value="" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Rua
                                    </td>
                                    <td>
                                       <input type="text" name="Rua" value="" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nº
                                    </td>
                                    <td>
                                       <input type="text" name="Numero" value="" maxlength="6" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        CEP
                                    </td>
                                    <td>
                                       <input type="text" id="cep" name="CEP" value="" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        UF
                                    </td>
                                    <td>
                                       <select id="estado" required>
                                            <option value="" >Selecione um Estado</option>
                                            <option value="1" >AC</option>
                                            <option value="2" >AL</option>
                                            <option value="3" >AM</option>
                                            <option value="4" >AP</option>
                                            <option value="5" >BA</option>
                                            <option value="6" >CE</option>
                                            <option value="7" >DF</option>
                                            <option value="8" >ES</option>
                                            <option value="9" >GO</option>
                                            <option value="10" >MA</option>
                                            <option value="11" >MG</option>
                                            <option value="12" >MS</option>
                                            <option value="13" >MT</option>
                                            <option value="14" >PA</option>
                                            <option value="15" >PB</option>
                                            <option value="16" >PE</option>
                                            <option value="17" >PI</option>
                                            <option value="18" >PR</option>
                                            <option value="19" >RJ</option>
                                            <option value="20" >RN</option>
                                            <option value="21" >RO</option>
                                            <option value="22" >RR</option> 
                                            <option value="23" >RS</option>  
                                            <option value="24" >SC</option>  
                                            <option value="25" >SE</option>  
                                            <option value="26" >SP</option>  
                                            <option value="27" >TO</option>  
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cidade
                                    </td>
                                    <td>
                                       <select id="cidade" required>
                                            <option value="" >Selecione uma Cidade</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                <input type="text" id="cidadeHidden" name="Cidade" value="" maxlength="100" hidden required />
                                <input type="text" id="ufHidden" name="UF" value="" maxlength="2" hidden required />
                                   
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                       <input type="submit" name="action" class="btn btn-primary" value="Cadastrar">
                                    </td>
                                </tr>
                        </table>
                    </form>
                </div>

                <br/>
                <footer align="center">Em caso de problemas contactar o administrador:        
                E-mail: ${configuracao.email}</footer>   
            </c:if>
        
            <c:if test="${requestScope.form eq 'alterar'}" >   
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
                <div align="center">
                    <form name="Voltar" action="ClientesServlet?action=list" method="post">
                        <input type="submit" class="btn btn-warning" value="Voltar">
                    </form>
                </div>
                <br/>

                <h4 align='center'>Alterar Cliente</h4>

                <div align="center">
                    <form name = "AlterarCliente" action="ClientesServlet?action=update" method="post">
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
                                        <input type="text" name="id" readonly="true" value="${cliente.id_cliente}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        CPF
                                    </td>
                                    <td>
                                       <input type="text" id="cpf" name="CPF" value="${cliente.cpf_cliente}" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nome
                                    </td>
                                    <td>
                                       <input type="text" name="Nome" value="${cliente.nome_cliente}" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        E-mail
                                    </td>
                                    <td>
                                       <input type="text" name="Email" value="${cliente.email_cliente}" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Data
                                    </td>
                                    <td>
                                       <input type="text" id="data" name="Data" value="${cliente.data_cliente}" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Rua
                                    </td>
                                    <td>
                                       <input type="text" name="Rua" value="${cliente.rua_cliente}" maxlength="100" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nº
                                    </td>
                                    <td>
                                       <input type="text" name="Numero" value="${cliente.nr_cliente}" maxlength="6" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        CEP
                                    </td>
                                    <td>
                                       <input type="text" id="cep" name="CEP" value="${cliente.cep_cliente}" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        UF
                                    </td>
                                    <td>
                                       <select id="estado" required>
                                            <option value="" >Selecione um Estado</option>
                                            <option value="1" >AC</option>
                                            <option value="2" >AL</option>
                                            <option value="3" >AM</option>
                                            <option value="4" >AP</option>
                                            <option value="5" >BA</option>
                                            <option value="6" >CE</option>
                                            <option value="7" >DF</option>
                                            <option value="8" >ES</option>
                                            <option value="9" >GO</option>
                                            <option value="10" >MA</option>
                                            <option value="11" >MG</option>
                                            <option value="12" >MS</option>
                                            <option value="13" >MT</option>
                                            <option value="14" >PA</option>
                                            <option value="15" >PB</option>
                                            <option value="16" >PE</option>
                                            <option value="17" >PI</option>
                                            <option value="18" >PR</option>
                                            <option value="19" >RJ</option>
                                            <option value="20" >RN</option>
                                            <option value="21" >RO</option>
                                            <option value="22" >RR</option> 
                                            <option value="23" >RS</option>  
                                            <option value="24" >SC</option>  
                                            <option value="25" >SE</option>  
                                            <option value="26" >SP</option>  
                                            <option value="27" >TO</option> 
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cidade
                                    </td>
                                    <td>
                                       <select id="cidade" required>
                                            <option value="" >Selecione uma Cidade</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                <input type="text" id="cidadeHidden" name="Cidade" value="${cliente.cidade_cliente}" maxlength="100" hidden required />
                                <input type="text" id="ufHidden" name="UF" value="${cliente.uf_cliente}" maxlength="2" hidden required />
                                 
                                <tr>
                                    <td>
                                        <%--<input type="submit" name="action" class="btn btn-danger" formaction="ClientesServlet?action=list" value="Cancelar">--%>
                                    </td>
                                    <td>
                                        <%-- Ao pressionar Alterar, deve-se submeter para ClientesServlet?action=update.--%> 
                                       <input type="submit" name="action" class="btn btn-primary" formaction="ClientesServlet?action=update" value="Alterar">
                                    </td>
                                </tr>
                        </table>
                    </form>
                </div>

                <br/>
                <footer align="center">Em caso de problemas contactar o administrador: 
                E-mail: ${configuracao.email}
            </c:if>
       </c:if>
        <c:if test="${empty sessionScope.loginBean}" >                
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema." scope="request" />         
            <jsp:forward page="Erro.jsp" />
        </c:if>   
    </body>
</html>
