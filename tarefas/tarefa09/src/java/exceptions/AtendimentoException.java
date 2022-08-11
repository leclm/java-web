package exceptions;
public class AtendimentoException extends AppException {
    public AtendimentoException() {
        
    }
    
    public AtendimentoException(String string) {
        super(string);
    }
    
    public AtendimentoException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
