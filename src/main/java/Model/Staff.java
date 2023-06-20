package Model;

public class Staff {
    private int staff_id;
    private String name;
    private String email;
    private String phone;
    private int status;
    private int active;
    private String pass;


    public Staff() {
    }

    public Staff(int staff_id, String name, String email, String phone, int status, int active, String pass) {
        this.staff_id = staff_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.active = active;
        this.pass = pass;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
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

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
