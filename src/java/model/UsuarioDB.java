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
import javax.swing.JOptionPane;
import utils.Conexion;

public class UsuarioDB {

    public static Usuario buscarUsuarioId(int id) {
        Usuario usuario = null;
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call usuario_buscarId (?)}");
            cl.setInt(1, id);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                int idusuario = rs.getInt("idusuario");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String rol = rs.getString("rol");
                String correo = rs.getString("correo");
                String clave = rs.getString("clave");
                String imagen = rs.getString("imagen");

                //  byte imagen =0;
                usuario = new Usuario(idusuario, nombre, apellido, rol, correo, clave,imagen);
                JOptionPane.showMessageDialog(null, "Usuario Encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);

            }
            cl.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        return usuario;
    }
    
    public static boolean buscarUsuarioCorreo(String corr) {
        boolean existe=false;
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call usuario_buscarCorreo  (?)}");
            cl.setString(1, corr);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                System.out.println("usuario ya existe");
                existe=true;
            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        System.out.println(existe);
        return existe;
    }

    public static Usuario buscarUsuario(String corr, String clav) {
        Usuario usuario = null;
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call usuario_buscar (?, ?)}");
            cl.setString(1, corr);
            cl.setString(2, clav);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                int idusuario = rs.getInt("idusuario");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String rol = rs.getString("rol");
                String correo = rs.getString("correo");
                String clave = rs.getString("clave");
                String imagen = rs.getString("imagen");

                //  byte imagen =0;
                usuario = new Usuario(idusuario, nombre, apellido, rol, correo, clave,imagen);
             //   JOptionPane.showMessageDialog(null, "Usuario Encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);

            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        return usuario;
    }
    
    public static int buscarIdUsuario(String corr, String clav) {
        int idusuario=0;
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call buscar_IdUsuario (?, ?)}");
            cl.setString(1, corr);
            cl.setString(2, clav);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                idusuario= rs.getInt("idusuario");
               
                
             //   JOptionPane.showMessageDialog(null, "Usuario Encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);

            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        return idusuario;
    }
    
    public static String buscarImagenUsuario(int id) {
        String idusuario="";
        
        try {
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT imagen FROM usuario WHERE idusuario = ?");
            cl.setInt(1, id);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                 idusuario= rs.getString("imagen");
               
                
             //   JOptionPane.showMessageDialog(null, "Usuario Encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);

            }
            cl.close();
        } catch (SQLException e) {
           // JOptionPane.showMessageDialog(null, "Usuario no encontrado", "Buscar Usuario", JOptionPane.INFORMATION_MESSAGE);
        }
        return idusuario;
    }
    
    
    public static void modificar_Imagen(int id, String image) {
        try {
            System.out.println("Estamos en modificar imagen usuario");
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            CallableStatement cl = Conexion.getConnexion().prepareCall("{call modificar_imagenUsuario (?, ?)}");
            cl.setInt(1, id);
            cl.setString(2, image);
            System.out.println("Asigne, voy a ejecutar");
            cl.executeUpdate();
            System.out.println("ejecuto");
            /*JOptionPane.showMessageDialog(null, "Producto Registrado co éxito", "Registrar Usuario", JOptionPane.INFORMATION_MESSAGE);
            */ cl.close();
        } catch (SQLException e) {
            System.out.println("No se pudo modificar imagen usuario");
        }
    }
    
    
    

    public static void registrarUsuario(Usuario user) {
        try {
            System.out.println("Estamos en registrar usuario");
            //PreparedStatement cl = Conexion.getConnexion().prepareStatement("SELECT * from producto");
            PreparedStatement cl = Conexion.getConnexion().prepareStatement("INSERT INTO usuario (idusuario, nombre, apellido, rol, correo, clave, imagen) VALUES (null, ?, ?, ?, ?, ?,?) ");
            System.out.println("Cree la sentencia");
            cl.setString(1, user.getNombre());
            cl.setString(2, user.getApellido());
            cl.setString(3, user.getRol());
            cl.setString(4, user.getCorreo());
            cl.setString(5, user.getClave());
            cl.setString(6, user.getImagen());
            System.out.println("Asigne, voy a ejecutar");
            cl.executeUpdate();
            System.out.println("ejecuto");
            /*JOptionPane.showMessageDialog(null, "Producto Registrado co éxito", "Registrar Usuario", JOptionPane.INFORMATION_MESSAGE);
            */ cl.close();
        } catch (SQLException e) {
            System.out.println("No se pudo registrar usuario");
        }
    }

}
