/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CarritoDB;
import model.Usuario;
import model.UsuarioDB;

/**
 *
 * @author anthony
 */
@WebServlet(name = "Controlador_Login", urlPatterns = {"/Controlador_Login"})
public class Controlador_Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        
        String contenido_mensaje="Bienvenido";
        String alerta = " ";
        Usuario usuario=null;
         usuario = UsuarioDB.buscarUsuario(correo, clave);
         if(usuario!=null){
             int idcarrito = CarritoDB.buscarIdCarrito(usuario.getIdusuario());
             
             HttpSession session = request.getSession();
            session.setAttribute("idusuario", usuario);
            session.setAttribute("imagen_usuario", usuario.getImagen());
             System.out.println("Imagen del Usuario: "+usuario.getImagen());
            session.setAttribute("codigousuario", usuario.getIdusuario());
            session.setAttribute("codigocarrito", idcarrito);
            session.setAttribute("nombreusuario", usuario.getNombre());
            session.setAttribute("sesion_activa", "sesion");
            session.setAttribute("boton_carrito", "agregar");
            contenido_mensaje = "Bienvenido: "+usuario.getNombre();
            request.setAttribute("mensaje", "mostrar");
            request.setAttribute("boton_carrito", "agregar");
         }
         else{
             alerta="incorrecto";
         }
         request.setAttribute("contenido_mensaje", contenido_mensaje);
         request.setAttribute("alerta", alerta);
         
         request.getRequestDispatcher("vista/login.jsp").forward(request, response);

            
         
         
         /*HttpSession session = request.getSession();
         session.setAttribute("idusuario", idusuario);
         session.setAttribute("nombreusuario", nombre);*/
            /*request.getRequestDispatcher("${pageContext.request.contextPath}/vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
          /*  request.getRequestDispatcher("vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
   
        
          
            
            
          }
 }