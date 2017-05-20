/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;
import java.util.*;

/**
 *
 * @author Sergio
 */
public class Usuario {

    private String nombres;
    private String apellidos;
    private String sobrenombre;
    private String email;
    private String id;
    private String fechaDeNacimiento;
    private double presupuesto;
    private String rol;
    private HashMap <String, Obra> obrasCompradas = new HashMap<String,Obra>();

    public Usuario() {

    }

    public Usuario(String nombres, String apellidos, String sobrenombre,
            String email, String id, String fechaDeNacimiento) {
        setNombres(nombres);
        setApellidos(apellidos);
        setSobrenombre(sobrenombre);
        setEmail(email);
        setId(id);
        setFechaDeNacimiento(fechaDeNacimiento);
        setRol("Usuario");
        setPresupuesto(0);

    }

    public Usuario(String nombres, String apellidos, String sobrenombre,
            String email, String id, String fechaDeNacimiento,
            double presupuesto) {
        setNombres(nombres);
        setApellidos(apellidos);
        setSobrenombre(sobrenombre);
        setEmail(email);
        setId(id);
        setFechaDeNacimiento(fechaDeNacimiento);
        setRol("Usuario");
        setPresupuesto(presupuesto);
    }

    public HashMap<String, Obra> getObrasCompradas() {
        return obrasCompradas;
    }

    public void setObrasCompradas(HashMap<String, Obra> obrasCompradas) {
        this.obrasCompradas = obrasCompradas;
    }
    
    public void addObraComprada(Obra obra){
        obrasCompradas.put(obra.getId(), obra);
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getSobrenombre() {
        return sobrenombre;
    }

    public void setSobrenombre(String sobrenombre) {
        this.sobrenombre = sobrenombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(String fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public double getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(double presupuesto) {
        this.presupuesto = presupuesto;
    }
    
    public void recargarPresupuesto(double presupuesto){
        this.presupuesto += presupuesto;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    

}
