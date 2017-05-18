<%-- 
    Document   : mostrarUsuarios
    Created on : 01-may-2017, 13:52:25
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <title>Desvararte-Usuarios</title>
    </head>
    <body>
        <form method="POST" action="./dataSession">
            <input type="submit" value="Mostrar usuarios">
        </form>
        <h3>Lista de usuarios</h3>
        <c:if test="${!empty Usuarios}">
               <table class="tg">
                   <tr>
                    <th width="80">ID</th>
                    <th width="120">Nombre</th>
                    <th width="120">Apellidos</th>
                    <th width="120">Sobrenombre</th>
                    <th width="120">E-mail</th>
                    <th width="120">Fecha de nacimiento</th>
                    <th width="120">Presupuesto</th>
                </tr>
                   <c:forEach items="${Usuarios}" var="user">
                           <tr>
                               <td><a href="./buscarUsuario?id=${user.getId()}">${user.getId()}</a></td>
                               <td>${user.getNombres()}</td>
                               <td>${user.getApellidos()}</td>
                        <td>${user.getSobrenombre()}</td>
                               <td>${user.getEmail()}</td>
                               <td>${user.getFechaDeNacimiento()}</td>
                               <td>${user.getPresupuesto()}</td>
                           </tr>
                    </c:forEach>
            </table>
        </c:if>
    </body>
</html>
