<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="configuracao" class="beans.ConfigBean" scope="application" />
<footer style="position: absolute; bottom: 0; height: 50px;">Em caso de problemas, contacte o administrador: ${configuracao.email}</footer>
