package Model;

public class Sale {
    private int sale_id;
    private String start_time;
    private double sale_time;
    private double sale_percent;
    private int admin_id;

    public Sale() {
    }

    public Sale(int sale_id, String start_time, double sale_time, double sale_percent, int admin_id) {
        this.sale_id = sale_id;
        this.start_time = start_time;
        this.sale_time = sale_time;
        this.sale_percent = sale_percent;
        this.admin_id = admin_id;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public double getSale_time() {
        return sale_time;
    }

    public void setSale_time(double sale_time) {
        this.sale_time = sale_time;
    }

    public double getSale_percent() {
        return sale_percent;
    }

    public void setSale_percent(double sale_percent) {
        this.sale_percent = sale_percent;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
}
