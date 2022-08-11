package exceptions;
public class ClienteException extends AppException {
    public ClienteException() {
        
    }
    
    public ClienteException(String string) {
        super(string);
    }
    
    public ClienteException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
