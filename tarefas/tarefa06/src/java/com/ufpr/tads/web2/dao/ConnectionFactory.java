package com.ufpr.tads.web2.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author lelim
 */
public class ConnectionFactory {
    
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";   
    private static final String URL = "jdbc:mysql://localhost:3306/java_web_03?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";     
    private static final String USER = "root";     
    private static final String PASS = ""; 

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            
            return DriverManager.getConnection(URL, USER, PASS);
            
        } catch (ClassNotFoundException | SQLException ex) {
            throw new RuntimeException("Erro na conexão: " + ex.getMessage(), ex);
        }
    }
    public static void CloseConnection(Connection con) {
        
        if (con != null){
            try {
                con.close();
            } catch (SQLException ex) {
                System.err.println("Erro: "+ex);
            }
        }
    }
    
    public static void CloseConnection(Connection con, PreparedStatement stmt) {
        
        if (stmt != null){
            try {
                stmt.close();
            } catch (SQLException ex) {
                System.err.println("Erro: "+ex);
            }
        }
        CloseConnection(con);
    }
    
    public static void CloseConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
       
        if (rs != null){
            try {
                rs.close();
            } catch (SQLException ex) {
                System.err.println("Erro: "+ex);
            }
        }
        CloseConnection(con, stmt);
    }
}
