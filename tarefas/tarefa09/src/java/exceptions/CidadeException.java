package exceptions;

public class CidadeException extends AppException {
    public CidadeException() {
        
    }
    
    public CidadeException(String string) {
        super(string);
    }
    
    public CidadeException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
