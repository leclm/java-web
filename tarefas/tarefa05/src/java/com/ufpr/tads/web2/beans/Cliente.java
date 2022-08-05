package com.ufpr.tads.web2.beans;

/**
 *
 * @author lelim
 */
public class Cliente {    
    private int id;
    private String cpf;
    private String nome;
    private String email;
    private String data;
    private String rua;
    private int nr;
    private String cep;
    private String cidade;
    private String uf; 
    
    public Cliente() {    
    }  
    public Cliente(int id, String cpf, String nome, 
            String email, String data, String rua, 
            int nr, String cep, String cidade, String uf) {
        this.id = id;
        this.cpf = cpf;
        this.nome = nome;
        this.email = email;
        this.data = data;
        this.rua = rua;
        this.nr = nr;
        this.cep = cep;
        this.cidade = cidade;
        this.uf = uf;
    }
    
    public int getId() { return id; }
    
    public String getCpf() { return cpf; }
    
    public String getNome() { return nome; }

    public String getEmail() { return email; }

    public String getData() { return data; }

    public String getRua() { return rua; }

    public int getNr() { return nr; }

    public String getCep() { return cep; }

    public String getCidade() { return cidade; }

    public String getUf() { return uf; }
   
    public void setId(int id) { this.id = id; }
    
    public void setCpf(String cpf) { this.cpf = cpf; }
    
    public void setNome(String nome) { this.nome = nome; }
    
    public void setEmail(String email) { this.email = email; }
    
    public void setData(String data) { this.data = data; }
    
    public void setRua(String rua) { this.rua = rua; }
    
    public void setNr(int nr) { this.nr = nr; }
    
    public void setCep(String cep) { this.cep = cep; }
    
    public void setCidade(String cidade) { this.cidade = cidade; }
    
    public void setUf(String uf) { this.uf = uf; }
}
