package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Address {
    private int address_id;
    private Customer customer;
    private String name;
    private String email;
    private String phone;
    private String address_name;
    private String ten_goi_nho;
    private String city;
    private String district;
    private String ward;
}

