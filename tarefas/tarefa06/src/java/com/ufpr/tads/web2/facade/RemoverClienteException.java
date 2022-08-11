/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

/**
 *
 * @author lelim
 */
public class RemoverClienteException extends Exception {
    public RemoverClienteException() {
    }
    public RemoverClienteException(String string) {
        super(string);
    }
    public RemoverClienteException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }  
}
