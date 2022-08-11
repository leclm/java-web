/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import database.ConnectionFactory;
import exceptions.ClienteException;
import java.util.List;
import models.Cliente;
import models.dao.ClienteDAO;
import java.sql.Connection;


public class ClientesFacade {
    
    public static void inserir(Cliente c) throws ClienteException {
        try (Connection con = new ConnectionFactory().getConnection()) {
            if (clientAlreadyExists(c)) throw new ClienteException("Já existe cliente com este login, nome ou cpf.");
            ClienteDAO dao = new ClienteDAO(con);
            dao.inserir(c);
        } catch (Exception e) {
            throw new ClienteException("Erro inserindo cliente");
        }
    }
    
    public static void alterar(Cliente c) throws ClienteException {
        try (Connection con = new ConnectionFactory().getConnection()) {
            if (clientAlreadyExists(c)) throw new ClienteException("Já existe cliente com este login, nome ou cpf.");
            ClienteDAO dao = new ClienteDAO(con);
            dao.atualizar(c);
        } catch (Exception e) {
            throw new ClienteException("Erro alterando cliente");
        }
    }
    
    public static Cliente buscar(int id) throws ClienteException {
        Cliente cliente;
        try (Connection con = new ConnectionFactory().getConnection()) {
            ClienteDAO dao = new ClienteDAO(con);
            cliente = dao.buscar(id);
        } catch (Exception e) {
            throw new ClienteException("Erro buscando cliente");
        }
        return cliente;
    }
    
    public static List<Cliente> buscarTodos() throws ClienteException {
        List<Cliente> clientes;
        try (Connection con = new ConnectionFactory().getConnection()) {
            ClienteDAO dao = new ClienteDAO(con);
            clientes = dao.buscarTodos();
        } catch (Exception e) {
            throw new ClienteException("Erro buscando todos os clientes");
        }
        return clientes;
    }
    
    public static void remover(Cliente c) throws ClienteException {
        try (Connection con = new ConnectionFactory().getConnection()) {
            ClienteDAO dao = new ClienteDAO(con);
            dao.remover(c);
        } catch (Exception e) {
            throw new ClienteException("Erro removendo cliente");
        }
    }
    
    private static boolean clientAlreadyExists(Cliente c) throws ClienteException {
        List<Cliente> clients = ClientesFacade.buscarTodos();
        return clients.stream().anyMatch(client -> client.getId() != c.getId() && (client.getNome().equals(c.getNome()) || client.getEmail().equals(c.getEmail()) || client.getCpf().equals(c.getCpf())));
    }
}
