package Model;

public class ProductInConsignment {
    private int consignment_id;
    private Product product;
    private int quantity;
    private double entry_price;
    private String manufacturing_date;

    public ProductInConsignment() {
    }

    public ProductInConsignment(int consignment_id, Product product, int quantity,
                                double entry_price, String manufacturing_date) {
        this.consignment_id = consignment_id;
        this.product = product;
        this.quantity = quantity;
        this.entry_price = entry_price;
        this.manufacturing_date = manufacturing_date;
    }

    public int getConsignment_id() {
        return consignment_id;
    }

    public void setConsignment_id(int consignment_id) {
        this.consignment_id = consignment_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getEntry_price() {
        return entry_price;
    }

    public void setEntry_price(double entry_price) {
        this.entry_price = entry_price;
    }

    public String getManufacturing_date() {
        return manufacturing_date;
    }

    public void setManufacturing_date(String manufacturing_date) {
        this.manufacturing_date = manufacturing_date;
    }
}
