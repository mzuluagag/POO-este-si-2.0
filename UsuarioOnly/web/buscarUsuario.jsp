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
        <title>Desvararte-Buscar usuarios</title>
    </head>

    <body style=" color: #000; background-image:url(img3_1.jpg);">
        <div class="container">
            <form method ="GET" action="./buscarUsuario" style="margin-bottom: 2em;">
                <div class="navbar-form">
                    <input type="text" class="form-control" style='width:250px' placeholder="Ingrese el ID del usuario a buscar" name="id">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
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

                    </c:otherwise>    
                </c:choose>

            </form>





            <form method ="GET" action="./buscarNombre" style="margin-bottom: 2em;">
                <div class="navbar-form">
                    <input type="text" class="form-control" style='width:275px' placeholder="Ingrese el nombre del usuario a buscar" name="nombre">
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
                <div class="container" ALIGN="center" style="margin-top: -2em;">
                    <c:choose>
                        <c:when test="${!empty resultados}">
                            <div class="container" ALIGN="center">
                                   <table class="table  table-bordered">
                                    <tr class="danger" >
                                        <th width="120">ID</th>
                                        <th width="120">Nombre</th>
                                        <th width="120">Apellidos</th>
                                        <th width="120">Sobrenombre</th>
                                        <th width="120">Rol</th>
                                    </tr>
                                       <c:forEach items="${resultados}" var="user">
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

            </form>
        </div>
    </body>

</html>
<%@include file="footer.jsp"%>