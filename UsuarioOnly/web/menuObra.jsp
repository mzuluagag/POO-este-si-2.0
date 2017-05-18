<%-- 
    Document   : menuObra
    Created on : 12-may-2017, 1:38:01
    Author     : ASUS
--%>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  style=" color: #000; background-image:url(img3_1.jpg);">
        <div class="container" align="center" STYLE= " margin-top: 3em; margin-bottom: 3em" >
            <br>
            <div class="form" style="width:23%">
                <form method="POST" action="./menuObra" >
                    Titulo: <input class="form-control " type="text" name="titulo" required><br> </br>
                    Precio: <input class="form-control" type="text" name="precio" required><br> </br>
                    Link imagen:<input class="form-control" type="url" name="url" required><br> </br>
                    Descripcion:<textarea class="form-control" rows="6" name="descripcion"></textarea><br> </br>
                    <input class="btn btn-primary form-control" type="submit" value="Publicar" name="Confirmar">
                </form>
            </div>  
            <br>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
