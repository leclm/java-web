package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 *
 * @author lelim
 */
public class LoginBean implements Serializable {
    private int id;
    private String nome;
    
    public int getId() { return id; }

    public String getNome() { return nome; }
    
    public void setId(int id) { this.id = id; }

    public void setNome(String nome) { this.nome = nome; }
}
