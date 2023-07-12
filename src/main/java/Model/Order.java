package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
    private int order_id;
    private String order_date;
    private int order_status;
    private String required_date;
    private String shipped_date;
    private Customer customer;
    private int payment_methods;
    private Address address;

}
