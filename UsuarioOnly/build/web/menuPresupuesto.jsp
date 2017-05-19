<%-- 
    Document   : menuPresupuesto
    Created on : 18-may-2017, 22:22:44
    Author     : Sergio
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
            </div>
        </section>
    </body>
</html>
<%@include file="footer.jsp" %>