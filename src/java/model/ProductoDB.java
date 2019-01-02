/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author anthony
 */
import java.sql.*;
import java.util.*;
import utils.Conexion;
public class ProductoDB {
    public static ArrayList<Producto> obtenerListaProductos(){
        ArrayList<Producto> listaProductos=null;
        try{
            listaProductos = new ArrayList<Producto>();
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call producto_buscar_todos}");
            ResultSet rs =cl.executeQuery();
            while(rs.next()){
                int idproducto=rs.getInt("idproducto");
                String categoria=rs.getString("categoria");
                String nombre=rs.getString("nombre");
                String descripcion=rs.getString("descripcion");
                String url=rs.getString("url");
                double precio=rs.getDouble("precio");
              //  byte imagen =0;
                Producto producto = new Producto(idproducto, categoria,nombre, descripcion, url,precio);
                listaProductos.add(producto);
                System.out.println("Se recuperaron todos los productos");
                
            }
            cl.close();
        }catch(SQLException e){
            System.out.println("No se recuperaron los productos");
        }
        return listaProductos;
    }
    public static Producto buscarProducto(int id){
        Producto producto=null;
        try{
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call producto_buscar_id(?)}");
            cl.setString(1, String.valueOf(id));
            ResultSet rs =cl.executeQuery();
            while(rs.next()){
                int idproducto=rs.getInt("idproducto");
                String categoria=rs.getString("categoria");
                String nombre=rs.getString("nombre");
                String descripcion=rs.getString("descripcion");
                String url=rs.getString("url");
                double precio=rs.getDouble("precio");
              //  byte imagen =0;
                producto = new Producto(idproducto, categoria,nombre, descripcion, url,precio);
                System.out.println("Se recupero el producto");
                
            }
            cl.close();
        }catch(SQLException e){
            System.out.println("No se recupero el producto");
        }
        return producto;
    }
    
    public static ArrayList<Producto> buscarProductoxCategoria(String categ){
        ArrayList<Producto> listaProductos=null;
        try{
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            listaProductos = new ArrayList<Producto>();
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call producto_buscar_categoria(?)}");
            cl.setString(1, categ);
            ResultSet rs =cl.executeQuery();
            while(rs.next()){
                int idproducto=rs.getInt("idproducto");
                String categoria=rs.getString("categoria");
                String nombre=rs.getString("nombre");
                String descripcion=rs.getString("descripcion");
                String url=rs.getString("url");
                double precio=rs.getDouble("precio");
              //  byte imagen =0;
                Producto producto = new Producto(idproducto, categoria,nombre, descripcion, url,precio);
                listaProductos.add(producto);
                System.out.println("Se recupero la categoria");
                
            }
            cl.close();
        }catch(SQLException e){
            System.out.println("No se recupero la categoria");
        }
        return listaProductos;
    } 
}
