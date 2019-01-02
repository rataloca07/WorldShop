<%-- 
    Document   : login
    Created on : 15/11/2018, 12:25:28 AM
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/estilos_login.css" rel="stylesheet" type="text/css"/>
        <link href='//fonts.googleapis.com/css?family=Montserrat:thin,extra-light,light,100,200,300,400,500,600,700,800' 
              rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" 
              integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" 
              crossorigin="anonymous">
        <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
        <title>Login</title>
    </head>
    <body>
        
        <div class="respuesta" id="${mensaje}">
            
            <div class="respuesta-contenido">
                <div id="icono-fondo">
                    <i class="far fa-check-circle"></i>
                </div>
                <div id="texto-respuesta">
                    ${contenido_mensaje}
                </div>
                <a href="${pageContext.request.contextPath}/index.jsp" id="regresar" class="fas fa-arrow-circle-left">
                    <span>Listo</span>
                </a>
               
            </div>
        </div>
        <section style= "background-image:url(https://www.okchicas.com/wp-content/uploads/2016/12/10-reglas-de-oro-que-te-har%C3%A1n-millonaria-2.jpg)">
            
            <div class="fondo-formulario">
                <form method="post" action="${pageContext.request.contextPath}/Controlador_Login">
                    <div id="registro">Login</div>
                    <div class="marco-logo">
                        <img src="https://sandrasc3.github.io/proyectoVentas/assets/iconos/icono.png">
                    </div>
                    <div id="nombre-empresa">WorldShop</div>
                    <p id="${alerta}">Correo y/o Contraseña incorrecto(s)</p>
                    <input class="campo" type="mail" name="correo" placeholder="Correo" required>
                    <input class="campo" type="password" name="clave" placeholder="Contraseña" required>
                    <div id="contenedor-botones">
                        <button id="enviar"  type="submit" class="fas fa-door-open"><span>  Entrar</span></button>
                        <a href="${pageContext.request.contextPath}/index.jsp" id="regresar" class="fas fa-arrow-circle-left"><span>  Regresar</span></a>
                    </div>
                    
                    <p id="redireccionar">No tienes una cuenta?   <a href="${pageContext.request.contextPath}/vista/registro.jsp" id="registrar">Registrar</a></p>
                    <!-- <input type="hidden" name="rol" value="usuario">-->
                </form>

            </div>

        </section>


    </body>
</html>
