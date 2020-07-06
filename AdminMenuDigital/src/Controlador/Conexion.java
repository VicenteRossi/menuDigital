/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author vicente
 */
public class Conexion {
    Connection conn;
    Statement state;
    ResultSet res;
    
    String driver = "";
    String user = "root";
    String pass = "Pas$vix0";
}
