package beans;

import java.io.Serializable;
public class LoginBean implements Serializable {
    private String name;
    private int id;
    
    public LoginBean() {
    }

    public LoginBean(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
