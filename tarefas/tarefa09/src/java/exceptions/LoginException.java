package exceptions;
public class LoginException extends AppException {
    public LoginException() {
        
    }
    
    public LoginException(String string) {
        super(string);
    }
    
    public LoginException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
