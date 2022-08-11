<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    </head>
    <body>
        <h1 class="text-center text-danger">${msg}</h1>
        <h1 class="text-center text-danger">An error occurred: ${jspException}</h1>
        <h1 class="text-center text-danger">Status code: ${status_code}</h1>
        <h1 class="text-center text-danger">${exception.message}</h1>
        <h1 class="text-center text-danger">${pageContext.exception.message}</h1>
        <h3 class="text-center text-danger">${pageContext.out.flush()}</h3>
        <h3 class="text-center text-danger">${pageContext.exception.printStackTrace(pageContext.response.writer)}</h3>
        <br>
        <a class="btn btn-light d-flex justify-content-center" href="${redirect}">${pageName}</a>
        <%@ include file="footer.jsp" %>
    </body>
</html>