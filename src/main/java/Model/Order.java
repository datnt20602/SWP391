package Model;

public class Order {
    private int order_id;
    private String order_date;
    private String required_date;
    private String shipped_date;
    private int order_status;

    private int payment_methods;


    public Order() {
    }

    public Order(int order_id, String order_date, String required_date, String shipped_date, int order_status, int payment_methods) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.required_date = required_date;
        this.shipped_date = shipped_date;
        this.order_status = order_status;
        this.payment_methods = payment_methods;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getRequired_date() {
        return required_date;
    }

    public void setRequired_date(String required_date) {
        this.required_date = required_date;
    }

    public String getShipped_date() {
        return shipped_date;
    }

    public void setShipped_date(String shipped_date) {
        this.shipped_date = shipped_date;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public int getPayment_methods() {
        return payment_methods;
    }

    public void setPayment_methods(int payment_methods) {
        this.payment_methods = payment_methods;
    }
}
