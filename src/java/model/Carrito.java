/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author anthony
 */
public class Carrito {

    private int idcarrito;
    private int idusuario;
    private Date fecha;

    public Carrito(int idventa, int idusuario, Date fecha) {
        this.idcarrito = idventa;
        this.idusuario = idusuario;
        this.fecha = fecha;
    }

    public int getIdcarrito() {
        return idcarrito;
    }

    public void setIdcarrito(int idcarrito) {
        this.idcarrito = idcarrito;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
