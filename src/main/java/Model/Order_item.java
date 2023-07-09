package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order_item {
    private Order order;
    private int item_id;
    private Product product;
    private int quantity;
    private double price;
    private double discount;
    private String feedback;
    private String feedback_date;
    private double start_rating;
}
