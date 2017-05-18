/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.*;
public class Artista extends Usuario {
    public static HashMap<String,Artista> artistas = new HashMap<>();

    private double reputacion;
    private HashMap<String, Obra> articulos = new HashMap<>();
    private HashMap<String, Obra> articulosVendidos = new HashMap<>();

    public Artista() {

    }

    public Artista(String nombres, String apellidos, String sobrenombre,
            String email, String id, String fechaDeNacimiento) {
        super(nombres, apellidos, sobrenombre, email, id, fechaDeNacimiento);

        this.setRol("Artista");

    }

    public Artista(String nombres, String apellidos, String sobrenombre,
            String email, String id, String fechaDeNacimiento, double presupuesto) {
        super(nombres, apellidos, sobrenombre, email, id, fechaDeNacimiento);
        this.setRol("Artista");
        this.setPresupuesto(presupuesto);
    }

    public static final Comparator<Artista> sortByReputacion() {
        Comparator<Artista> comparator = new Comparator<Artista>() {
            @Override
            public int compare(Artista o1, Artista o2) {
                if (o1.reputacion < o2.reputacion) {
                    return 1;
                } else {
                    return -1;
                }
            }

        };
        return comparator;
    }

    public double getReputacion() {
        return reputacion;
    }

    public void setReputacion(double reputacion) {
        this.reputacion = reputacion;
    }

    public HashMap<String, Obra> getArticulos() {
        return articulos;
    }

    public void setArticulos(HashMap<String, Obra> articulos) {
        this.articulos = articulos;
    }

    public HashMap<String, Obra> getArticulosVendidos() {
        return articulosVendidos;
    }

    public void setArticulosVendidos(HashMap<String, Obra> articulosVendidos) {
        this.articulosVendidos = articulosVendidos;
    }

    public void addObra(Obra obra) {
        articulos.put(obra.getId(), obra);
    }

    public void calcularReputacion() {
        int s = 0;
        Obra obra;
        for (HashMap.Entry pair : articulos.entrySet()) {
            obra = (Obra) pair.getValue();
            obra.setPuntuacion();
            s += obra.getPuntuacion();
        }
        reputacion = s;
    }

    public Obra obtenerMejorObra() {
        double max = Integer.MIN_VALUE;
        String id = "";
        Obra obra;
        for (HashMap.Entry pair : articulos.entrySet()) {
            obra = (Obra) pair.getValue();
            if (obra.getPuntuacion() > max) {
                max = obra.getPuntuacion();
                id = String.valueOf(obra.getId());
            }
        }
        return articulos.get(id);
    }

    public ArrayList<Obra> obrasPorPrecio() {
        ArrayList<Obra> obras = new ArrayList<Obra>();
        for (HashMap.Entry pair : articulos.entrySet()) {
            obras.add((Obra) pair.getValue());
        }
        Collections.sort(obras, Obra.sortByPrecio());
        return obras;
    }

    public ArrayList<Obra> obrasPorPuntuacion() {
        ArrayList<Obra> obras = new ArrayList<Obra>();
        for (HashMap.Entry pair : articulos.entrySet()) {
            obras.add((Obra) pair.getValue());

        }
        Collections.sort(obras, Obra.sortByPuntuacion());
        return obras;
    }
    
}
