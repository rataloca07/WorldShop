<%-- 
    Document   : prueba
    Created on : 20/12/2018, 11:26:48 PM
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/estilos_carrito.css" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <link href='//fonts.googleapis.com/css?family=Montserrat:thin,extra-light,light,100,200,300,400,500,600,700,800' 
              rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" 
              integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" 
              crossorigin="anonymous">
        <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <title>JSP Page</title>
    </head>
    <body>
       <div class="respuesta-contenido">
                <div id="imagen-fondo">
                    <div style="background-image: url(${producto_carrito.url})"></div>
                </div>
                <div id="nombre-producto">
                    ${producto_carrito.nombre}
                </div>
                <div id="descripcion-producto">
                    Descripción:
                </div>
                <div id="descripcion-producto-contenido">
                    ${producto_carrito.descripcion}
                </div>
                <p id="cantidadd">
                <span>Cantidad: </span>
                <input type="number" id="cantidad-producto" min="1" value="${producto_carrito.cantidad}">
                </p>
                <button href="${pageContext.request.contextPath}/index.jsp" id="regresar" class="fas fa-times-circle">
                    <span>Cancelar</span>
                </button>
                <button href="${pageContext.request.contextPath}/index.jsp" id="guardar" class="fas fa-save">
                    <span>Guardar</span>
                </button>
               
            </div>
                    <script src="${pageContext.request.contextPath}/js/refrescar_tabla.js">

        </script>
    </body>
</html>
