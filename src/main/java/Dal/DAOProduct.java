package Dal;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProduct extends DBContext{
    public int addProductbyPre(Product pro) {
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`product`\n" +
                "(`product_id`,\n" +
                "`product_name`,\n" +
                "`price`,\n" +
                "`category_name`,\n" +
                "`image`,\n" +
                "`describe`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?);";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, pro.getProduct_id());
            pre.setString(2, pro.getProduct_name());
            pre.setDouble(3, pro.getPrice());
            pre.setString(4, pro.getCategory_name());
            pre.setString(5, pro.getImage());
            pre.setString(6,pro.getDescribe());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public Vector<Product> getAll() {
        Vector<Product> vector = new Vector<Product>();
        String sql = "select * from product";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                Product pro = new Product(id,name, categoryName, price, image, describe,volume);
//                System.out.println(pro.toString());
                vector.add(pro);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }
    public int updateProduct(Product pro) {
        int n = 0;

        String sql = "UPDATE `drink_online_shop1`.`product`\n" +
                "SET\n" +
                "`product_name` = ?,\n" +
                "`price` = ?,\n" +
                "`category_name` = ?,\n" +
                "`image` = ?,\n" +
                "`describe` = ?\n" +
                "`volume` = ?\n" +
                "WHERE `product_id` = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);

            pre.setString(1, pro.getProduct_name());
            pre.setDouble(2,pro.getPrice());
            pre.setString(3, pro.getCategory_name());
            pre.setString(4, pro.getImage());
            pre.setString(5, pro.getDescribe());
            pre.setInt(6, pro.getVolume());
            pre.setInt(7, pro.getProduct_id());
            //run
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }


    public static void main(String[] args) {

        DAOCustomer dao = new DAOCustomer();
        if(dao.login("minhdnhe161535@fpt.edu.vn", "Minh2002") == null){
            System.out.println( "nullllll");
        }
    }

}
