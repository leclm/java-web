/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;

import model.bean.Usuario;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lelim
 */
public class UsuarioDAO {
    private Connection con = null;

    public UsuarioDAO() {
        con = ConnectionFactory.getConnection();
    }
   
    //insere no Banco de Dados (insert)
    public boolean save(Usuario usuario){
        
        String sql = "INSERT into tb_usuario (login_usuario, senha_usuario, nome_usuario) "
                + "VALUES ('" + usuario.getEmail() + "', '" + 
                usuario.getPw() + "', '"+ usuario.getName() + "')";
        
        PreparedStatement st = null;
        
        try {
            //setString = ?
            st = con.prepareStatement(sql);

            //executa o sql
            st.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro: " + ex);
            return false;
        }finally{
            ConnectionFactory.CloseConnection(con, st);
        }    
    }
}
