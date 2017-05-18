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
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <title>Desvararte-Usuarios</title>
    </head>

    <body  style=" color: #000; background-image:url(img3_1.jpg);">
        <div class="container" ALIGN="center" style="margin-top: -2em;">
            <c:choose>
                <c:when test="${!empty Usuarios}">
                    <div class="container" ALIGN="center">
                           <table class="table  table-bordered">
                                <tr class="danger" >
                                    <th width="120">ID</th>
                                    <th width="120">Nombre</th>
                                    <th width="120">Apellidos</th>
                                    <th width="120">Sobrenombre</th>
                                    <th width="120">Rol</th>
                                </tr>
                               <c:forEach items="${Usuarios}" var="user">
                                    <tr>
                                    <td width="120"><a href="./buscarUsuario?id=${user.value.getId()}">${user.value.getId()}</a></td>
                                    <td width="120">${user.value.getNombres()}</td>
                                    <td width="120">${user.value.getApellidos()}</td>
                                    <td width="120">${user.value.getSobrenombre()}</td>
                                    <td width="120">${user.value.getRol()}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <h1>
                        No hay usuarios registrados
                    </h1>
                </c:otherwise>
            </c:choose>
        </div>
    </body>

</html>
<%@include file="footer.jsp" %>