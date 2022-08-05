package com.ufpr.tads.web2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.ufpr.tads.web2.beans.Usuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lelim
 */
public class UsuarioDAO {
    private Connection conn = null;

    public UsuarioDAO() {
        conn = ConnectionFactory.getConnection();
    }
   
    public boolean save(Usuario usuario){
        String sql = "INSERT into tb_usuario (login_usuario, senha_usuario, nome_usuario) "
                   + "VALUES ('" + usuario.getLogin() + "', '" + usuario.getSenha() + "', '" 
                   + usuario.getNome() + "')";
        
        PreparedStatement stmt = null;
        
        try {
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
            
            return false;
        }finally{
            ConnectionFactory.CloseConnection(conn, stmt);
        }    
    }
    
    public Usuario selectUser(Usuario user){
        String sql = "SELECT * FROM tb_usuario WHERE login_usuario = '" + user.getLogin() 
            + "' and senha_usuario = '" + user.getSenha() + "'";
        
        PreparedStatement stmt = null;
        
        try {
            stmt = conn.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();
            
            while (rs.next()) {
              user.setId(rs.getInt("id_usuario"));  
              user.setLogin(rs.getString("login_usuario"));
              user.setSenha(rs.getString("senha_usuario"));
              user.setNome(rs.getString("nome_usuario"));
            }
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
        }finally{
            ConnectionFactory.CloseConnection(conn, stmt);
        }
        
        return user;
    }
    
    public List<Usuario> selectAll(){
        List<Usuario> usuarios = new ArrayList<Usuario>();
        String sql = "SELECT * FROM tb_usuario";
        
        PreparedStatement stmt = null;
        
        try {
            stmt = conn.prepareStatement(sql);
            stmt.executeQuery(sql);
            
            ResultSet rs = stmt.getResultSet();
            
            while (rs.next()){
              Usuario user = new Usuario();
              user.setId(rs.getInt("id_usuario"));
              user.setLogin(rs.getString("login_usuario"));
              user.setSenha(rs.getString("senha_usuario"));
              user.setNome(rs.getString("nome_usuario"));
              
              usuarios.add(user);
            }
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
        }finally{
            ConnectionFactory.CloseConnection(conn, stmt);
        }
        
        return usuarios;
    }
}
