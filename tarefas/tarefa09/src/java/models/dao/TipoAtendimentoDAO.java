/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import database.DAO;
import database.DAOException;
import models.TipoAtendimento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoAtendimentoDAO implements DAO<TipoAtendimento> {
    private static final String QUERY_BUSCAR = "SELECT * FROM tb_tipo_atendimento WHERE id_tipo_atendimento = (?)";
    private static final String QUERY_BUSCAR_TODOS = "SELECT * FROM tb_tipo_atendimento";

    private Connection con = null;

    public TipoAtendimentoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar AtendimentoDAO.");
        }
        this.con = con;
    }
    
    @Override
    public TipoAtendimento buscar(long id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(TipoAtendimentoDAO.QUERY_BUSCAR)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next())
                    return new TipoAtendimento(
                            rs.getInt("id_tipo_atendimento"),
                            rs.getString("nome_tipo_atendimento")
                    );
            }
            return null;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando tipo de atendimento: " + TipoAtendimentoDAO.QUERY_BUSCAR, e);
        }
    }

    @Override
    public List<TipoAtendimento> buscarTodos() throws DAOException {
        List<TipoAtendimento> tipos = new ArrayList<>();
        try (PreparedStatement st = this.con.prepareStatement(TipoAtendimentoDAO.QUERY_BUSCAR_TODOS); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                TipoAtendimento tipo = new TipoAtendimento(
                            rs.getInt("id_tipo_atendimento"),
                            rs.getString("nome_tipo_atendimento")
                );
                tipos.add(tipo);
            }
            return tipos;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando todos os tipos de atendimentos: " + TipoAtendimentoDAO.QUERY_BUSCAR_TODOS, e);
        }
    }

    @Override
    public void inserir(TipoAtendimento t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizar(TipoAtendimento t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(TipoAtendimento t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
