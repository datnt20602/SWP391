package Model;

public class Product {
    private int product_id;
    private String product_name;
    private String category_name;
    private double price;
    private String image;
    private String describe;

    public Product() {
    }

    public Product(int product_id, String product_name, String category_name, double price, String image, String describe) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.category_name = category_name;
        this.price = price;
        this.image = image;
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "Product{" +
                "product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", category_name='" + category_name + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", describe='" + describe + '\'' +
                '}';
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
