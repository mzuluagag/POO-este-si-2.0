<%-- 
    Document   : index
    Created on : 30-abr-2017, 17:38:37
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- <meta http-equiv="Refresh" content="0; url=./inicioSesion.jsp"> -->
        <title>Desvararte</title>
    </head>
    <body >
        <div class="container" ALIGN="center" STYLE= "background-color:#DAF7A6; margin-top: -2em;">
            <br/>
            <form  action="./registerUsuario.jsp" >
                <button class="btn btn-block btn-lg btn-danger" type="submit" style='width:300px' >Registro</button><br/><br/>
            </form>
            <form action="./inicioSesion.jsp">
                <button class="btn btn-block btn-lg btn-danger" type="submit" style='width:300px' >Iniciar sesion</button><br/><br/>
            </form>
            <form  action="./buscarUsuario.jsp" >
                <input class="btn btn-block btn-lg btn-danger" type="submit" value="Buscar usuarios" style='width:300px' /><br/><br/>
            </form>
            <form  action="./mostrarUsuarios.jsp" >
                <input class="btn btn-block btn-lg btn-danger" type="submit" value="Mostrar usuarios" style='width:300px'/><br/><br/>
            </form>
            <form  method="POST" action="./dataLoader" >
                <input class="btn btn-block btn-lg btn-danger" type="submit" value="Cargar datos ficticios Usuarios" style='width:300px'/><br/><br/>
            </form>
            <form  method="POST" action="./dataLoaderM" >
                <input class="btn btn-block btn-lg btn-danger" type="submit" value="Cargar datos ficticios Obras" style='width:300px'/><br/><br/>
            </form>
            <form  method="POST" action="./dataLoaderC" >
                <input class="btn btn-block btn-lg btn-danger" type="submit" value="Cargar datos ficticios Comentarios" style='width:300px'/><br/><br/>
            </form>
        </div>
        <!--
        <section class="main container">
            <div class="row">
                <section class="posts col-md-9">
                    <div class="mip">
                        <ol class="breadcrumb">
                            <li><a href="#">first</a></li> 
                            <li><a href="#">2</a></li>
                            <li><a href="#">3t</a></li>
                        </ol>
                    </div>
                </section>
            </div>
            
            <article class="post clearfix">
                <a href="#" class="thumbnail pull-left">
                    aca va algo
                </a>
                <h2 class="post-title">
                    Titulo
                </h2>
            </article>
        </section>
        -->
    </body>

</html>
<%@include file="footer.jsp" %>