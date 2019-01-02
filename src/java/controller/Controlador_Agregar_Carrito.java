/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
@WebServlet(name = "Controlador_Agregar_Carrito", urlPatterns = {"/Controlador_Agregar_Carrito"})
public class Controlador_Agregar_Carrito extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        int codProducto = Integer.parseInt(request.getParameter("codProducto"));
        System.out.println("BIEEEEEEN");
        System.out.println("BIEEEEEEN");
        System.out.println("BIEEEEEEN");
        System.out.println("BIEEEEEEN");
        
        Producto producto = null;
        producto = ProductoDB.buscarProducto(codProducto);
        
        if(producto!=null){
            HttpSession session = request.getSession();
            session.setAttribute("producto1", producto); 
            System.out.println("BIEN POR AQUI");
            /*request.getRequestDispatcher("${pageContext.request.contextPath}/vista/Vista_Agregar_Carrito.jsp").forward(request, response);*/
            request.getRequestDispatcher("vista/Vista_Agregar_Carrito.jsp").forward(request, response);
        }
        else{
            System.out.println("Error");
        }
         
        
        


       
        

        //Esta línea se usa cuando no se envía
        // información al jsp:
        // response.sendRedirect("index.jsp");
        //Ya no se necesita hacer más
    }
}
