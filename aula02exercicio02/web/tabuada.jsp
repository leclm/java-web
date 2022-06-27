<%-- 
    Document   : tabuada
    Created on : 26 de jun de 2022, 20:27:03
    Author     : lelim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Escreva uma JSP que mostra a tabuada do 1 ao 9, usando laços e tabela HTML -->
    </head>
    <style>
        table, tr, td {
            border: 1px solid #000;
           
        }
        tr:nth-child(even) {
            background-color:pink;
        }
        td {
            width: 100px;
            text-align: center;
        }
    </style>
    <body>
        <h1>Tabuada do 1 ao 9!</h1>
        <table>
            <tbody>
                <th colspan="10">TABUADA</th>
                <%
                    for (int i = 0; i <= 10; i++) {
                        out.println("<tr>");
                        for (int j = 1; j < 10; j++) {
                            out.println("<td>");
                            out.println(j + " x " + i + " = " + i*j);
                            out.println("</td>");
                        }                        

                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
