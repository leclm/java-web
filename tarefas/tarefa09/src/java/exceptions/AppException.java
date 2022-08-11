package exceptions;

public class AppException extends Exception {
    public AppException() {
        
    }
    
    public AppException(String string) {
        super(string);
    }
    
    public AppException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
