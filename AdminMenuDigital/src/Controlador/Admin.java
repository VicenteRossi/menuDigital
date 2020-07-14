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
public class Admin {
    private String usuario;
    private String clave;
    
    Connection conn;
    Statement state;
    ResultSet res;
    String query;

    public Admin(String usuario, String clave) {
        this.usuario = usuario;
        this.clave = clave;            
    }

    public Admin() {        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/menuDigital?zeroDateTimeBehavior=CONVERT_TO_NULL","root","123456");
            state = conn.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
    
    

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
   public Admin login(String usuario, String clave){
           String query = "select * from admin where usuario = '"+usuario+"' and clave = '"+clave+"'";
           
           Admin a = null;
        try {
            
            res = state.executeQuery(query);
            
            while(res.next()){
                a = new Admin(res.getString("usuario"), res.getString("clave"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
          return a; 
   }
   
   public ArrayList verUsuario(){       
          
        ArrayList<Admin> lista = null;
        Admin a;
        try {            
            res = state.executeQuery(query);
            lista = new ArrayList<>();
            while(res.next()){                
                a= new Admin();
                a.setUsuario(res.getString("usuario"));
                lista.add(a);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }
   
   public boolean crearUsuario(){
        try {
            int crear = state.executeUpdate(query);
            if (crear > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
   
   public String buscarClave(){
       String clave = null;
       
        try {
            res = state.executeQuery(query);
            while (res.next()) {                
                clave =res.getString("clave");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clave;
   }
   
   public boolean modificarUsuario(){
        try {
            int resultado = state.executeUpdate(query);
            
            if (resultado > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }
   
   public boolean eliminarUsuario(){
        try {
            int resultado = state.executeUpdate(query);
            
            if (resultado > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
   }

    @Override
    public String toString() {
        return this.getUsuario();
    }
}
