/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.Conexion;

/**
 *
 * @author anthony
 */
public class CarritoDB {
    
    
    public static void registrarCarrito(int usuario) {
        try {
            System.out.println("Estamos en registrar carrito");
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("INSERT INTO carrito (idcarrito, idusuario, fecha) VALUES (null, ?,CURDATE()) ");
            System.out.println("Cree la sentencia");
            cl.setInt(1, usuario);
            System.out.println("Asigne, voy a ejecutar");
            cl.executeUpdate();
            System.out.println("Se creo carrito del usuario: "+usuario);
            /*JOptionPane.showMessageDialog(null, "Producto Registrado co éxito", "Registrar Usuario", JOptionPane.INFORMATION_MESSAGE);
            */ cl.close();
        } catch (SQLException e) {
            System.out.println("No se pudo crear carrito");
        }
    }
    
    public static void registrarDetalleCarrito(int idcarrito, int idproducto, int cantidad) {
        try {
            System.out.println("Estamos en registrar detalle carrito");
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("INSERT INTO detallecarrito (idcarrito, idproducto, cantidad) VALUES (?, ?,?) ");
            System.out.println("Cree la sentencia");
            cl.setInt(1, idcarrito);
            cl.setInt(2, idproducto);
            cl.setInt(3, cantidad);
            System.out.println("Asigne, voy a ejecutar");
            cl.executeUpdate();
            System.out.println("Se agrego detalle carrito");
            /*JOptionPane.showMessageDialog(null, "Producto Registrado co éxito", "Registrar Usuario", JOptionPane.INFORMATION_MESSAGE);
            */ cl.close();
        } catch (SQLException e) {
            System.out.println("No se pudo agregar detalle carrito");
        }
    }
    
    public static int buscarIdCarrito(int usuario) {
        int idcarrito=0;
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call sp_devolver_id_carrito (?)}");
            cl.setInt(1, usuario);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                idcarrito= rs.getInt("idcarrito");
            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        System.out.println("El id del carrito es: "+ idcarrito);
        return idcarrito;
    }
    
    public static void modificarDetalleCarrito(int idcarrito, int idproducto, int cantidad) {
        System.out.println("Entro al metodo modificar");
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("UPDATE detallecarrito SET cantidad = ? WHERE idcarrito = ? AND idproducto = ? ");
            cl.setInt(1, cantidad);
            cl.setInt(2, idcarrito);
            cl.setInt(3, idproducto);
            System.out.println("preparado para modificar");
            cl.executeUpdate();
            System.out.println("Se modifico correctamente");
          
        } catch (SQLException e) {
            System.out.println("no se modificó");
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        
    }
    
    public static void eliminarDetalleCarrito(int idcarrito, int idproducto) {
        System.out.println("Entro al metodo eliminar");
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("DELETE FROM detallecarrito WHERE idcarrito = ? AND idproducto = ? ");
            cl.setInt(1, idcarrito);
            cl.setInt(2, idproducto);
            System.out.println("preparado para eliminar");
            cl.executeUpdate();
            System.out.println("Se elimino correctamente");
          
        } catch (SQLException e) {
            System.out.println("no se elimino");
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        
    }
    
    public static ArrayList<DetalleCarrito> listarDetalleCarrito(int carrito) {
        ArrayList<DetalleCarrito> detallecarrito = null;
        try {
            detallecarrito = new ArrayList<DetalleCarrito>();
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call lista_productos_carrito (?)}");
            cl.setInt(1, carrito);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                /*detallecarrito = new ArrayList<DetalleCarrito>();*/
                int idcarrito= rs.getInt("idcarrito");
                int idproducto = rs.getInt("idproducto");
                String categoria=rs.getString("categoria");
                String nombre=rs.getString("nombre");
                String descripcion=rs.getString("descripcion");
                String url=rs.getString("url");
                double precio = rs.getDouble("precio");
                int cantidad = rs.getInt("cantidad");
                double subtotal = rs.getDouble("subtotal");
                
                DetalleCarrito detalle = new DetalleCarrito(idcarrito, idproducto,
                categoria,nombre,descripcion, url,precio, cantidad, subtotal );
                detallecarrito.add(detalle);
            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        System.out.println("El tamaño del carrito es: "+detallecarrito.size());
        return detallecarrito;
    }
}
