<%-- 
    Document   : registerUsuario
    Created on : 30-abr-2017, 17:57:37
    Author     : Sergio
--%>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desvararte- Registro</title>
    </head>
    <body  style=" color: #000; background-image:url(img3_1.jpg);">

        <div class="container" align="center" STYLE= " margin-top: -2em" >
            <br/>
            <div class="form" style="width:23%">
                <form method="POST" action="./getData" >
                    Nombre: <input class="form-control" type="text" name="nombre" required> <br> </br>
                    Apellidos: <input class="form-control" type="text" name="apellidos" required><br> </br>
                    Sobrenombre: <input class="form-control" type="text" name="sobrenombre" required><br> </br>
                    E-mail: <input class="form-control" type="email" name="email" required><br> </br>
                    Identificación: <input class="form-control" type="text" name="id" required><br> </br>
                    Fecha de nacimiento: <input class="form-control" type="date" name="fdn" required><br> </br>
                    Rol:&nbsp; <input type="radio"  name="rol" value="Artista" required>Artista &nbsp;&nbsp;
                    <input type="radio"  name="rol" value="Usuario" required>Usuario<br><br>
                    <input class="btn btn-primary form-control" type="submit" name="Confirmar">
                </form>
                <c:if test="${!empty bienvenido}">
                    <h1>${bienvenido}</h1>
                </c:if> 
            </div>    
            <br/>
        </div>
    </body>

    <%@include file="footer.jsp" %>
</html>
