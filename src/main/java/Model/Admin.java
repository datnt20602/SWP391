package Model;

public class Admin {
    private int admin_id;
    private String name;
    private String email;
    private String phone;
    private int status;
    private String street;
    private String city;
    private String pass;

    public Admin() {
    }

    public Admin(int admin_id, String name, String email, String phone, int status,
                 String street, String city, String pass) {
        this.admin_id = admin_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.street = street;
        this.city = city;
        this.pass = pass;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
