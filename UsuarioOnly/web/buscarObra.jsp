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
        <title>Desvararte-Buscar obra</title>
    </head>

    <body style=" color: #000; background-image:url(img3_1.jpg);">
        <div class="container">





            <form method ="GET" action="./buscarArticulo" style="margin-bottom: 2em;">
                <div class="navbar-form">
                    <input type="text" class="form-control" style='width:275px' placeholder="Ingrese el nombre de la obra a buscar" name="nombre">
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
                                        <th width="120">Autor</th>
                                        <th width="120">Puntuacion promedio</th>
                                        <th width="120">Fecha de publicacion</th>
                                    </tr>
                                       <c:forEach items="${resultados}" var="user">
                                            <tr>
                                            <td width="120"><a href="./infoObra?id=${user.value.getId()}">${user.value.getId()}</a></td>
                                            <td width="120">${user.value.getNombre()}</td>
                                            <td width="120">${user.value.getArtista().getNombres()}</td>
                                            <td width="120">${user.value.getPuntuacion()}</td>
                                            <td width="120">${user.value.getFechaPublicacion()}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:when>
                        
                    </c:choose>
                </div>

            </form>
        </div>
    </body>

</html>
<%@include file="footer.jsp"%>