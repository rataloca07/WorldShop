/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author anthony
 */
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Producto;
import model.ProductoDB;
import model.Usuario;
import javax.servlet.annotation.MultipartConfig;
import model.UsuarioDB;

/**
 *
 * @author anthony
 */
@WebServlet(name = "ControladorInicio", urlPatterns = {"/ControladorInicio"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class ControladorInicio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Controlador inicio xD");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        if (request.getParameter("accion").equalsIgnoreCase("redireccionar")) {
            session.setAttribute("productos_Accesorio",ProductoDB.buscarProductoxCategoria("accesorios"));
            session.setAttribute("productos_Hombres",ProductoDB.buscarProductoxCategoria("hombres"));
            session.setAttribute("productos_Mujeres",ProductoDB.buscarProductoxCategoria("mujeres"));
            session.setAttribute("productos_Todos",ProductoDB.obtenerListaProductos());
            
            request.getRequestDispatcher("vista/inicio.jsp").forward(request, response);
        } else {
            if (request.getParameter("accion").equalsIgnoreCase("cerrar_sesion")) {
                /*request.setAttribute("boton_carrito", "nada");*/
                session.removeAttribute("boton_carrito");
                System.out.println("Antes de remover: " + session.getAttribute("nombreusuario"));
                session.removeAttribute("nombreusuario");
                session.removeAttribute("sesion_activa");

                session.removeAttribute("producto1");
                System.out.println("Despues de remover: " + session.getAttribute("nombreusuario"));
                request.getRequestDispatcher("vista/inicio.jsp").forward(request, response);
            } else {
                if (request.getParameter("accion").equalsIgnoreCase("perfil")) {
                    request.getRequestDispatcher("vista/perfil.jsp").forward(request, response);
                }
            }
        }

        /*HttpSession session = request.getSession();
         session.setAttribute("idusuario", idusuario);
         session.setAttribute("nombreusuario", nombre);*/
 /*request.getRequestDispatcher("${pageContext.request.contextPath}/vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
 /*  request.getRequestDispatcher("vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
    }

    /*@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
        maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*50)
public class FileUploadServlet extends HttpServlet {
 
}*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Controlador inicio xD");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        if (session != null) {

            if (request.getParameter("accion").equalsIgnoreCase("modificar_perfil")) {

                int id = (Integer) session.getAttribute("codigousuario");
                String url = request.getParameter("direccion");
                System.out.println("Url de nueva imagen: " + url);
                UsuarioDB.modificar_Imagen(id, url);
                session.setAttribute("imagen_usuario", url);
                request.getRequestDispatcher("vista/perfil.jsp").forward(request, response);

            } else {
                request.getRequestDispatcher("vista/inicio.jsp").forward(request, response);
            }
        } else {
            System.out.println("La sesion era NULA");
            request.getRequestDispatcher("vista/inicio.jsp").forward(request, response);
        }

    }

}
