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
public class DetalleVenta {
    private int idventa;
    private int idproducto;
    private int cantidad;

    public DetalleVenta(int idventa, int idproducto, int cantidad) {
        this.idventa = idventa;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
    }

    public int getIdventa() {
        return idventa;
    }

    public void setIdventa(int idventa) {
        this.idventa = idventa;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
