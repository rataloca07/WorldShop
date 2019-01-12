<%-- 
    Document   : inicio
    Created on : 05/01/2019, 03:10:15 PM
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<%@ page import="model.ProductoDB , model.Producto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/estilos1.css" rel="stylesheet" type="text/css"/>
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
                <a class="menus-principal" href="${pageContext.request.contextPath}/vista/inicio.jsp">
                    WORLD<span>SHOP</span></a>
            </div>
            <div id="menu-principal">
                <ul>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/vista/inicio.jsp">INICIO</a></li>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/vista/promociones.jsp">PROMOCIONES</a></li>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/vista/comprar.jsp">COMPRAR</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="${pageContext.request.contextPath}/vista/login.jsp">LOGIN</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="${pageContext.request.contextPath}/vista/registro.jsp">REGISTRO</a></li>
                    <li class="a${sesion_activa}"><a class="menus-principal" href="${pageContext.request.contextPath}/Controlador_Carrito?accion=listar"><i class="fas fa-shopping-cart"><span> Carrito</span></i></a></li>
                    <li class="a${sesion_activa}" ><a  class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio">USUARIO: <span>${nombreusuario}</span></a>
                        <ul>
                            <li><a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?accion=perfil">Perfil</a></li>
                            <li><a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?accion=cerrar_sesion">Cerrar sesión</a></li>

                            <!-- <li><a class="menus-principal" href="vista/proveedores.jsp">PROVEEDORES</a></li>-->

                        </ul>
                    </li>
                    <li id="usuario-imagen" class="a${sesion_activa}" ><div  class="menus-principal"><div class="fondo-imagen-usuario" style="background-image:url(${imagen_usuario})"> </div> </div></li>
                </ul>
            </div>
        </header>
        <section id="banner">
            <article id="temporada-fondo" style= "background-image:url(${pageContext.request.contextPath}/img/temporada.jpg)">
                <div id="temporada">
                    <div id="temporada-nombre">VERANO / INVIERNO COLECCIÓN 2018</div>
                    <div id="temporada-descuento">Descuento de<br>hasta 30%</div>
                    <button id="boton-temporada">COMPRAR AHORA</button>
                </div>

            </article>
            <article id="categorias-fondo">
                <div id="categorias-contenedor">
                    <div class="categorias-paneles" style= "background-image:url(${pageContext.request.contextPath}/img/mujeres.jpg)">
                        <button class="boton-categoria">MUJERES</strong></button>
                    </div>
                    <div class="categorias-paneles" style= "background-image:url(${pageContext.request.contextPath}/img/accesorios.jpg)">
                        <button class="boton-categoria">ACCESORIOS</button>
                    </div>
                    <div class="categorias-paneles" style= "background-image:url(${pageContext.request.contextPath}/img/hombres.jpg)">
                        <button class="boton-categoria">HOMBRES</button>
                    </div>
                </div>
            </article>
            <article id="modelos-fondo">
                <div>
                    Nuevos modelos
                </div>
                <div>
                </div>
            </article>
                        <audio src="https://firebasestorage.googleapis.com/v0/b/worldshop-7d480.appspot.com/o/musica%2FBios%20Rearranged.mp3?alt=media&token=5683882e-b674-447e-8986-707e8e6c7fd8" 
                               controls>
                            
                        </audio>
            <article id="modelos-menu-fondo">
                <div class="modelos-menu-botones">
                    <button class="modelos-boton-enlace" id="seleccionado"  onclick="llamada(this)"><div class="modelos-boton" >TODOS</div></button>
                    <button class="modelos-boton-enlace"  id="nada"  onclick="llamada(this)"><div class="modelos-boton" >MUJERES</div></button>
                    <button class="modelos-boton-enlace" id="nada"  onclick="llamada(this)"><div class="modelos-boton" >ACCESORIOS</div></button>
                    <button class="modelos-boton-enlace"  id="nada"  onclick="llamada(this)"><div class="modelos-boton" >HOMBRES</div></button>

                </div>
                <div class="modelos-nuevos-contenedor todos" id="activo">
                    <c:choose>
                        <c:when test="${productos_Todos!=null}"> 
                            <c:forEach var="producto_Todos" items="${productos_Todos}"> 
                    <div class="modelos-nuevos">
                                    <div class="producto">
                                        <div id="marco">
                                            <img src="${producto_Todos.getUrl()}">
                                        </div>
                                        <p class="nombre-producto-nuevo">${producto_Todos.getNombre()}</p>
                                        <p class="precio-producto-nuevo">S/ ${producto_Todos.getPrecio()}</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/Controlador_Agregar_Carrito?codProducto=${producto_Todos.getIdproducto()}" class="${boton_carrito}">AGREGAR AL CARRITO</a>
                                </div>
                    </c:forEach> 
                        </c:when> 
                        <c:otherwise>
                            <h2>PRODUCTOS NO ENCONTRADOS</h2>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="modelos-nuevos-contenedor mujeres" id="inactivo">
                   <c:choose>
                        <c:when test="${productos_Mujeres!=null}"> 
                            <c:forEach var="producto_Mujeres" items="${productos_Mujeres}"> 
                    <div class="modelos-nuevos">
                                    <div class="producto">
                                        <div id="marco">
                                            <img src="${producto_Mujeres.getUrl()}">
                                        </div>
                                        <p class="nombre-producto-nuevo">${producto_Mujeres.getNombre()}</p>
                                        <p class="precio-producto-nuevo">S/ ${producto_Mujeres.getPrecio()}</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/Controlador_Agregar_Carrito?codProducto=${producto_Mujeres.getIdproducto()}" class="${boton_carrito}">AGREGAR AL CARRITO</a>
                                </div>
                    </c:forEach> 
                        </c:when> 
                        <c:otherwise>
                            <h2>PRODUCTOS NO ENCONTRADOS</h2>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="modelos-nuevos-contenedor accesorios" id="inactivo">
                    <c:choose>
                        <c:when test="${productos_Accesorio!=null}"> 
                            <c:forEach var="producto_Acc" items="${productos_Accesorio}"> 
                                <div class="modelos-nuevos">
                                    <div class="producto">
                                        <div id="marco">
                                            <img src="${producto_Acc.getUrl()}">
                                        </div>
                                        <p class="nombre-producto-nuevo">${producto_Acc.getNombre()}</p>
                                        <p class="precio-producto-nuevo">S/ ${producto_Acc.getPrecio()}</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/Controlador_Agregar_Carrito?codProducto=${producto_Acc.getIdproducto()}" class="${boton_carrito}">AGREGAR AL CARRITO</a>
                                </div>
                            </c:forEach> 
                        </c:when> 
                        <c:otherwise>
                            <h2>PRODUCTOS NO ENCONTRADOS</h2>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="modelos-nuevos-contenedor hombres" id="inactivo">
                    <c:choose>
                        <c:when test="${productos_Hombres!=null}"> 
                            <c:forEach var="producto_Hombres" items="${productos_Hombres}"> 
                                <div class="modelos-nuevos">
                                    <div class="producto">
                                        <div id="marco">
                                            <img src="${producto_Hombres.getUrl()}">
                                        </div>
                                        <p class="nombre-producto-nuevo">${producto_Hombres.getNombre()}</p>
                                        <p class="precio-producto-nuevo">S/ ${producto_Hombres.getPrecio()}</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/Controlador_Agregar_Carrito?codProducto=${producto_Hombres.getIdproducto()}" class="${boton_carrito}">AGREGAR AL CARRITO</a>
                                </div>
                            </c:forEach> 
                        </c:when> 
                        <c:otherwise>
                            <h2>PRODUCTOS NO ENCONTRADOS</h2>
                        </c:otherwise>
                    </c:choose>
                </div>

            </article>
            <article>
                <div id="oferta-semana" >
                    <div id="contenedor-imagen-oferta">
                        <img src="https://sandrasc3.github.io/proyectoVentas/assets/images/model3.png">
                    </div>
                    <div id="contenedor-tiempo-oferta">
                        <div>
                            <div id="nombre-oferta-semana">Oferta de la semana</div>
                            <div id="barrita"></div>
                            <div id="reloj">
                                <div class="numeros-contenedor">
                                    <div class="contenedor-num">
                                        <div class="numeros">2</div>
                                        <div class="unidades">Días</div>
                                    </div>
                                </div>
                                <div class="numeros-contenedor">
                                    <div class="contenedor-num">
                                        <div class="numeros">23</div>
                                        <div class="unidades">Horas</div>
                                    </div>
                                </div>
                                <div class="numeros-contenedor">
                                    <div class="contenedor-num">
                                        <div class="numeros">55</div>
                                        <div class="unidades">Minutos</div>
                                    </div>
                                </div>
                                <div class="numeros-contenedor">
                                    <div class="contenedor-num">
                                        <div class="numeros">26</div>
                                        <div class="unidades">Sec</div>
                                    </div>
                                </div>
                            </div>
                            <button id="boton-oferta">COMPRAR AHORA</button>

                        </div>
                    </div>

                </div>
            </article>
            <article>
                <div id="seccionRecargar">

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
        <script src="${pageContext.request.contextPath}/js/principal.js" type="text/javascript"></script>

    </body>
</html>
