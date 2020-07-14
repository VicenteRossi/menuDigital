/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vicente
 */
public class Item {
    private String nombre;
    private int precio;
    private String imagen;
    private String descripcion;
    private int idCategoria;
    
    Connection conn;
    Statement state;
    ResultSet res;
    String query;

    public Item(String nombre, int precio, String imagen, String descripcion, int idCategoria) {
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.idCategoria = idCategoria;
    }

    public Item() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/menuDigital?zeroDateTimeBehavior=CONVERT_TO_NULL","root","123456");
            state = conn.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
    
    public ArrayList verItem(){
        ArrayList<Item> lista = null;
        Item i;
        
        try {
            res = state.executeQuery(query);
            lista = new ArrayList<>();
            while(res.next()){
                i = new Item();
                i.setNombre(res.getString("nombre"));
                lista.add(i);                
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public boolean crearItem(){
        try {
            int resultado = state.executeUpdate(query);
            
            if (resultado > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
