package Dal;

import Model.Order_item;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOOrder_Item extends DBContext {

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
                                .order(daoOrder.getOrderById(rs.getInt("order_id")))
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
