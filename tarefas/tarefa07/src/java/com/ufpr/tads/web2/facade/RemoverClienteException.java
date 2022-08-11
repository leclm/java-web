package com.ufpr.tads.web2.facade;

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
