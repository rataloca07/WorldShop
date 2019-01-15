/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CarritoDB;
import model.DetalleCarrito;
import model.Producto;
import model.ProductoDB;

/**
 *
 * @author anthony
 */
@WebServlet(name = "Controlador_Carrito", urlPatterns = {"/Controlador_Carrito"})
public class Controlador_Carrito extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* PrintWriter out = response.getWriter();*/
        System.out.println("Esta en el servlet eliminar");
        System.out.println("Esta en el servlet eliminar");
        HttpSession session = request.getSession();
        int codCarrito = (Integer) session.getAttribute("codigocarrito");

        String accion = request.getParameter("accion");
        System.out.println("La accion es: " + accion);

        if (accion.equalsIgnoreCase("listar")) {
            ArrayList<DetalleCarrito> detalle = CarritoDB.listarDetalleCarrito(codCarrito);
            session.setAttribute("detallecarrito", detalle);
            System.out.println("Acabo el servlet listar");
            request.getRequestDispatcher("vista/carrito.jsp").forward(request, response);
        } else {
            if (accion.equalsIgnoreCase("Eliminar")) {
                int idproducto = Integer.parseInt(request.getParameter("idproducto"));
                CarritoDB.eliminarDetalleCarrito(codCarrito, idproducto);
                System.out.println("Acabo el servlet eliminar");
            } else {
                if (accion.equalsIgnoreCase("Actualizar")) {
                    int idproducto = Integer.parseInt(request.getParameter("idproducto"));
                    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    CarritoDB.modificarDetalleCarrito(codCarrito, idproducto, cantidad);
                }

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        System.out.println("Paso algooo");
        HttpSession session = request.getSession();
        int codProducto = Integer.parseInt(request.getParameter("codigo_producto"));
        int codCarrito = (Integer) session.getAttribute("codigocarrito");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));


        CarritoDB.registrarDetalleCarrito(codCarrito, codProducto, cantidad);
        ArrayList<DetalleCarrito> detalle = CarritoDB.listarDetalleCarrito(codCarrito);
        session.setAttribute("detallecarrito", detalle);

        request.getRequestDispatcher("vista/carrito.jsp").forward(request, response);

    }
}
