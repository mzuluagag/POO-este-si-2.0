/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Sergio
 */
public class Comentario {
    private String descripcion;
    private double puntuacion;
    private Obra articulo;
    private Usuario usuario;

    public Comentario(String descripcion, double puntuacion, Obra articulo, Usuario usuario) {
        this.descripcion = descripcion;
        this.puntuacion = puntuacion;
        this.articulo = articulo;
        this.usuario = usuario;
    }
    
    

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(double puntuacion) {
        this.puntuacion = puntuacion;
    }

    public Obra getArticulo() {
        return articulo;
    }

    public void setArticulo(Obra articulo) {
        this.articulo = articulo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
}
