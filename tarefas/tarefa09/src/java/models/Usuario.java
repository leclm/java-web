/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;


public class Usuario implements Serializable {
    private int id;
    private String login;
    private String name;
    private String password;
    
    public Usuario() {
        
    }
    
    public Usuario(String login, String name, String password) {
        this.login = login;
        this.name = name;
        this.password = password;
    }
    
    public Usuario(int id, String login, String name, String password) {
        this.id = id;
        this.login = login;
        this.name = name;
        this.password = password;
    }
    
    public String toString() {
        return "id=" + this.id + " / nome=" + this.name;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
