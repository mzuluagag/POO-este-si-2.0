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
        <title>Rankings</title>
    </head>

    <body  style=" color: #000; background-image:url(img3_1.jpg);">
        <section class="main container">
            <div class="row">
                <aside class="col-md-3" style="padding-bottom: 10px;float:right">
                    <div class="list-group">
                        <a class="list-group-item active">Menu</a>
                        <a href="./mostrarUsuarios.jsp" class="list-group-item">Ver usuarios</a> <!-- disabled = true -->
                        <a href="./buscarUsuario.jsp" class="list-group-item" style="">Buscar usuario</a>
                        <c:if test="${usuarioActual.getRol() == 'Artista'}">
                            <a href="./menuObra.jsp" class="list-group-item">Publicar obra</a>
                            <a href="./obras.jsp" class="list-group-item">Mis obras</a>
                        </c:if>
                        <a href="./buscarObra.jsp" class="list-group-item">Buscar obra</a>
                        <a href="./rankings.jsp" class="list-group-item">Rankings</a>
                        <a href="./menuPresupuesto.jsp" class="list-group-item">Recargar presupuesto</a>
                    </div>
                    <h4>Articulos recientes</h4>
                    <c:if test="${!empty Obras}">
                        <c:forEach items="${Obras}" var="obra">
                            <a href="infoObra?id=${obra.value.getId()}" class="list-group-item">
                                <h4 class="list-group-item-heading">${obra.value.getNombre()}</h4>
                                <p class="list-group-item-text">${obra.value.getArtista().getNombres()}</p>
                            </a>
                        </c:forEach>
                    </c:if>
                </aside>
                <form method ="POST" action="./rankingReputacion" style="margin-bottom: 2em;">
                    <div class="navbar-form">

                        <button type="submit" class="btn btn-primary">
                            <span>Ranking de artistas por reputacion</span>
                        </button>
                    </div>
                    <div class="container" ALIGN="center" style="margin-top: -2em;">
                        <c:choose>
                            <c:when test="${!empty rankingArtistas}">
                                <div class="container" ALIGN="center">
                                       <table class="table  table-bordered">
                                        <tr class="danger" >
                                            <th width="120">ID</th>
                                            <th width="120">Nombre</th>
                                            <th width="120">Sobrenombre</th>
                                            <th width="120">E-mail</th>
                                            <th width="120">Reputacion</th>
                                        </tr>
                                           <c:forEach items="${rankingArtistas}" var="user">
                                                <tr>
                                                <td width="120"><a href="./buscarUsuario?id=${user.getId()}">${user.getId()}</a></td>
                                                <td width="120">${user.getNombres()}</td>
                                                <td width="120">${user.getSobrenombre()}</td>
                                                <td width="120">${user.getEmail()}</td>
                                                <td width="120">${user.getReputacion()}</td>

                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:when>

                        </c:choose>
                    </div>

                </form>
                <form method ="POST" action="./rankingPuntuacion" style="margin-bottom: 2em;">
                    <div class="navbar-form">

                        <button type="submit" class="btn btn-primary">
                            <span>Ranking de obras por puntuacion</span>
                        </button>
                    </div>
                    <div class="container" ALIGN="center" style="margin-top: -2em;">
                        <c:choose>
                            <c:when test="${!empty rankingPuntuacion}">
                                <div class="container" ALIGN="center">
                                       <table class="table  table-bordered">
                                        <tr class="danger" >
                                            <th width="120">ID</th>
                                            <th width="120">Titulo</th>
                                            <th width="120">Autor</th>
                                            <th width="120">Puntuacion promedio</th>
                                            <th width="120">Fecha de publicacion</th>
                                            <th width="120">Precio</th>
                                        </tr>
                                           <c:forEach items="${rankingPuntuacion}" var="user">
                                                <tr>
                                                <td width="120"><a href="./infoObra?id=${user.getId()}">${user.getId()}</a></td>
                                                <td width="120">${user.getNombre()}</td>
                                                <td width="120"><a href="./buscarUsuario?id=${user.getArtista().getId()}">${user.getArtista().getNombres()}</a></td>
                                                <td width="120">${user.getPuntuacion()}</td>
                                                <td width="120">${user.getFechaPublicacion()}</td>
                                                <td width="120">${user.getPrecio()}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:when>

                        </c:choose>
                    </div>

                </form>
                <form method ="POST" action="./rankingPrecio" style="margin-bottom: 2em;">
                    <div class="navbar-form">

                        <button type="submit" class="btn btn-primary">
                            <span>Ranking de obras por precio</span>
                        </button>
                    </div>
                    <div class="container" ALIGN="center" style="margin-top: -2em;">
                        <c:choose>
                            <c:when test="${!empty rankingPrecio}">
                                <div class="container" ALIGN="center">
                                       <table class="table  table-bordered">
                                        <tr class="danger" >
                                            <th width="120">ID</th>
                                            <th width="120">Titulo</th>
                                            <th width="120">Autor</th>
                                            <th width="120">Puntuacion promedio</th>
                                            <th width="120">Fecha de publicacion</th>
                                            <th width="120">Precio</th>
                                        </tr>
                                           <c:forEach items="${rankingPrecio}" var="user">
                                                <tr>
                                                <td width="120"><a href="./infoObra?id=${user.getId()}">${user.getId()}</a></td>
                                                <td width="120">${user.getNombre()}</td>
                                                <td width="120"><a href="./buscarUsuario?id=${user.getArtista().getId()}">${user.getArtista().getNombres()}</a></td>
                                                <td width="120">${user.getPuntuacion()}</td>
                                                <td width="120">${user.getFechaPublicacion()}</td>
                                                <td width="120">${user.getPrecio()}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:when>

                        </c:choose>
                    </div>

                </form>


            </div>
        </section>
    </body>

</html>
<%@include file="footer.jsp" %>
