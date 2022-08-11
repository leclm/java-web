package com.ufpr.tads.web2.beans;

import java.io.Serializable;

public class LoginBean implements Serializable {
    private int idUsuario;
    private String nomeUsuario;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }    
}
