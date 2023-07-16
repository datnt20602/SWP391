package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order_item {
    private int item_id;
    private Product product;
    private int quantity;
    private double price;
    private double discount;

    private Order order;
    private String feedback  = null;
    private String feedback_date = null;
    private double start_rating = 0;


}
