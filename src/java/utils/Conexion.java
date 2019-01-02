/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;
import java.sql.*;

/**
 *
 * @author anthony
 */

public class Conexion {
    public static Connection getConnexion(){
        Connection cn =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3307/worldshop", "root", "");
            System.out.println("Conexion exitosa");
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println("Error de conexion: "+e);
            
        }
        return cn;
        
    }
    public static void main(String args[]){
        Conexion.getConnexion();
    }
    
    
}
