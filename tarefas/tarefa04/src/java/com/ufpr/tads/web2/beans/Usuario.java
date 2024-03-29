/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ufpr.tads.web2.beans;

/**
 *
 * @author lelim
 */
public class Usuario {
    private int id;
    private String name;
    private String email;
    private String pw;
    
    public Usuario(){
    }
    
    public Usuario(String paramName, String paramEmail, String paramPw){
        name = paramName;
        email = paramEmail;
        pw = paramPw;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }
}
