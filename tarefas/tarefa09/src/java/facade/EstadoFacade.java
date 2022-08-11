/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import database.ConnectionFactory;
import exceptions.EstadoException;
import java.sql.Connection;
import java.util.List;
import models.Estado;
import models.dao.EstadoDAO;


public class EstadoFacade {
    public static List<Estado> buscarTodos() throws EstadoException {
        List<Estado> estados;
        try (Connection con = new ConnectionFactory().getConnection()) {
            EstadoDAO dao = new EstadoDAO(con);
            estados = dao.buscarTodos();
        } catch (Exception e) {
            throw new EstadoException("Erro buscando estados");
        }
        return estados;
    }
}
