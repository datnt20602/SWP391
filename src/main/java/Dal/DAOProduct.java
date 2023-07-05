package Dal;
import Model.Customer;
import Model.Order;
import Model.Order_item;
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

    public Vector<Product> searchByName(String name){
        String sql = "SELECT * FROM drink_online_shop1.product where product_name like ?";
        Vector<Product> vector = new Vector<Product>();

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "'%"+name+"%'");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String nameP = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                Product pro = new Product(id,nameP, categoryName, price, image, describe,volume);
                vector.add(pro);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public Vector<Product> getAll(String sql) {
        Vector<Product> vector = new Vector<Product>();
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
                vector.add(pro);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }
    public Product getProductByID(int pro_id) {
        Product pro = new Product();
        ResultSet rs = this.getData("select * from product where product_id ="+pro_id+"");
        try {
            while (rs.next()) {
                String name = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                pro = new Product(pro_id,name, categoryName, price, image, describe,volume);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return pro;
    }

    public int returnSoLuong() {
        String sql = "select COUNT(*) as soluong from product";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("soluong");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
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

//    public static void main(String[] args) {
//        DAOOrder daoOrder = new DAOOrder();
//        DAOOrder_Item daoOrder_item = new DAOOrder_Item();
//        Order order = new Order(11,"e","s","sd",1);
//        Product pro = new Product(1,"sd", "wd",2,"ds","dfs",1);
//        Order_item order_item = new Order_item(12,3,pro,2,2,2);
//        int n = daoOrder.insertOrder(order,1);
//        int a = daoOrder_item.insertOrder_Item(order_item,1);
//        System.out.println(order_item.toString());
//        System.out.println(a);
//    }
}
