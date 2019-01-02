<%-- 
    Document   : carrito
    Created on : 18/12/2018, 02:35:08 PM
    Author     : anthony
--%>

<%@page import="model.DetalleCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CarritoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <!--<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>-->
        <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script> -->  


        <title>Sistema WorldShop</title>
    </head>
    <body>

        <div style="" class="respuesta" id="ventana-modal">
            <div class="respuesta-contenido">
                <div id="imagen-fondo">
                    <div></div>
                </div>
                <div id="nombre-producto">

                </div>
                <div id="descripcion-producto">
                    Descripción:
                </div>
                <div id="descripcion-producto-contenido">

                </div>
                <p id="cantidadd">
                    <span>Cantidad: </span>
                    <input type="number" id="cantidad-producto" min="1">
                </p>
                <button href="${pageContext.request.contextPath}/index.jsp" id="regresar" class="fas fa-times-circle">
                    <span>Cancelar</span>
                </button>
                <button href="${pageContext.request.contextPath}/index.jsp" id="guardar" class="fas fa-save">
                    <span>Guardar</span>
                </button>

            </div>

        </div>

        <header id="logo-principal">
            <div id="logo" >
                <a class="menus-principal" href="${pageContext.request.contextPath}/index.jsp">
                    WORLD<span>SHOP</span></a>
            </div>
            <div id="menu-principal">
                <ul>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/index.jsp">INICIO</a></li>
                    <li><a class="menus-principal" href="vista/promociones.jsp">PROMOCIONES</a></li>
                    <li><a class="menus-principal" href="vista/comprar.jsp">COMPRAR</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="vista/login.jsp">LOGIN</a></li>
                    <li class="no${sesion_activa}"><a class="menus-principal" href="vista/registro.jsp">REGISTRO</a></li>
                    <li class="a${sesion_activa}"><a class="menus-principal" href="vista/carrito.jsp"><i class="fas fa-shopping-cart"><span> Carrito</span></i></a></li>
                    <li class="a${sesion_activa}" ><a  class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio">USUARIO: <span>${nombreusuario}</span></a>
                        <ul>
                            <li><a class="menus-principal" href="${pageContext.request.contextPath}/ControladorInicio?sesion=cerrar">Cerrar sesión</a></li>
                        </ul>
                    </li>
                    <!-- <li><a class="menus-principal" href="vista/proveedores.jsp">PROVEEDORES</a></li>-->

                </ul>
            </div>
        </header>
        <section id="seccion">
            <article class="fondo-carrito" id="contenedor--tabla-carrito">
                <table id="tabla">
                    <tr id="cabecera-tabla">
                        <td class="item h">Item</td>
                        <td class="imagen h">Imagen</td>
                        <td class="nombre h">Nombre</td>
                        <td class="precio h">Precio</td>
                        <td class="cantidad h">Cantidad</td>
                        <td class="acciones h">Acciones</td>
                    </tr>


                    <% 
                        ArrayList<DetalleCarrito> detalle = (ArrayList<DetalleCarrito>) session.getAttribute("detallecarrito");

                        for (int i = 0; i < detalle.size(); i++) {

                    %>
                    <tr class="fila">
                        <td class="item c">
                            <%=(i + 1)%>
                        </td>
                        <td class="imagen c">
                            <div style="background-image:url(<%=detalle.get(i).getUrl()%>">
                            </div>
                        </td>
                        <td class="nombre c">
                            <%=detalle.get(i).getNombre()%>
                        </td>
                        <td class="precio c">
                            <%=detalle.get(i).getPrecio()%>
                        </td>
                        <td class="cantidad c">
                            <%=detalle.get(i).getCantidad()%>
                        </td>
                        <td class="acciones c">
                            <a class="modificar" href="<%=detalle.get(i).getIdproducto()%>">Modificar</a>
                            <a class="eliminar" id="<%=detalle.get(i).getIdproducto()%>">Eliminar</a>
                        </td>
                    <input id="descrip" type="hidden" value="<%=detalle.get(i).getDescripcion()%>">

                    <% }%>


                </table>

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



    <script src="${pageContext.request.contextPath}/js/refrescar_tabla.js">

    </script>

</body>
</html>
