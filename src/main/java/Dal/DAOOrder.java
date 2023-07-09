package Dal;

import Model.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOOrder extends DBContext{

    private DAOCustomer daoCustomer = new DAOCustomer();
    private DAOStaff daoStaff = new DAOStaff();
    private DAOStore daoStore = new DAOStore();

    public Order getOrderById(int id) {
        try {
            String query = "select * from `orders` where order_id = ?;";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Order(rs.getInt("order_id"), daoCustomer.getCustomerById(rs.getInt("customer_id")),
                        rs.getInt(rs.getInt("order_status")), rs.getString("order_date"),
                        rs.getString("required_date"), rs.getString("shipped_date"), daoStaff.getStaffById(rs.getInt("staff_id")),
                        daoStore.getStoreById(rs.getInt("store_id")), rs.getDouble("total_money"));
            }
        } catch (SQLException e) {
            System.out.println("getOrderById: " + e.getMessage());
        }
        return null;
    }
}
