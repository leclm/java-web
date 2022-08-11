/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;


public class Cidade {
    private int id, idEstado;
    private String nome;

    public Cidade() {
    }
    
    public Cidade(int idEstado, String nome) {
        this.idEstado = idEstado;
        this.nome = nome;
    }
    
    public Cidade(int id, int idEstado, String nome) {
        this.id = id;
        this.idEstado = idEstado;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    
}
