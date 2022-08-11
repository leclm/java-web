package exceptions;

public class EstadoException extends AppException {
    public EstadoException() {
        
    }
    
    public EstadoException(String string) {
        super(string);
    }
    
    public EstadoException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
