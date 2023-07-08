package Model;

public class Order_item {
    private int item_id;
    private Product product;
    private int quantity;
    private double price;
    private double discount;

    private String feedback  = null;
    private String feedback_date = null;
    private double start_rating = 0;

    private String order_status  = null;


    public Order_item() {
    }

    public Order_item(int item_id, Product product, int quantity, double price,
                      double discount) {
        this.item_id = item_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
    }

    public Order_item(int item_id, Product product, int quantity, double price, double discount, String feedback, String feedback_date, double start_rating, String order_status) {
        this.item_id = item_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.feedback = feedback;
        this.feedback_date = feedback_date;
        this.start_rating = start_rating;
        this.order_status = order_status;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getFeedback_date() {
        return feedback_date;
    }

    public void setFeedback_date(String feedback_date) {
        this.feedback_date = feedback_date;
    }

    public double getStart_rating() {
        return start_rating;
    }

    public void setStart_rating(double start_rating) {
        this.start_rating = start_rating;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

}
