/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import database.ConnectionFactory;
import exceptions.TipoAtendimentoException;
import java.sql.Connection;
import java.util.List;
import models.TipoAtendimento;
import models.dao.TipoAtendimentoDAO;


public class TipoAtendimentoFacade {
    public static TipoAtendimento buscar(int id) throws TipoAtendimentoException {
        TipoAtendimento tipoAtendimento;
        try (Connection con = new ConnectionFactory().getConnection()) {
            TipoAtendimentoDAO dao = new TipoAtendimentoDAO(con);
            tipoAtendimento = dao.buscar(id);
        } catch (Exception e) {
            throw new TipoAtendimentoException("Erro buscando tipo de atendimento");
        }
        return tipoAtendimento;
    }

    public static List<TipoAtendimento> buscarTodos() throws TipoAtendimentoException {
        List<TipoAtendimento> tipoAtendimentos;
        try (Connection con = new ConnectionFactory().getConnection()) {
            TipoAtendimentoDAO dao = new TipoAtendimentoDAO(con);
            tipoAtendimentos = dao.buscarTodos();
        } catch (Exception e) {
            throw new TipoAtendimentoException("Erro buscando todos os tipos de atendimento");
        }
        return tipoAtendimentos;
    }
}
