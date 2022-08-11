/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import database.DAO;
import database.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Estado;


public class EstadoDAO implements DAO<Estado>  {
    private static final String QUERY_BUSCAR_TODOS = "SELECT id_estado, nome_estado, sigla_estado FROM tb_estado";
    private Connection con = null;
    
    public EstadoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar EstadoDAO.");
        }
        this.con = con;
    }

    @Override
    public Estado buscar(long id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Estado> buscarTodos() throws DAOException {
        List<Estado> estados = new ArrayList<>();
        try (PreparedStatement st = this.con.prepareStatement(EstadoDAO.QUERY_BUSCAR_TODOS); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Estado estado = new Estado();
                estado.setId(rs.getInt("id_estado"));
                estado.setNome(rs.getString("nome_estado"));
                estado.setSigla(rs.getString("sigla_estado"));
                estados.add(estado);
            }
            return estados;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando todos os estados: " + EstadoDAO.QUERY_BUSCAR_TODOS, e);
        }
    }

    @Override
    public void inserir(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizar(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
