package database;

import java.util.List;

public interface DAO<T> {
    T buscar(long id) throws DAOException;
    List<T> buscarTodos() throws DAOException;
    void inserir(T t) throws DAOException;
    void atualizar(T t) throws DAOException;
    void remover(T t) throws DAOException;
}
