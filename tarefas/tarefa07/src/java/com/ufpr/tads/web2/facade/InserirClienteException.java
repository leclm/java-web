
package com.ufpr.tads.web2.facade;


public class InserirClienteException extends Exception {
    public InserirClienteException() {
    }
    public InserirClienteException(String string) {
        super(string);
    }
    public InserirClienteException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    } 
}
