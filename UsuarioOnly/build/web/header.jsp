<%-- 
    Document   : header
    Created on : 30-abr-2017, 17:38:56
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        
        <title>Desvararte</title>
    </head>    
    <header style="position:static;width:100%;">


        <nav class="navbar navbar-inverse navbar-static-top" style="background-color:blue" role="navigation">
            <div class="container">

                <div class="collapse navbar-collapse" id="navegacion-fm">
                    <ul class="nav navbar-nav ">
                        <c:choose>
                            <c:when test="${!empty usuarioActual}">
                                <li><a href="./menuUsuario.jsp">Inicio</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="./index.jsp">Inicio</a></li>
                                </c:otherwise>
                            </c:choose>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <c:choose>
                            <c:when test="${!empty usuarioActual}">
                                <li>
                                    <form method="POST" action="./cerrarSession">
                                        <button type="submit" value="Cerrar sesion">Cerrar sesion</button>

                                    </form>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="./inicioSesion.jsp">Entrar</a></li>
                                <li><a href="./registerUsuario.jsp">Registrarse</a></li>
                                </c:otherwise>
                            </c:choose>


                    </ul>

                    <!--
                                                            <form action="" class="navbar-form navbar-left" role="search">
                                                                    <div class="form-group">
                                                                            <input type="text" class="form-control" placeholder="buscar">
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary">
                                                                            <span class="glyphicon glyphicon-search"></span>
                                                                    </button>
                                                            </form>
                    -->
                </div>
            </div>
        </nav>
    </header>


</html>    

