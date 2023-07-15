package Dal;

import Model.Customer;
import Model.Feedback;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOFeedback extends DBContext{
    public int insertFeedback(Feedback fb){
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`feedback`\n" +
                "(`content`,\n" +
                "`date`,\n" +
                "`star_rate`,\n" +
                "`customer_id`,\n" +
                "`product_id`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?);\n";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, fb.getContent());
            pre.setString(2, fb.getDate());
            pre.setInt(3, fb.getStar_rate());
            pre.setInt(4, fb.getCustomer().getCustomer_id());
            pre.setInt(5, fb.getProduct().getProduct_id());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public Vector<Feedback> FeedBackList (int pro_id){
        String sql = "SELECT * FROM drink_online_shop1.feedback where product_id =?;";
        DAOCustomer daoCustomer = new DAOCustomer();
        DAOProduct daoProduct = new DAOProduct();
        Vector<Feedback> vector = new Vector<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, pro_id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int feedback_id = rs.getInt("feedback_id");
                String content = rs.getString("content");
                String date = rs.getString("date");
                int star_rate = rs.getInt("star_rate");
                Customer customer = daoCustomer.getCustomerByID(rs.getInt("customer_id"));
                Product product = daoProduct.getProductByID(rs.getInt("product_id"));
                Feedback feedback = new Feedback(customer,product,feedback_id,date,content,star_rate);
                vector.add(feedback);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }
}
