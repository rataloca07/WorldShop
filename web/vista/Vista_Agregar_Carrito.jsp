<%-- 
    Document   : Vista_Agregar_Carrito
    Created on : 15/12/2018, 12:04:53 AM
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="${pageContext.request.contextPath}/css/estilos_agregar_carrito.css" rel="stylesheet" type="text/css"/>
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

        <title>Sistema WorldShop</title>
    </head>
    <body>
        <header id="logo-principal">
            <div id="logo" >
                <a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?accion=redireccionar">
                    WORLD<span>SHOP</span></a>
            </div>
            <div id="menu-principal">
                <ul>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?accion=redireccionar">INICIO</a></li>
                    <li><a class="menus-principal" href="vista/promociones.jsp">PROMOCIONES</a></li>
                    <li><a class="menus-principal" href="vista/comprar.jsp">COMPRAR</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="vista/login.jsp">LOGIN</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="vista/registro.jsp">REGISTRO</a></li>
                    <li class="a${sesion_activa}"><a class="menus-principal" href="vista/carrito.jsp"><i class="fas fa-shopping-cart"><span> Carrito</span></i></a></li>
                    <li class="a${sesion_activa}" ><a  class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio">USUARIO: <span>${nombreusuario}</span></a>
                        <ul>
                      <li><a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?sesion=cerrar">Cerrar sesión</a></li>
                    </li>
                   <!-- <li><a class="menus-principal" href="vista/proveedores.jsp">PROVEEDORES</a></li>-->

                </ul>
            </div>
        </header>
        <section>
            <article class="fondo-agregar-carrito">
                <div id="contenedor-agregar-carrito">
                    <div id='contenedor-imagen-carrito'>
                        <div id="marco-imagen-carrito">
                            <img src="${producto1.url}">
                        </div>
                    </div>
                    <div id="marco-detalles-carrito">
                        <form action="${pageContext.request.contextPath}/Controlador_Carrito" method="post">
                            <input name="codigo_producto" type="hidden" value="${producto1.idproducto}" >
                            <p id="nombre">${producto1.nombre}</p>
                            <p id="descripcion">Descripción:</p>
                            <p id="descripcion-dato">${producto1.descripcion}</p>
                            <p id="precio">S/.${producto1.precio}</p>
                            <div id="cantidad">
                                <label>Cantidad: </label>
                                <input name="cantidad" value="1" type="number" min="1">
                            </div>
                            <button id="enviar"  type="submit" class="fas fa-cart-plus"><span>  Agregar</span></button>
                            <a href="${pageContext.request.contextPath}/vista/inicio.jsp" id="regresar" class="fas fa-arrow-circle-left"><span>  Regresar</span></a>
                        </form>
                    </div>
                   </div>
            </article>



        </section>


        <footer>
            <div id="footer-contenedor">
                <div id="footer-izq">
                    <div class="footer-enlaces" id="contacto">

                        <a href="#">Blog</a>
                        <a href="#">FAQs</a>
                        <a href="#">Contáctanos</a> 

                    </div>
                    <div id="derechos">
                        <p>&copy;2018 todos los derechos reservados por WorldShop</p>

                    </div>
                </div>
                <div id="footer-der">
                    <div class="footer-enlaces" id="redes">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-skype"></i></a>
                        <a href="#"><i class="fab fa-pinterest"></i></a>
                    </div>

                </div>

            </div>
        </footer>
    </body>
</html>
