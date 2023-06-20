package Model;

public class Consignment {
    private int consignment_id;
    private String date;
    private int store_id;
    private int  staff_id;
    private int status;

    public Consignment() {
    }

    public Consignment(int consignment_id, String date, int store_id, int staff_id, int status) {
        this.consignment_id = consignment_id;
        this.date = date;
        this.store_id = store_id;
        this.staff_id = staff_id;
        this.status = status;
    }

    public int getConsignment_id() {
        return consignment_id;
    }

    public void setConsignment_id(int consignment_id) {
        this.consignment_id = consignment_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
