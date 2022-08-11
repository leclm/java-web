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
import models.Cidade;


public class CidadeDAO implements DAO<Cidade> {
    private static final String QUERY_BUSCAR_CIDADE = "SELECT id_cidade, nome_cidade, id_estado FROM tb_cidade WHERE id_cidade = (?)";
    private static final String QUERY_BUSCAR_ESTADO = "SELECT id_cidade, nome_cidade, id_estado FROM tb_cidade WHERE id_estado = (?)";
    private Connection con = null;
    
    public CidadeDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar CidadeDAO.");
        }
        this.con = con;
    }

    @Override
    public Cidade buscar(long id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(CidadeDAO.QUERY_BUSCAR_CIDADE)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next())
                    return new Cidade(
                            rs.getInt("id_cidade"),
                            rs.getInt("id_estado"),
                            rs.getString("nome_cidade")
                    );
            }
            return null;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando cidade: " + CidadeDAO.QUERY_BUSCAR_CIDADE, e);
        }
    }
    
    public List<Cidade> buscarPorEstado(long id) throws DAOException {
        List<Cidade> cidades = new ArrayList<>();
        try (PreparedStatement st = con.prepareStatement(CidadeDAO.QUERY_BUSCAR_ESTADO)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next())
                    cidades.add(new Cidade(
                            rs.getInt("id_cidade"),
                            rs.getInt("id_estado"),
                            rs.getString("nome_cidade")
                    ));
            }
            return cidades;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando cidades: " + CidadeDAO.QUERY_BUSCAR_ESTADO, e);
        }
    }

    @Override
    public List<Cidade> buscarTodos() throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void inserir(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizar(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
