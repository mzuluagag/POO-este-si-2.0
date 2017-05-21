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
        <c:if test="${compra}">
            <script type="text/javascript">
                alert("Compra realizada satisfactoriamente");
            </script>    
        </c:if>    

        <section class="main container">
            <div class="row">
                <div class="col-md-9">
                    <form method="POST" action="./recargar">
                        <input style="width: 20em;float:left "class="form-control"  name="valor" type="text" placeholder="Ingrese el valor que desea recargar" required>
                        <br></br>
                        <input class="btn-success" type="submit" value="Recargar">
                    </form>
                    <c:choose>
                        <c:when test="${success}">
                            <script type="text/javascript">
                                alert("Recargar realizada satisfactoriamente");
                            </script>    
                        </c:when>

                    </c:choose>
                    <div >
                        <h2>Obras compradas</h2>
                        <p>Tu presupuesto actual es de: ${usuarioActual.getPresupuesto()}</p>            
                        <table class="table table-striped">
                            <tr class="danger">
                                <th width="80">ID</th>
                                <th width="80">Titulo</th>
                                <th width="80">Autor</th>
                                <th width="80">Precio</th>
                            </tr>
                            <c:forEach items="${usuarioActual.getObrasCompradas()}" var="obra">
                                <tr>
                                    <td ><a href="./infoObra?id=${obra.value.getId()}">${obra.value.getId()}</a></td>
                                    <td >${obra.value.getNombre()}</td>
                                    <td >${obra.value.getArtista().getNombres()}</td>
                                    <td >${obra.value.getPrecio()}</td>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <aside class="col-md-3" style="padding-bottom: 10px;">

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
                    
                </aside>
            </div>
        </section>
    </body>
</html>
<%@include file="footer.jsp" %>