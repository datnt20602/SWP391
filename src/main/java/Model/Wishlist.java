package Model;

import java.util.List;

public class Wishlist {
    private int wishlist_id ;
    private List<Integer> pro_list;
    private Customer cus;

    public Wishlist(int wishlist_id, List<Integer> pro_list, int cus_id) {
    }

    public Wishlist(int wishlist_id, List<Integer> pro_list, Customer cus) {
        this.wishlist_id = wishlist_id;
        this.pro_list = pro_list;
        this.cus = cus;
    }

    public int getWishlist_id() {
        return wishlist_id;
    }

    public void setWishlist_id(int wishlist_id) {
        this.wishlist_id = wishlist_id;
    }

    public List<Integer> getPro_list() {
        return pro_list;
    }

    public void setPro_list(List<Integer> pro_list) {
        this.pro_list = pro_list;
    }

    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }
}
