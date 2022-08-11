/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package facade;

import database.ConnectionFactory;
import exceptions.LoginException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import models.Usuario;
import models.dao.UsuarioDAO;


public class LoginFacade {
    public static boolean validLogin(String login, String password, ConnectionFactory factory) throws LoginException {
        try {
            UsuarioDAO dao = new UsuarioDAO(factory.getConnection());
            List<Usuario> usuarios = dao.buscarTodos();
            String hashedPassword = getSecurePassword(password);
            return usuarios.stream().anyMatch(user -> user.getLogin().equals(login) && user.getPassword().equals(hashedPassword));
        } catch (Exception e) {
            throw new LoginException("Erro buscando validando login");
        }
    }
    
    public static Usuario getUserByLogin(String login, ConnectionFactory factory) throws LoginException {
        try {
            UsuarioDAO dao = new UsuarioDAO(factory.getConnection());
            Usuario usuario = dao.buscarPeloEmail(login);
            return usuario;
        } catch (Exception e) {
            throw new LoginException("Erro buscando usuário pelo login");
        }
    }

    private static String getSecurePassword(String passwordToHash) {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            md.update(passwordToHash.getBytes());

            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
              sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }
}
