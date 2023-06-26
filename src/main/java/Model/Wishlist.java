package Model;

import java.util.ArrayList;
import java.util.List;

public class Wishlist {
    private int wishlist_id ;
    private ArrayList<Integer> pro_list = new ArrayList<>();
    private int cus;

    public Wishlist() {
    }

    public Wishlist(int wishlist_id, ArrayList<Integer> pro_list, int cus) {
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

    public ArrayList<Integer> getPro_list() {
        return pro_list;
    }

    public void setPro_list(ArrayList<Integer> pro_list) {
        this.pro_list = pro_list;
    }

    public int getCus() {
        return cus;
    }

    public void setCus(int cus) {
        this.cus = cus;
    }
}
