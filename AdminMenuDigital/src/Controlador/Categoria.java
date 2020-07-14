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
public class Categoria {

    private String categoria;

    Connection conn;
    Statement state;
    ResultSet res;
    String query;

    public Categoria(String categoria) {
        this.categoria = categoria;
    }

    public Categoria() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/menuDigital?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "123456");

            state = conn.createStatement();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public ArrayList verCategoria() {

        ArrayList<Categoria> lista = null;
        Categoria c;
        try {
            res = state.executeQuery(query);
            lista = new ArrayList<>();
            while (res.next()) {
                c = new Categoria();
                c.setCategoria(res.getString("categoria"));
                lista.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lista;
    }

    public boolean crearCategoria() {
        try {
            int resultadoInsert = state.executeUpdate(query);

            if (resultadoInsert > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public String toString() {
        return this.getCategoria();
    }

    public boolean modificarCategoria() {
        try {
            int resultado = state.executeUpdate(query);

            if (resultado > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    
    public boolean eliminarCategoria() {
        try {
            int resultado = state.executeUpdate(query);

            if (resultado > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
