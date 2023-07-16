package Dal;

import Model.Product;
import Model.Store;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class DAOStore extends DBContext{
    public Store getStoreById(int id) {
        try {
            String query = "select * from `store` where store_id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Store(rs.getInt("store_id"), rs.getString("store_name"), rs.getString("phone")
                , rs.getString("email"), rs.getString("street"), rs.getString("city"), rs.getInt("status"));
            }
        } catch (SQLException e) {
            System.out.println("getStoreById: " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        DAOProduct daoProduct = new DAOProduct();
        Vector<Product> vector = daoProduct.getTop5Treending();
        for (Product item : vector){
            System.out.println(item.toString());
        }
    }
}
