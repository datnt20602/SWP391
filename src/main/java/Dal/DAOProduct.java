package Dal;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProduct extends DBContext{
//    public int addProductbyPre(Product pro) {
//        int n = 0;
//        String sql = "IINSERT INTO `drink_online_shop1`.`product`\n" +
//                "(`product_id`,\n" +
//                "`product_name`,\n" +
//                "`date_of_manufacture`,\n" +
//                "`price`,\n" +
//                "`category_name`,\n" +
//                "`image`,\n" +
//                "`quantity`,\n" +
//                "`describe`)\n" +
//                "VALUES\n" +
//                "(?,?,?,?,?,?,?,?)";
//
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            pre.setInt(1, pro.getProduct_id());
//            pre.setString(2, pro.getProduct_name());
//            pre.setString(3, pro.getDate_of_manufacture());
//            pre.setDouble(4, pro.getPrice());
//            pre.setString(5, pro.getCategory_name());
//            pre.setString(6, pro.getImage());
//            pre.setInt(7, pro.getQuantity());
//            pre.setString(8,pro.getDescribe());
//            n = pre.executeUpdate();
//        } catch (SQLException e) {
//            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return n;
//    }

    public static void main(String[] args) {
        Product pro = new Product();
    }

}
