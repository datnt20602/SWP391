package Model;

import com.google.gson.Gson;

public class Staff {
    private int staff_id;
    private String name;
    private String email;
    private String phone;
    private int active;

    private int admin_id;
    private String pass;


    public Staff() {
    }

    public Staff(int staff_id, String name, String email, String phone, int active, String pass) {
        this.staff_id = staff_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.active = active;
        this.pass = pass;
    }

    public Staff(String name, String email, String phone, String pass, int active, int admin_id) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.pass = pass;
        this.active = active;
        this.admin_id = admin_id;
    }



    public Staff(int staff_id, String name, String email, String phone, int active, int admin_id, String pass) {
        this.staff_id = staff_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.active = active;
        this.admin_id = admin_id;
        this.pass = pass;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staff_id=" + staff_id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", active=" + active +
                ", pass='" + pass + '\'' +
                '}';
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

    public int getActive() {
        return active ;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String toJson() {
        return new Gson().toJson(this);
    }
}
