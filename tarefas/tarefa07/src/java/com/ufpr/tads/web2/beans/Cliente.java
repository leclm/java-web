package com.ufpr.tads.web2.beans;
public class Cliente {    
    private int id_cliente;
    private String cpf_cliente;
    private String nome_cliente;
    private String email_cliente;
    private String data_cliente;
    private String rua_cliente;
    private int nr_cliente;
    private String cep_cliente;
    private String cidade_cliente;
    private String uf_cliente;     
  
    public Cliente() {
    }
    
    public Cliente(int id_cliente, String cpf_cliente, String nome_cliente, 
            String email_cliente, String data_cliente, String rua_cliente, 
            int nr_cliente, String cep_cliente, String cidade_cliente, String uf_cliente) {
        this.id_cliente = id_cliente;
        this.cpf_cliente = cpf_cliente;
        this.nome_cliente = nome_cliente;
        this.email_cliente = email_cliente;
        this.data_cliente = data_cliente;
        this.rua_cliente = rua_cliente;
        this.nr_cliente = nr_cliente;
        this.cep_cliente = cep_cliente;
        this.cidade_cliente = cidade_cliente;
        this.uf_cliente = uf_cliente;
    }
    
    
    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getEmail_cliente() {
        return email_cliente;
    }

    public void setEmail_cliente(String email_cliente) {
        this.email_cliente = email_cliente;
    }

    public String getData_cliente() {
        return data_cliente;
    }

    public void setData_cliente(String data_cliente) {
        this.data_cliente = data_cliente;
    }

    public String getRua_cliente() {
        return rua_cliente;
    }

    public void setRua_cliente(String rua_cliente) {
        this.rua_cliente = rua_cliente;
    }

    public int getNr_cliente() {
        return nr_cliente;
    }

    public void setNr_cliente(int nr_cliente) {
        this.nr_cliente = nr_cliente;
    }

    public String getCep_cliente() {
        return cep_cliente;
    }

    public void setCep_cliente(String cep_cliente) {
        this.cep_cliente = cep_cliente;
    }

    public String getCidade_cliente() {
        return cidade_cliente;
    }

    public void setCidade_cliente(String cidade_cliente) {
        this.cidade_cliente = cidade_cliente;
    }

    public String getUf_cliente() {
        return uf_cliente;
    }

    public void setUf_cliente(String uf_cliente) {
        this.uf_cliente = uf_cliente;
    }
}
