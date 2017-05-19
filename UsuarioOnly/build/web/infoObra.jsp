<%-- 
    Document   : infoObra
    Created on : 12-may-2017, 3:19:19
    Author     : ASUS
--%>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body  style=" color: #ffffff; background-image:url(img4.jpg);">
        <c:choose>
            <c:when test="${!usuarioActual.getArticulos().containsKey(ObraActual.getId())}">

                <section class="main container">
                    <div class="row">
                        <c:if test="${!empty ObraActual}">
                            <section class="posts col-md-8" style="">
                                <article class="post clearfix">
                                    <a href="${ObraActual.getImagen()}" class="pull-left cll" style="border-style: solid; border-color: #ffffff">
                                        <img class="img-responsive"  src="${ObraActual.getImagen()}" />
                                    </a>
                                </article>
                            </section>

                            <aside class="col-md-4" style="padding-bottom: 10px;">
                                <div  class="center-block" >
                                    <h1><span style="border-style: solid; padding: 2px; ">Informacion</span></h1><br>

                                    <h3 ><span class="label label-primary">Titulo:</span> ${ObraActual.getNombre()}</h3>
                                    <h3 ><span class="label label-primary">Autor:</span> ${ObraActual.getArtista().getNombres()}</h3>
                                    <h3 ><span class="label label-primary">Precio:</span> ${ObraActual.getPrecio()}</h3>
                                    <h3 ><span class="label label-primary">Descripcion:</span><br>${ObraActual.getDescripcion()}</h3>
                                </div>
                            </aside>
                        </c:if>
                    </div>
                    <div>
                        <c:choose>
                            <c:when test="${usuarioActual.getPresupuesto() >= ObraActual.getPrecio()}">
                                <form method="POST" action="./comprarArticulo">
                                    <input type="submit" class="btn btn-success btn-large" value="Comprar"/>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" class="btn btn-success btn-large disabled" value="Comprar"/>
                            </c:otherwise>

                        </c:choose>
                    </div>
                    <div class="stars">               
                        <form method="POST" action="./agregarComentario">   
                            <input class="star star-5" id="star-5" type="radio" name="s5"/>
                            <label class="star star-5" for="star-5"></label>

                            <input class="star star-4" id="star-4" type="radio" name="s4"/>

                            <label class="star star-4" for="star-4"></label>

                            <input class="star star-3" id="star-3" type="radio" name="s3"/>

                            <label class="star star-3" for="star-3"></label>

                            <input class="star star-2" id="star-2" type="radio" name="s2"/>

                            <label class="star star-2" for="star-2"></label>

                            <input class="star star-1" id="star-1" type="radio" name="s1"/>

                            <label class="star star-1" for="star-1"></label>
                            <div class="form">
                                <textarea class="form-control" rows="4"name="descripcion" placeholder="Comenta aca" style="color:black; margin-bottom: 5px;width: 500px"></textarea>
                                <button class="btn btn-primary" type="submit" style=" margin-left: 1px">Comentar</button>
                            </div>


                        </form>

                    </div>
                    <div>
                        <h1><span class="label label-success">Puntuacion promedio</span><h1>${ObraActual.setPuntuacion()}${ObraActual.getPuntuacion()}<br>
                                <h1><span class="label label-success">Comentarios</span></h1><br>
                                <c:if test="${!empty ObraActual.getComentarios()}">
                                    <c:forEach items="${ObraActual.getComentarios()}" var="comentario">
                                        <c:choose>
                                            <c:when test="${cambioColor==true}">
                                                <div class="panel panel-primary" style="background-color:#0C0F1F">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title"> <span class="label label-secondary">Usuario: </span>${comentario.getUsuario().getNombres()}</h3>
                                                    </div>
                                                    <div class="panel-tittle" >
                                                        <h3><span class="label label-secondary" >Puntuacion: </span>${comentario.getPuntuacion()}</h3>
                                                    </div>
                                                    <div class="panel-body" >
                                                        ${comentario.getDescripcion()} 
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="panel panel-primary" style="background-color:#1C2142">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title"> <span class="label label-secondary">Usuario: </span>${comentario.getUsuario().getNombres()}</h3>
                                                    </div>
                                                    <div class="panel-tittle" >
                                                        <h3><span class="label label-secondary" >Puntuacion: </span>${comentario.getPuntuacion()}</h3>
                                                    </div>
                                                    <div class="panel-body" >
                                                        ${comentario.getDescripcion()} 
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${cambioColor=!cambioColor}">

                                        </c:if>
                                    </c:forEach>

                                </c:if>
                                </div>
                                </section>
                            </c:when>
                            <c:otherwise>
                                <section class="main container">
                                    <div class="row">
                                        <c:if test="${!empty ObraActual}">
                                            <section class="posts col-md-8" style="">
                                                <article class="post clearfix">
                                                    <a href="${ObraActual.getImagen()}" class="pull-left cll" style="border-style: solid; border-color: #ffffff">
                                                        <img class="img-responsive"  src="${ObraActual.getImagen()}" />
                                                    </a>
                                                </article>
                                            </section>
                                            <form method="POST" action="./editarArticulo">
                                                <aside class="col-md-4" style="padding-bottom: 10px;">
                                                    <div  class="center-block" >
                                                        <h1><span style="border-style: solid; padding: 2px; ">Informacion</span></h1><br>

                                                        <h3><span class="label label-primary"style="display:inline-block">Titulo:</span></h3><input class="form-control"type="text" name="titulo" required value=" ${ObraActual.getNombre()}">
                                                        <h3 ><span class="label label-primary">Autor:</span> ${ObraActual.getArtista().getNombres()}</h3>
                                                        <h3><span class="label label-primary"style="display:inline-block">Precio:</span></h3><input class="form-control " type="text" name="precio" required value="${ObraActual.getPrecio()}">
                                                        <h3><span class="label label-primary"style="display:inline-block">Descripcion:</span></h3><input class="form-control " type="text" name="descripcion" value="${ObraActual.getDescripcion()}">
                                                        <button class="btn btn-primary" type="submit" style=" margin-left: 1px">Guardar cambios</button>
                                                    </div>
                                                </aside>
                                            </form>
                                        </c:if>
                                    </div>
                                    <div>
                                        <h1><span class="label label-success">Puntuacion promedio</span><h1>${ObraActual.setPuntuacion()}${ObraActual.getPuntuacion()}<br>
                                                <h1><span class="label label-success">Comentarios</span></h1><br>
                                                <c:if test="${!empty ObraActual.getComentarios()}">
                                                    <c:forEach items="${ObraActual.getComentarios()}" var="comentario">
                                                        <c:choose>
                                                            <c:when test="${cambioColor==true}">
                                                                <div class="panel panel-primary" style="background-color:#0C0F1F">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title"> <span class="label label-secondary">Usuario: </span>${comentario.getUsuario().getNombres()}</h3>
                                                                    </div>
                                                                    <div class="panel-tittle" >
                                                                        <h3><span class="label label-secondary" >Puntuacion: </span>${comentario.getPuntuacion()}</h3>
                                                                    </div>
                                                                    <div class="panel-body" >
                                                                        ${comentario.getDescripcion()} 
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="panel panel-primary" style="background-color:#1C2142">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title"> <span class="label label-secondary">Usuario: </span>${comentario.getUsuario().getNombres()}</h3>
                                                                    </div>
                                                                    <div class="panel-tittle" >
                                                                        <h3><span class="label label-secondary" >Puntuacion: </span>${comentario.getPuntuacion()}</h3>
                                                                    </div>
                                                                    <div class="panel-body" >
                                                                        ${comentario.getDescripcion()} 
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${cambioColor=!cambioColor}">

                                                        </c:if>
                                                    </c:forEach>

                                                </c:if>
                                                </div>
                                                </section>
                                            </c:otherwise>
                                        </c:choose>


                                        </body>
                                        <%@include file="footer.jsp" %>
                                        </html>