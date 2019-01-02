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
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Producto;
import model.ProductoDB;

/**
 *
 * @author anthony
 */
@WebServlet(name = "ControladorInicio", urlPatterns = {"/ControladorInicio"})
public class ControladorInicio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Controlador inicio xD");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if (request.getParameter("sesion").equals("cerrar")) {
            /*request.setAttribute("boton_carrito", "nada");*/
            session.removeAttribute("boton_carrito");
            System.out.println("Antes de remover: " + session.getAttribute("nombreusuario"));
            session.removeAttribute("nombreusuario");
            session.removeAttribute("sesion_activa");
            
            session.removeAttribute("producto1");
            System.out.println("Despues de remover: " + session.getAttribute("nombreusuario"));
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);

        /*HttpSession session = request.getSession();
         session.setAttribute("idusuario", idusuario);
         session.setAttribute("nombreusuario", nombre);*/
 /*request.getRequestDispatcher("${pageContext.request.contextPath}/vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
 /*  request.getRequestDispatcher("vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
    }
}
