package Dal;

import Model.Customer;
import Model.Product;
import Model.Staff;
import Model.Wishlist;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOWishlist extends  DBContext{
    public int insertWishList (int  cus_id, int pro_id, int wishlist_id){
        int n = 0;
        String sql ="INSERT INTO `drink_online_shop1`.`wishlist`\n" +
                "(`idwishlist`,\n" +
                "`customer_id`,\n" +
                "`product_id`)\n" +
                "VALUES\n" +
                "(?,?,?);";
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,wishlist_id);
            pre.setInt(2,cus_id);
            pre.setInt(3,pro_id);
            n = pre.executeUpdate();
        }catch (SQLException ex){
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Wishlist getAll(int cus_id) {
        Wishlist wishlist = new Wishlist() ;
        ResultSet rs = this.getData("Select * from wishlist where customer_id = "+cus_id);
        ArrayList<Integer> pro_list = new ArrayList<>();
        int wishlist_id = 0;
        try {
            int i = 0;
            while (rs.next()) {
                pro_list.add(Integer.parseInt(rs.getString("product_id")));
                wishlist_id = Integer.parseInt(rs.getString("idwishlist"));
                System.out.println(rs.getString("idwishlist"));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        wishlist.setWishlist_id(wishlist_id);
        wishlist.setPro_list(pro_list);
        wishlist.setCus(cus_id);
        return wishlist;
    }
    public int quantityWishList (){
        String sql = "SELECT * FROM wishlist ORDER BY idwishlist DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try{
            while (rs.next()){
                n = Integer.parseInt(rs.getString("idwishlist"));
            }
        }catch (SQLException e){
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public void removeWishlist(int cus_id, int pro_id){
        String sql = "DELETE FROM `drink_online_shop1`.`wishlist`\n" +
                "WHERE customer_id = "+cus_id+" and product_id ="+pro_id+"";
        try {
            Statement state = connection.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int totalWishList (int cus_id){
        int n = 0;
        String sql = "SELECT count(product_id) as quantity FROM drink_online_shop1.wishlist where customer_id = ?;";
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,cus_id);
            ResultSet rs = pre.executeQuery();
            try {
                while (rs.next()) {
                    n = rs.getInt("quantity");
                }
            } catch (SQLException e) {
                Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public static void main(String[] args) {
        DAOStaff dao = new DAOStaff();

        System.out.println(dao.login("account2@gmail.com", "12345"));
    }
}
