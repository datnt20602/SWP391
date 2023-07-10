package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Store {
    private int store_id;
    private String store_name;
    private String phone;
    private String email;
    private String street;
    private String city;
    private int status;

}
