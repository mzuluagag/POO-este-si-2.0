<%-- 
    Document   : buscarUsuario
    Created on : 30-abr-2017, 20:06:26
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <title>Desvararte-Buscar usuarios</title>
    </head>
    <body>
        <form method ="GET" action="./buscarUsuario">
            Ingrese el ID del usuario a buscar:<input type="text" name="id"><br> </br>
            <input type="submit" value="Buscar">

            <c:choose>
                <c:when test="${!empty usuario}">
                    <h4>Nombres: ${usuario.getNombres()}</h4>
                    <h4>Apellidos: ${usuario.getApellidos()}</h4>
                    <h4>Sobrenombre: ${usuario.getSobrenombre()}</h4>
                    <h4>E-mail: ${usuario.getEmail()}</h4>
                    <h4>Identificación: ${usuario.getId()}</h4>
                    <h4>Fecha de nacimiento: ${usuario.getFechaDeNacimiento()}</h4>
                    <h4>Presupuesto: ${usuario.getPresupuesto()}</h4>
                </c:when>
                <c:otherwise>
                    <h4>No se encontró el usuario</h4>
                </c:otherwise>    


            </c:choose>
        </form>
    </body>
</html>
<%@include file="footer.jsp"%>