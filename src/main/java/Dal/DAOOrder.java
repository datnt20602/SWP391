package Dal;

import Model.Order;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOOrder extends DBContext{
    public int insertOrder(Order order,int cus_id, int add_id) {
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`orders`\n" +
                "(`order_id`,\n" +
                "`customer_id`,\n" +
                "`order_status`,\n" +
                "`order_date`,\n" +
                "`required_date`,\n" +
                "`shipped_date`,\n" +
                "`store_id`,\n" +
                "`address_id`,\n" +
                "`payment_methods`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?,?,?,?);\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, order.getOrder_id());
            pre.setInt(2, cus_id);
            pre.setInt(3, order.getOrder_status());
            pre.setString(4, order.getOrder_date());
            pre.setString(5, order.getRequired_date());
            pre.setString(6,order.getShipped_date());
            pre.setInt(7,1);
            pre.setInt(8,add_id);
            pre.setInt(9,order.getPayment_methods());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public int getQuantityOrder (int cus_id, int status){
        int n = 0;
        String sql = "SELECT SUM(quantity) as quantity\n" +
                "FROM order_item\n" +
                "JOIN orders ON order_item.order_id = orders.order_id where customer_id = ? and order_status = ?;";
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,cus_id);
            pre.setInt(2,status);
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

    public int getIdOrder(){
        String sql = "SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("order_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n+1;

    }

    public ArrayList<Integer> getOrder_id (int customer_id, int order_status){
        ArrayList<Integer> order_list = new ArrayList<>();
        String sql = "SELECT order_id FROM drink_online_shop1.orders where customer_id = ? and order_status = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customer_id);
            pre.setInt(2, order_status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                order_list.add(rs.getInt("order_id"));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return order_list;
    }
}
