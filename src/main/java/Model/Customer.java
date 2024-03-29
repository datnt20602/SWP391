package Model;

import com.google.gson.Gson;

public class Customer {
    private int customer_id;
    private String name;
    private String phone;
    private String email;
    private String pass;
    private int status;

    private int gender;

    private String birthday;

    public Customer() {
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Customer(int customer_id, String name, String phone, String email, String pass, int status, int gender, String birthday) {
        this.customer_id = customer_id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.pass = pass;
        this.status = status;
        this.gender = gender;
        this.birthday = birthday;
    }

    public Customer(int customer_id, String name, String phone, String email, String pass, int status) {
        this.customer_id = customer_id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.pass = pass;
        this.status = status;
    }



    public Customer(String name, String phone, String email, String pass, int status) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.pass = pass;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customer_id=" + customer_id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", pass='" + pass + '\'' +
                ", status=" + status +
                '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String toJson() {
        return new Gson().toJson(this);
    }
}
