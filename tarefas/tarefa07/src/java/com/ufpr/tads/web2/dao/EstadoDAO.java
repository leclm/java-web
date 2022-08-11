package com.ufpr.tads.web2.dao;
import com.ufpr.tads.web2.beans.Estado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstadoDAO {
    private Connection con = null;

    public EstadoDAO(){
        con = ConnectionFactory.getConnection();
    }
    public Estado select(int id){
        String sql = "SELECT * FROM tb_estado WHERE id_estado = " + id;
        Estado estado = new Estado();
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);            
            
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();            
            while (rs.next()){
              estado.setId_estado(rs.getInt("id_estado"));   
              estado.setNome_estado(rs.getString("nome_estado"));
              estado.setSigla_estado(rs.getString("sigla_estado"));
            }
        } catch (SQLException erro) {
            System.err.println("Erro: " + erro);
        }finally{
            ConnectionFactory.CloseConnection(con, stmt);
        }
        return estado;
    } 
    public List<Estado> selectAll(){
        List<Estado> estados = new ArrayList<Estado>();
        String sql = "SELECT * FROM tb_estado";
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();            
            while (rs.next()){
              Estado estado = new Estado();
              
              estado.setId_estado(rs.getInt("id_estado"));   
              estado.setNome_estado(rs.getString("nome_estado"));
              estado.setSigla_estado(rs.getString("sigla_estado"));
                            
              estados.add(estado);
            }
        } catch (SQLException erro) {
            System.err.println("Erro: " + erro);
        }finally{
            ConnectionFactory.CloseConnection(con, stmt);
        }
        
        return estados;
    } 
}
   
