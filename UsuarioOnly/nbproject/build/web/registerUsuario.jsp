<%-- 
    Document   : registerUsuario
    Created on : 30-abr-2017, 17:57:37
    Author     : Sergio
--%>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <title>Desvararte- Registro</title>
    </head>
    <body>
        <form method="POST" action="./getData">
            Nombre: <input type="text" name="nombre"> <br> </br>
            Apellidos: <input type="text" name="apellidos"><br> </br>
            Sobrenombre: <input type="text" name="sobrenombre"><br> </br>
            E-mail: <input type="email" name="email"><br> </br>
            Identificación: <input type="text" name="id"><br> </br>
            Fecha de nacimiento: <input type="date" name="fdn"><br> </br>
            <input type="submit" name="Confirmar">
        </form>
        <c:if test="${!empty bienvenido}">
            <h1>${bienvenido}</h1>
        </c:if>
    </body>
    <%@include file="footer.jsp" %>
</html>
