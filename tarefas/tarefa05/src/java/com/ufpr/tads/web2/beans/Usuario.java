package com.ufpr.tads.web2.beans;

/**
 *
 * @author lelim
 */
public final class Usuario {
    private int id;
    private String nome;
    private String login;
    private String senha;
    
    public Usuario(){
    }
    
    public Usuario(String nome, String login, String senha){
        this.setNome(nome);
        this.setLogin(login);
        this.setSenha(senha);
    }
    
    public int getId() { return id; }
    public String getNome() { return nome; }
    public String getLogin() { return login; }
    public String getSenha() { return senha; }
    
    public void setId(int id) { this.id = id; }
    public void setNome(String nome) { this.nome = nome; }
    public void setLogin(String login) { this.login = login; }
    public void setSenha(String senha) { this.senha = senha; }
}
