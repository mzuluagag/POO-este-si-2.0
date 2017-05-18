<%-- 
    Document   : menuUsuario
    Created on : 11-may-2017, 14:40:33
    Author     : ASUS
ur_body_back.jpg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style=" color: #000; background-image:url(img3_1.jpg);" >
        <section class="main container">
            <div class="row">
                <section class="posts col-md-9">
                    <c:if test="${!empty Obras}">
                        <c:forEach items="${Obras}" var="obra">
                            <article class="post clearfix">
                                <a href="#" class="thumb pull-left">
                                    <img class="img-thumbnail" src="${obra.value.getImagen()}" />
                                </a>
                                <h2 class="post-title">
                                    <a href="#">${obra.value.getNombre()}</a>
                                </h2>
                                <p><span>${obra.value.getFechaPublicacion()}</span> by <span>${obra.value.getArtista().getNombres()}</span></p>
                                <p class="text-justify">
                                    ${obra.value.getDescripcion()}
                                </p>
                                <div class="contenedor-botones">
                                    <form method ="GET" action="./infoObra">
                                        <button href="#" class="btn btn-primary" name="id" value="${obra.value.getId()}">Leer mas</button>
                                        <a class="btn btn-success" >Comentarios <span class="badge">${obra.value.comentarios.size()}</span></a>
                                    </form>
                                </div>
                            </article>
                        </c:forEach>
                    </c:if>
                </section>

                <aside class="col-md-3" style="padding-bottom: 10px;">
                    <div class="list-group">
                        <a class="list-group-item active">Menu</a>
                        <a href="./mostrarUsuarios.jsp" class="list-group-item">Ver usuarios</a> <!-- disabled = true -->
                        <a href="./buscarUsuario.jsp" class="list-group-item" style="">Buscar usuario</a>
                        <a href="./menuObra.jsp" class="list-group-item">Publicar obra</a>
                        <a href="./editarObra.jsp" class="list-group-item">Editar obra</a>
                        <a href="./buscarObra.jsp" class="list-group-item">Buscar obra</a>
                        <a href="./rankings.jsp" class="list-group-item">Rankings</a>
                    </div>
                    <h4>Articulos recientes</h4>
                    <c:if test="${!empty Obras}">
                        <c:forEach items="${Obras}" var="obra">
                            <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">${obra.value.getNombre()}</h4>
                                <p class="list-group-item-text">${obra.value.getArtista().getNombres()}</p>
                            </a>
                        </c:forEach>
                    </c:if>
                </aside>
            </div>
        </section>
    </body>
</html>
<%@include file="footer.jsp" %>
