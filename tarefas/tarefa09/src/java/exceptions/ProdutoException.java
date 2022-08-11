package exceptions;

public class ProdutoException extends AppException {
    public ProdutoException() {
        
    }
    
    public ProdutoException(String string) {
        super(string);
    }
    
    public ProdutoException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
}
