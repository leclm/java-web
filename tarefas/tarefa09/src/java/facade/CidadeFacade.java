/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import database.ConnectionFactory;
import database.DAOException;
import exceptions.CidadeException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.Cidade;
import models.dao.CidadeDAO;


public class CidadeFacade {
    public static List<Cidade> buscarPorEstado(int id) throws CidadeException {
        List<Cidade> cidades;
        try (Connection con = new ConnectionFactory().getConnection()) {
            CidadeDAO dao = new CidadeDAO(con);
            cidades = dao.buscarPorEstado(id);
        } catch (Exception e) {
            throw new CidadeException("Erro buscando cidade por estado");
        }
        return cidades;
    }

    public static Cidade buscar(int id) throws CidadeException {
        try (Connection con = new ConnectionFactory().getConnection()) {
            CidadeDAO dao = new CidadeDAO(con);
            return dao.buscar(id);
        } catch (Exception e) {
            throw new CidadeException("Erro buscando cidade por id");
        }
    }
}
