package Dal;

import Model.Customer;
import Model.Product;
import Model.Wishlist;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        Wishlist wishlist ;
        ResultSet rs = this.getData("Select * from wishlist where idwishlist = "+cus_id);
        List<Integer> pro_list = null;
        int wishlist_id = 0;
        try {
            int i = 0;
            while (rs.next()) {
                pro_list.add(Integer.parseInt(rs.getString("product_id")));
                wishlist_id = Integer.parseInt(rs.getString("idwishlist"));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        wishlist = new Wishlist(wishlist_id,pro_list,cus_id);
        return wishlist;
    }
    public int quantityWishList (){
        String sql = "select COUNT(*) as soluong from wishlist";
        ResultSet rs = this.getData(sql);
        int n = 0;

        try {
            while (rs.next()){
                 n = rs.getInt("soluong");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return n;
    }
}
