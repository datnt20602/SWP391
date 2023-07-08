package Model;

public class Address {
    private int address_id;
    private String name;
    private String email;
    private String phone ;
    private String address_name;
    private String ten_goi_nho;

    public Address() {
    }

    @Override
    public String toString() {
        return "Address{" +
                "address_id=" + address_id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address_name='" + address_name + '\'' +
                ", ten_goi_nho='" + ten_goi_nho + '\'' +
                '}';
    }

    public Address(int address_id, String name, String email, String phone, String address_name, String ten_goi_nho) {
        this.address_id = address_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address_name = address_name;
        this.ten_goi_nho = ten_goi_nho;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
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

    public String getAddress_name() {
        return address_name;
    }

    public void setAddress_name(String address_name) {
        this.address_name = address_name;
    }

    public String getTen_goi_nho() {
        return ten_goi_nho;
    }

    public void setTen_goi_nho(String ten_goi_nho) {
        this.ten_goi_nho = ten_goi_nho;
    }
}
