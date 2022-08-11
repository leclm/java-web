package exceptions;
public class UsuarioException extends AppException {
    public UsuarioException() {
        
    }
    
    public UsuarioException(String string) {
        super(string);
    }
    
    public UsuarioException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
