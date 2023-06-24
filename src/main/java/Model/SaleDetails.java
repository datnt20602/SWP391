package Model;

public class SaleDetails {
    private int sale_detai_id;
    private int sale_id;
    private int quantity;
    private Product product;

    public SaleDetails() {
    }

    public SaleDetails(int sale_detai_id, int sale_id, int quantity, Product product) {
        this.sale_detai_id = sale_detai_id;
        this.sale_id = sale_id;
        this.quantity = quantity;
        this.product = product;
    }

    public int getSale_detai_id() {
        return sale_detai_id;
    }

    public void setSale_detai_id(int sale_detai_id) {
        this.sale_detai_id = sale_detai_id;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
