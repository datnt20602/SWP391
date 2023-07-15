package Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Feedback {
    private Customer customer;
    private Product product;
    private int feedback_id;
    private String date;
    private  String content;
    private int star_rate;
}
