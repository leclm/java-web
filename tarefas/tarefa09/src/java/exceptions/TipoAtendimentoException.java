package exceptions;
public class TipoAtendimentoException extends AppException {
    public TipoAtendimentoException() {
        
    }
    
    public TipoAtendimentoException(String string) {
        super(string);
    }
    
    public TipoAtendimentoException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
