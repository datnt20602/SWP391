package Model;

import com.google.gson.Gson;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Feedback {
    private Customer customer;
    private Product product;
    private int feedback_id;
    private String date;
    private  String content;
    private int star_rate;

    public String toJson() {
        return new Gson().toJson(this);
    }
}
