<%-- 
    Document   : perfil
    Created on : 02/01/2019, 06:37:02 PM
    Author     : anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/estilos_perfil.css" rel="stylesheet" type="text/css"/>
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
                <a class="menus-principal" href="${pageContext.request.contextPath}/index.jsp">
                    WORLD<span>SHOP</span></a>
            </div>
            <div id="menu-principal">
                <ul>
                    <li><a class="menus-principal" href="${pageContext.request.contextPath}/index.jsp">INICIO</a></li>
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
                
                <section>
                    <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/ControladorInicio?accion=modificar_perfil" >
                        
                        <p>Nombres: <input type="text" name="nombre" value="${idusuario.nombre}"></p>
                        <p>Apellidos: <input name="apellido" type="text" value="${idusuario.apellido}"></p>
                   
                        <p>Imagen: <input id="imagen" name="imagen" type="file" accept="image/*" required></p>
                        <input id="direccion" name="direccion" type="hidden" value="">
                        <br>
                        <button class="cancelar">Cancelar</button>
                        <br>
                        <div class="imagen">
                            <div class="foto" style="background-image:url(${imagen_usuario})"></div>
                        </div>
                         <input type="submit" value="Enviar">
                    </form>
                        
                       
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
        
         <script src="https://www.gstatic.com/firebasejs/5.7.2/firebase.js"></script>
         <!--  <script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>-->
          <script src="${pageContext.request.contextPath}/js/firebase.js"> </script>
      
    </body>
</html>

