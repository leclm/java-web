
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.ClienteDAO;
import java.sql.SQLException;
import java.util.List;

public class ClientesFacade extends ClienteDAO{
    
    public boolean inserirCliente (Cliente c) throws InserirClienteException{
        try {
            return super.insert(c); 
        } catch (SQLException erro){
            throw new InserirClienteException("Erro inserindo o cliente de ID: " + c.getId_cliente(), erro);
        } 
    }
    
    public boolean removerCliente (Cliente c) throws RemoverClienteException{
        try{
            return super.delete(c);
        } catch (SQLException erro){
            throw new RemoverClienteException("Erro removendo o cliente de ID: " + c.getId_cliente(), erro);
        } 
    } 
    
    public boolean alterarCliente (Cliente c) throws AlterarClienteException{
        try{
            return super.update(c);
        } catch (SQLException erro){
            throw new AlterarClienteException("Erro alterando o cliente de ID: " + c.getId_cliente(), erro);
        } 
    } 
    
    public Cliente buscarCliente(Cliente c){
        return super.select(c);
    }
    
    public List<Cliente> buscarTodosOsClientes(){
        return super.selectAll();
    }
}
