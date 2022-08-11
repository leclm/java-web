/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import database.DAO;
import database.DAOException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import models.Usuario;


public class UsuarioDAO implements DAO<Usuario> {
    private static final String QUERY_INSERIR = "INSERT INTO tb_usuario (login_usuario, senha_usuario, nome_usuario) VALUES (?, ?, ?)";
    private static final String QUERY_BUSCAR = "SELECT id_usuario, login_usuario, senha_usuario, nome_usuario FROM tb_usuario WHERE id_usuario = (?)";
    private static final String QUERY_BUSCAR_TODOS = "SELECT id_usuario, login_usuario, senha_usuario, nome_usuario FROM tb_usuario";
    private static final String QUERY_BUSCAR_NOME_PELO_EMAIL = "SELECT id_usuario, login_usuario, senha_usuario, nome_usuario FROM tb_usuario WHERE login_usuario = (?)";

    private Connection con = null;
    
    public UsuarioDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar UsuarioDAO.");
        }
        this.con = con;
    }
    
    @Override
    public Usuario buscar(long id) throws DAOException {
        try (PreparedStatement st = this.con.prepareStatement(UsuarioDAO.QUERY_BUSCAR)) {
            st.setLong(1, id);
            Usuario user;
            try (ResultSet rs = st.executeQuery()) {
                rs.next();
                user = new Usuario();
                user.setId(rs.getInt("id_usuario"));
                user.setName(rs.getString("nome_usuario"));
                user.setLogin(rs.getString("login_usuario"));
                user.setPassword(rs.getString("senha_usuario"));
            }
            return user;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando usuário pelo id: " + UsuarioDAO.QUERY_BUSCAR, e);
        }
    }

    @Override
    public List<Usuario> buscarTodos() throws DAOException {
        List<Usuario> usuarios = new ArrayList<>();
        try (PreparedStatement st = this.con.prepareStatement(UsuarioDAO.QUERY_BUSCAR_TODOS); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setId(rs.getInt("id_usuario"));
                user.setName(rs.getString("nome_usuario"));
                user.setLogin(rs.getString("login_usuario"));
                user.setPassword(rs.getString("senha_usuario"));
                usuarios.add(user);
            }
            return usuarios;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando todos os usuários: " + UsuarioDAO.QUERY_BUSCAR_TODOS, e);
        }
    }
    
    public Usuario buscarPeloEmail(String email) throws DAOException {
        try (PreparedStatement st = this.con.prepareStatement(UsuarioDAO.QUERY_BUSCAR_NOME_PELO_EMAIL)) {
            st.setString(1, email);
            Usuario user;
            try (ResultSet rs = st.executeQuery()) {
                rs.next();
                user = new Usuario();
                user.setId(rs.getInt("id_usuario"));
                user.setName(rs.getString("nome_usuario"));
                user.setLogin(rs.getString("login_usuario"));
                user.setPassword(rs.getString("senha_usuario"));
            }
            return user;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando usuário pelo email: " + UsuarioDAO.QUERY_BUSCAR_NOME_PELO_EMAIL, e);
        }
    }

    @Override
    public void inserir(Usuario u) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(UsuarioDAO.QUERY_INSERIR)) {
            st.setString(1, u.getName());
            st.setString(2, u.getLogin());
            st.setString(3, u.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Erro inserindo usuário: " + UsuarioDAO.QUERY_INSERIR + "/ " + u.toString(), e);
        }
    }

    @Override
    public void atualizar(Usuario u) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(Usuario u) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
