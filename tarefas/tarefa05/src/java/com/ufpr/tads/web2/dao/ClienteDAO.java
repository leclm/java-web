package com.ufpr.tads.web2.dao;
import com.ufpr.tads.web2.beans.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lelim
 */
public class ClienteDAO {
   private Connection con = null;

    public ClienteDAO() {
        con = ConnectionFactory.getConnection();
    }
   
    public boolean insert(Cliente cliente){
        
        String sql = "INSERT into tb_cliente (cpf_cliente, nome_cliente, email_cliente, data_cliente, "
                + "rua_cliente, nr_cliente, cep_cliente, cidade_cliente, uf_cliente) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getData());
            stmt.setString(5, cliente.getRua());
            stmt.setInt(6, cliente.getNr());
            stmt.setString(7, cliente.getCep());
            stmt.setString(8, cliente.getCidade());
            stmt.setString(9, cliente.getUf());
           
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro: "+ex);
            return false;
        } finally {
            ConnectionFactory.CloseConnection(con, stmt);
        }    
    }
    
    public Cliente select(Cliente cliente){
        String sql = "SELECT * FROM tb_cliente WHERE id_cliente = " + cliente.getId();
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();
            while (rs.next()){
              cliente.setId(rs.getInt("id_cliente"));
              cliente.setCpf(rs.getString("cpf_cliente"));
              cliente.setNome(rs.getString("nome_cliente"));
              cliente.setEmail(rs.getString("email_cliente"));
              cliente.setData(rs.getString("data_cliente"));
              cliente.setRua(rs.getString("rua_cliente"));
              cliente.setNr(rs.getInt("nr_cliente"));
              cliente.setCep(rs.getString("cep_cliente"));
              cliente.setCidade(rs.getString("cidade_cliente"));
              cliente.setUf(rs.getString("uf_cliente"));
            }
        } catch (SQLException ex) {
            System.err.println("Erro: "+ex);
        } finally {
            ConnectionFactory.CloseConnection(con, stmt);
        }
        
        return cliente;
    } 
    
    public List<Cliente> selectAll(){
        List<Cliente> clientes = new ArrayList<Cliente>();
        String sql = "SELECT * FROM tb_cliente";
        
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();
            while (rs.next()){
              Cliente cliente = new Cliente();
              cliente.setId(rs.getInt("id_cliente"));
              cliente.setCpf(rs.getString("cpf_cliente"));
              cliente.setNome(rs.getString("nome_cliente"));
              cliente.setEmail(rs.getString("email_cliente"));
              cliente.setData(rs.getString("data_cliente"));
              cliente.setRua(rs.getString("rua_cliente"));
              cliente.setNr(rs.getInt("nr_cliente"));
              cliente.setCep(rs.getString("cep_cliente"));
              cliente.setCidade(rs.getString("cidade_cliente"));
              cliente.setUf(rs.getString("uf_cliente"));
              
              clientes.add(cliente);
            }
        } catch (SQLException ex) {
            System.err.println("Erro: "+ex);
        } finally {
            ConnectionFactory.CloseConnection(con, stmt);
        }
        
        return clientes;
    } 
    
    public boolean update(Cliente cliente){ 
        String sql = "UPDATE tb_cliente "
                + "SET cpf_cliente = ?, nome_cliente = ?, "
                + "email_cliente = ?, data_cliente = ?, "
                + "rua_cliente = ?, nr_cliente = ?, "
                + "cep_cliente = ?, cidade_cliente = ?, "
                + "uf_cliente = ? "
                + "WHERE id_cliente = ?";
        
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getData());
            stmt.setString(5, cliente.getRua());
            stmt.setInt(6, cliente.getNr());
            stmt.setString(7, cliente.getCep());
            stmt.setString(8, cliente.getCidade());
            stmt.setString(9, cliente.getUf());
            stmt.setInt(10, cliente.getId());
           
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro: "+ex);
            return false;
        } finally {
            ConnectionFactory.CloseConnection(con, stmt);
        }    
    }
    
    public boolean delete(Cliente cliente){ 
        String sql = "DELETE FROM tb_cliente "
                + "WHERE id_cliente = " + cliente.getId();
        
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro: "+ex);
            return false;
        } finally {
            ConnectionFactory.CloseConnection(con, stmt);
        }    
    }
}
