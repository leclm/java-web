<%-- 
    Document   : meutads
    Created on : 26 de jun de 2022, 14:50:13
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu TADS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="../tarefa1/img/septufpr.png" width="25" height="25" class="d-inline-block align-text-top"  alt="SEPT UPR">
                    Meu TADS
                </a>
            </div>
        </nav>        
        <section class="my-5">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">Site</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                      <td>Claudia Bastchen</td>
                      <td><a href="https://br.pinterest.com/">Pinterest</a></td>
                    </tr>
                    <tr>
                      <td>Érica Riera</td>
                      <td><a href="https://netflix.com/">Netflix</a></td>
                    </tr>
                    <tr>
                      <td>Jackson Mardi</td>
                      <td><a href="https://www.reddit.com/">Reddit</a></td>
                    </tr>
                    <tr>
                      <td>Letícia das Chagas Lima</td>
                      <td><a href="https://twitter.com/login?lang=pt">Twitter</a></td>
                    </tr>
                    <tr>
                      <td>Luis Miguel Ismael Ferreira</td>
                      <td><a href="https://www.youtube.com/">YouTube</a></td>
                    </tr>
                    <tr>
                      <td>Nicolle da Silva Costa</td>
                      <td><a href="https://www.facebook.com/">Facebook</a></td>
                    </tr>
                  </tbody>
            </table>
        </section>
        
        <section>
            <%-- Link voltar para página Servlet--%> 
            <div class="mx-auto" style="width: 68px;">
                <a href='../tarefa1/Tarefa01' class="btn btn-dark">Voltar</a>
            </div>
        </section>
    </body>
</html>
