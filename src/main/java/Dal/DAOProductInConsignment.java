package Dal;

import Model.Product;
import Model.ProductInConsignment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProductInConsignment extends DBContext{
    public ProductInConsignment getProductByID(int pro_id) {
        ProductInConsignment productInConsignment = null;
        String sql = "select * from product where product_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,pro_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                DAOProduct dao = new DAOProduct();
                Product pro =dao.getProductByID(rs.getInt("product_id"));
                int consignment_id = rs.getInt("consignment_id");
                int quantity = rs.getInt("quantity");
                double entry_price = rs.getDouble("entry_price");
                String manufacturing_date = rs.getString("manufacturing_date");
                productInConsignment =  new ProductInConsignment(consignment_id,pro,quantity,entry_price,manufacturing_date);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return productInConsignment;
    }
}
