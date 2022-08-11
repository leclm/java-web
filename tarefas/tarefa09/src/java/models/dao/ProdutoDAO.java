/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import database.DAO;
import database.DAOException;
import models.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO implements DAO<Produto> {
    private static final String QUERY_BUSCAR = "SELECT * FROM tb_produto WHERE id_produto = (?)";
    private static final String QUERY_BUSCAR_TODOS = "SELECT * FROM tb_produto";

    private Connection con = null;

    public ProdutoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar AtendimentoDAO.");
        }
        this.con = con;
    }
    
    @Override
    public Produto buscar(long id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ProdutoDAO.QUERY_BUSCAR)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next())
                    return new Produto(
                            rs.getInt("id_produto"),
                            rs.getString("nome_produto")
                    );
            }
            return null;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando produto: " + ProdutoDAO.QUERY_BUSCAR, e);
        }
    }

    @Override
    public List<Produto> buscarTodos() throws DAOException {
        List<Produto> produtos = new ArrayList<>();
        try (PreparedStatement st = this.con.prepareStatement(ProdutoDAO.QUERY_BUSCAR_TODOS); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Produto produto = new Produto(
                            rs.getInt("id_produto"),
                            rs.getString("nome_produto")
                );
                produtos.add(produto);
            }
            return produtos;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando todos os produtos: " + ProdutoDAO.QUERY_BUSCAR_TODOS, e);
        }
    }

    @Override
    public void inserir(Produto t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizar(Produto t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(Produto t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
