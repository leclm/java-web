package com.ufpr.tads.web2.dao;
import com.ufpr.tads.web2.beans.Cidade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CidadeDAO {
    private Connection con = null;

    public CidadeDAO() {
        con = ConnectionFactory.getConnection();
    }
    
    public Cidade select(int id){
        String sql = "SELECT * FROM tb_cidade WHERE id_cidade = " + id;
        Cidade cidade = new Cidade();
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);            
            
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();            
            while (rs.next()){
              cidade.setId_cidade(rs.getInt("id_cidade"));   
              cidade.setNome_cidade(rs.getString("nome_cidade"));
              cidade.setId_estado(rs.getInt("id_estado"));
            }
        } catch (SQLException erro) {
            System.err.println("Erro: " + erro);
        }finally{
            ConnectionFactory.CloseConnection(con, stmt);
        }
        return cidade;
    } 
    public List<Cidade> selectAll(){
        List<Cidade> cidades = new ArrayList<Cidade>();
        String sql = "SELECT * FROM tb_cidade";
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();            
            while (rs.next()){
              Cidade cidade = new Cidade();
              cidade.setId_cidade(rs.getInt("id_cidade"));   
              cidade.setNome_cidade(rs.getString("nome_cidade"));
              cidade.setId_estado(rs.getInt("id_estado"));
              
              cidades.add(cidade);
            }
        } catch (SQLException erro) {
            System.err.println("Erro: " + erro);
        }finally{
            ConnectionFactory.CloseConnection(con, stmt);
        }
        
        return cidades;
    } 
    
    public List<Cidade> selectCidadesFromEstado(String id){
        List<Cidade> cidades = new ArrayList<Cidade>();
        String sql = "SELECT * FROM tb_cidade WHERE id_estado = " + id;
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();            
            while (rs.next()){
              Cidade cidade = new Cidade();
              cidade.setId_cidade(rs.getInt("id_cidade"));   
              cidade.setNome_cidade(rs.getString("nome_cidade"));
              cidade.setId_estado(rs.getInt("id_estado"));
              
              cidades.add(cidade);
            }
        } catch (SQLException erro) {
            System.err.println("Erro: " + erro);
        }finally{
            ConnectionFactory.CloseConnection(con, stmt);
        }
        
        return cidades;
    } 
}
