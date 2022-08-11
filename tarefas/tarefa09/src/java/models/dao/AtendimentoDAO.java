/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import database.DAO;
import database.DAOException;
import java.sql.Timestamp;
import models.Atendimento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Cliente;
import models.Produto;
import models.TipoAtendimento;
import models.Usuario;


public class AtendimentoDAO implements DAO<Atendimento> {
    private static final String QUERY_INSERIR = "INSERT INTO tb_atendimento (id_produto, id_tipo_atendimento, id_usuario, id_cliente, dsc_atendimento, res_atendimento, dt_hr_atendimento) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String QUERY_BUSCAR = "SELECT * FROM tb_atendimento WHERE id_atendimento = (?)";
    private static final String QUERY_BUSCAR_TODOS = "SELECT * FROM tb_atendimento WHERE id_usuario = (?)";

    private Connection con = null;

    public AtendimentoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar AtendimentoDAO.");
        }
        this.con = con;
    }
    
    @Override
    public Atendimento buscar(long id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(AtendimentoDAO.QUERY_BUSCAR)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Produto produto = new ProdutoDAO(this.con).buscar(rs.getInt("id_produto"));
                    TipoAtendimento tipoAtendimento = new TipoAtendimentoDAO(this.con).buscar(rs.getInt("id_tipo_atendimento"));
                    Usuario usuario = new UsuarioDAO(this.con).buscar(rs.getInt("id_usuario"));
                    Cliente cliente = new ClienteDAO(this.con).buscar(rs.getInt("id_cliente"));
                    return new Atendimento(
                            rs.getInt("id_atendimento"),
                            produto,
                            tipoAtendimento,
                            usuario,
                            cliente,
                            rs.getString("dsc_atendimento"),
                            rs.getString("res_atendimento").charAt(0),
                            rs.getTimestamp("dt_hr_atendimento").toLocalDateTime()
                    );
                }
            }
            return null;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando atendimento: " + AtendimentoDAO.QUERY_BUSCAR, e);
        }
    }

    public List<Atendimento> buscarTodos(long id) throws DAOException {
        List<Atendimento> atendimentos = new ArrayList<>();
        try (PreparedStatement st = this.con.prepareStatement(AtendimentoDAO.QUERY_BUSCAR_TODOS)) {
            st.setLong(1, id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Produto produto = new ProdutoDAO(this.con).buscar(rs.getInt("id_produto"));
                    TipoAtendimento tipoAtendimento = new TipoAtendimentoDAO(this.con).buscar(rs.getInt("id_tipo_atendimento"));
                    Usuario usuario = new UsuarioDAO(this.con).buscar(rs.getInt("id_usuario"));
                    Cliente cliente = new ClienteDAO(this.con).buscar(rs.getInt("id_cliente"));
                    Atendimento atendimento = new Atendimento(
                            rs.getInt("id_atendimento"),
                            produto,
                            tipoAtendimento,
                            usuario,
                            cliente,
                            rs.getString("dsc_atendimento"),
                            rs.getString("res_atendimento").charAt(0),
                            rs.getTimestamp("dt_hr_atendimento").toLocalDateTime()
                    );
                    atendimentos.add(atendimento);
                }
            }
            return atendimentos;
        } catch (SQLException e) {
            throw new DAOException("Erro buscando todos os atendimentos: " + AtendimentoDAO.QUERY_BUSCAR_TODOS, e);
        }
    }

    @Override
    public void inserir(Atendimento a) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(AtendimentoDAO.QUERY_INSERIR)) {
            st.setInt(1, a.getProduto().getId());
            st.setInt(2, a.getTipoAtendimento().getId());
            st.setInt(3, a.getUsuario().getId());
            st.setInt(4, a.getCliente().getId());
            st.setString(5, a.getDscAtendimento());
            st.setString(6, String.valueOf(a.getResAtendimento()));
            st.setTimestamp(7, Timestamp.valueOf(a.getDtHrAtendimento()));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException("Erro inserindo atendimento: " + AtendimentoDAO.QUERY_INSERIR + "/ " + a.toString(), e);
        }
    }

    @Override
    public void atualizar(Atendimento t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remover(Atendimento t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Atendimento> buscarTodos() throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
