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
                <h1><span class="label label-success">Comentarios</span></h1><br>
                <c:if test="${!empty ObraActual.getComentarios()}">
                    <c:forEach items="${ObraActual.getComentarios()}" var="comentario">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"> <span class="label label-secondary">Usuario: </span>${comentario.getUsuario().getNombres()}</h3>
                            </div>
                            <div class="panel-tittle" style="color:black">
                                <h3><span class="label label-secondary" style="color:black">Puntuacion: </span>${comentario.getPuntuacion()}</h3>
                            </div>
                            <div class="panel-body" style="color:black">
                                ${comentario.getDescripcion()} 
                            </div>
                        </div>
                    </c:forEach>

                </c:if>
            </div>
        </section>
    </body>
    <%@include file="footer.jsp" %>
</html>