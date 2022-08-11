/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;


public class Cliente {
    private int id;
    private String cpf;
    private String email;
    private String nome;
    private Date data;
    private String rua;
    private int numero;
    private String cep;
    private int idCidade;
    
    public Cliente() {}

    public Cliente(String cpf, String email, String nome, Date data, String rua, int numero, String cep, int idCidade) {
        this.cpf = cpf;
        this.email = email;
        this.nome = nome;
        this.data = data;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.idCidade = idCidade;
    }
    
    public Cliente(int id, String cpf, String email, String nome, Date data, String rua, int numero, String cep, int idCidade) {
        this.id = id;
        this.cpf = cpf;
        this.email = email;
        this.nome = nome;
        this.data = data;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.idCidade = idCidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }
    
    public String getFormattedCpf() {
        String formattedCpf = "";
        for (int i = 0; i < 11; i++) {
            formattedCpf += this.cpf.charAt(i);
            if (i == 2 || i == 5)
                formattedCpf += ".";
            else if (i == 8)
                formattedCpf += "-";
        }
        return formattedCpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCep() {
        return cep;
    }
    
    public String getFormattedCep() {
        String formattedCep = "";
        for (int i = 0; i < 8; i++) {
            formattedCep += this.cep.charAt(i);
            if (i == 1)
                formattedCep += ".";
            if (i == 4)
                formattedCep += "-";
        }
        return formattedCep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public int getIdCidade() {
        return idCidade;
    }

    public void setIdCidade(int idCidade) {
        this.idCidade = idCidade;
    }
    
    
}
