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
import javax.swing.JOptionPane;

/**
 *
 * @author vicente
 */
public class Mesa {

    private int mesa;

    Connection conn;
    Statement state;
    ResultSet res;
    String query;

    public Mesa(int mesa) {
        this.mesa = mesa;
    }

    public Mesa() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/menuDigital?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "123456");

            state = conn.createStatement();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getMesa() {
        return mesa;
    }

    public void setMesa(int mesa) {
        this.mesa = mesa;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public ArrayList verMesa() {
        ArrayList<Mesa> lista = null;
        Mesa m;

        try {
            m = new Mesa();
            res = state.executeQuery(query);
            lista = new ArrayList<>();
            while (res.next()) {
                m.setMesa(res.getInt("mesa"));
                lista.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mesa.class.getName()).log(Level.SEVERE, null, ex);
           // JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return lista;
    }

    public boolean crearMesa() {
        try {
            int resultado = state.executeUpdate(query);

            if (resultado > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Mesa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean eliminarMesa() {
        try {
            int resultado = state.executeUpdate(query);

            if (resultado > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Mesa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public String toString() {
        return "" + this.getMesa();
    }

}
