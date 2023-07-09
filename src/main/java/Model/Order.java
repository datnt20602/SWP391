package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int order_id;
    private Customer customer;
    private int order_status;
    private String order_date;
    private String required_date;
    private String shipped_date;
    private Staff staff;
    private Store store;
    private double total_money;
}
