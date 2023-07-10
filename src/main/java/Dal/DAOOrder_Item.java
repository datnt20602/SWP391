package Dal;

import Model.Order;
import Model.Order_item;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOOrder_Item extends DBContext{
    public int insertOrder_Item(Order_item item, int pro_id, int order_id){
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`order_item`\n" +
                "(`order_id`,\n" +
                "`item_id`,\n" +
                "`product_id`,\n" +
                "`quantity`,\n" +
                "`price`,\n" +
                "`discount`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?);\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, order_id);
            pre.setInt(2, item.getItem_id());
            pre.setInt(3, pro_id);
            pre.setInt(4, item.getQuantity());
            pre.setDouble(5, item.getPrice());
            pre.setDouble(6,1);
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public int insertFeedBack(Order_item item, int order_id, double start, String fb, String fb_date) {
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`order_item`\n" +
                "SET\n" +
                "`feedback` = ?,\n" +
                "`feedback_date` =?,\n" +
                "`star_rating` = ?\n" +
                "WHERE `item_id` = ? and `order_id` = ? ;\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, fb);
            pre.setString(2, fb_date);
            pre.setDouble(3, start);
            pre.setInt(4, item.getItem_id());
            pre.setInt(5, order_id);
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }



    public Vector<Order_item> getAll(int cus_id) {
        String sql = "SELECT item_id,product_id,quantity,price,discount,feedback,star_rating,feedback_date, order_status,order_item.order_id\n" +
                "FROM order_item\n" +
                "JOIN orders ON order_item.order_id = orders.order_id where customer_id =? ;";
        DAOProduct dao = new DAOProduct();
        DAOOrder daoOrder = new DAOOrder();
        Vector<Order_item> vector = new Vector<Order_item>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cus_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int item_id = rs.getInt("item_id");
                Product pro = dao.getProductByID(rs.getInt("product_id"));
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double discount = rs.getDouble("discount");
                Order order = daoOrder.getOrderByID(rs.getInt("order_id"));
                double start;
                String feedback,feedback_date;
                //neu star chua co thi gan = null
                if(rs.getDouble("star_rating") != 0) {
                     start = rs.getDouble("star_rating");
                }else{
                     start = 0;
                }
                //neu feedback chua co thi gan = null
                if(rs.getString("feedback") != null) {
                     feedback = rs.getString("feedback");
                }else{
                     feedback ="";
                }
                if(rs.getString("feedback_date") != null) {
                     feedback_date = rs.getString("feedback_date");
                }else{
                     feedback_date ="";
                }
                int order_status = rs.getInt("order_status");
                String status = "";
                if(order_status == 1) status = "Xử lý đơn hàng";
                if(order_status == 2) status = "Đang Ship";
                if(order_status == 3) status = "Đã giao hàng";
                Order_item item = new Order_item(item_id,pro,quantity,price,discount,order,feedback
                        ,feedback_date,0);
                vector.add(item);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public int deleteOrder_item(Order_item item, int order_id) {
        int n = 0;
        String sql = "DELETE FROM `drink_online_shop1`.`order_item`\n" +
                "WHERE item_id = ? and order_id = ?;\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, item.getItem_id());
            pre.setInt(2, order_id);
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public int getIdOrder_item(){
        String sql = "SELECT item_id FROM order_item ORDER BY item_id DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("item_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n+1;
    }

    public double getTotalMoney(int order_id){
        double total = 0;
        String sql = "SELECT SUM(price) as totalMoney FROM order_item where order_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, order_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                total =  rs.getDouble("totalMoney");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return total;
    }
    private DAOOrder daoOrder = new DAOOrder();
    private DAOProduct daoProduct = new DAOProduct();

    public List<Order_item> getListOrderItemByProduct(String product, int offset) {

        List<Order_item> list = new ArrayList<>();
        try {
            String query = "select oi.* from order_item oi\n" +
                    "left join orders o on o.order_id = oi.order_id\n" +
                    "left join product p on p.product_id = oi.product_id\n" +
                    "where p.product_name like ?\n" +
                    "limit 10 offset ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + product + "%");
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order_item().builder()
                        .item_id(rs.getInt("item_id"))
                        .order(daoOrder.getOrderByID(rs.getInt("order_id")))
                        .product(daoProduct.getProductByID(rs.getInt("product_id")))
                        .quantity(rs.getInt("quantity")).price(rs.getDouble("price"))
                        .discount(rs.getDouble("discount")).feedback(rs.getString("feedback"))
                        .feedback_date(rs.getString("feedback_date")).start_rating(rs.getDouble("star_rating"))
                        .build());
            }
        } catch (SQLException e) {
            System.out.println("getListOrderItemByProduct: " + e.getMessage());
        }
        return list;
    }

    public double getTotalOrder(String productName) {
        try {
            String query = "select count(oi.item_id) from order_item oi\n" +
                    "left join orders o on o.order_id = oi.order_id\n" +
                    "left join product p on p.product_id = oi.product_id\n" +
                    "where p.product_name like ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + productName + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return (double) rs.getInt("count(oi.item_id)");
            }
        } catch (SQLException e) {
            System.out.println("getTotalOrder: " + e.getMessage());
        }
        return (double) 0;
    }


}
