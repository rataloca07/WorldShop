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
import model.Usuario;
import model.UsuarioDB;
import model.CarritoDB;

/**
 *
 * @author anthony
 */
@WebServlet(name = "Controlador_Registro", urlPatterns = {"/Controlador_Registro"})
public class Controlador_Registro extends HttpServlet {

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

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        String clave2 = request.getParameter("clave-repeat");
        String alerta = "";
        if (clave.equals(clave2)) {
            if (UsuarioDB.buscarUsuarioCorreo(correo)==false) {
                System.out.println("entro de todas formas");
                /* HttpSession session = request.getSession();
          session.setAttribute("idusuario", usuario);*/
 /* contenido_mensaje = "Bienvenido: "+usuario.getNombre();*/
                request.setAttribute("mensaje", "mostrar");
                Usuario usuario = new Usuario(1, nombre, apellido, "usuario", correo, clave);
                UsuarioDB.registrarUsuario(usuario);
                int idusuario = UsuarioDB.buscarIdUsuario(correo, clave);
                CarritoDB.registrarCarrito(idusuario);
                int idcarrito = CarritoDB.buscarIdCarrito(idusuario);
                      
                HttpSession session = request.getSession();
                session.setAttribute("idusuario", usuario);
                //analizar el de arriba
                
                session.setAttribute("codigousuario", idusuario);
                session.setAttribute("codigocarrito", idcarrito);
                session.setAttribute("nombreusuario", usuario.getNombre());
                session.setAttribute("sesion_activa", "sesion");
                session.setAttribute("boton_carrito", "agregar");

                request.setAttribute("mensaje", "mostrar");

            } else {
                alerta = "incorrecto";
                request.setAttribute("alerta_mensaje", "Usuario ya registrado");
            }
        } else {
            alerta = "incorrecto";
            request.setAttribute("alerta_mensaje", "Las contraseñas no coinciden");
        }

        request.setAttribute("alerta", alerta);
        request.getRequestDispatcher("vista/registro.jsp").forward(request, response);
    }
}
