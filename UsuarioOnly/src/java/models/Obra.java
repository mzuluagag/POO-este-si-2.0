/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;

public class Obra {

    
    private String id;
    private double precio;
    private String nombre;
    private String descripcion;
    private String imagen;
    private Artista artista;
    private Date fechaPublicacion;
    private double puntuacion;
    private ArrayList<Comentario> comentarios = new ArrayList<>();

    public Obra() {

    }

    public Obra(String nombre, double precio, String imagen, String descripcion, Artista artista, String id) {
        this.setNombre(nombre);
        this.setPrecio(precio);
        this.setImagen(imagen);
        this.setDescripcion(descripcion);
        this.setArtista(artista);
        this.setFechaPublicacion();
        this.setId(id);
        
    }
    
    public static final Comparator<Obra> sortByPrecio() {
            Comparator<Obra> comparator = new Comparator<Obra>() {
                @Override
                public int compare(Obra o1, Obra o2) {
                    if (o1.precio > o2.precio) {
                        return 1;
                    } else {
                        return -1;
                    }
                }

            };
            return comparator;
        }
    
    public static final Comparator<Obra> sortByPuntuacion() {
            Comparator<Obra> comparator = new Comparator<Obra>() {
                @Override
                public int compare(Obra o1, Obra o2) {
                    if (o1.puntuacion < o2.puntuacion) {
                        return 1;
                    } else {
                        return -1;
                    }
                }

            };
            return comparator;
        }
    

    public ArrayList<Comentario> getComentarios(){
        return comentarios;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getPrecio() {
        return precio;
    }

    public boolean setPrecio(double precio) {
        if(precio>= 0){
            this.precio = precio;
            return true;
        }else{
            return false;
        }
    }   

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Artista getArtista() {
        return artista;
    }

    public void setArtista(Artista artista) {
        this.artista = artista;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion() {
        this.fechaPublicacion = new Date();
    }

    public double getPuntuacion() {
        return puntuacion;

    }

    public void setPuntuacion() {
        double cont = 0;
        for (Comentario com : comentarios) {
            cont += com.getPuntuacion();
        }
        puntuacion = cont / comentarios.size();

    }
    
    public boolean editarObra(String nombre, double precio, String descripcion){
        if(artista.getId().equals(this.artista.getId())){
            setNombre(nombre);
            setPrecio(precio);
            setDescripcion(descripcion);
            return true;
        }else{
            return false;
        }
    }

}
