package Dal;

import Model.Account;
import Model.Customer;
import Model.Product;
import Model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCustomer extends DBContext{
    public int insertCustomer(Customer cus) {
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`customer`\n" +
                "(`customer_id`,\n" +
                "`name`,\n" +
                "`phone`,\n" +
                "`email`,\n" +
                "`active`,\n" +
                "`pass`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?);";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cus.getCustomer_id());
            pre.setString(2, cus.getName());
            pre.setString(3, cus.getPhone());
            pre.setString(4, cus.getEmail());
            pre.setInt(5, cus.getStatus());
            pre.setString(6,cus.getPass());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public Customer login(String email, String pass) {
        String sql = "select * from customer where email = ? and pass = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, pass);
            ResultSet rs =  pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                Customer cus = new Customer(id,name,phone,email,pass,active);
                return cus;
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }

//            String phone = rs.getString("phone");
//            int active = rs.getInt("active");
//            Customer cus = new Customer(id,name,phone,email,pass,active);

        return null;
    }
    public Customer searchByEmail (String email){
        String sql = "select * from customer where email = ? ";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs =  pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                String pass = rs.getString("pass");
                Customer cus = new Customer(id,name,phone,email,pass,active);
                return cus;
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public int getIdCustomer (){
        String sql = "SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try{
            while (rs.next()){
                n = Integer.parseInt(rs.getString("customer_id"));
            }
        }catch (SQLException e){
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public int updateCustomerByPre(Customer cus) {
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`customer`\n" +
                "SET\n" +
                "`name` = ?,\n" +
                "`phone` = ?,\n" +
                "`email` = ?,\n" +
                "`active` = ?,\n" +
                "`pass` = ?\n" +
                "WHERE `customer_id` = ?;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(6, cus.getCustomer_id());
            pre.setString(1, cus.getName());
            pre.setString(2, cus.getPhone());
            pre.setString(3, cus.getEmail());
            pre.setInt(4, cus.getStatus());
            pre.setString(5,cus.getPass());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }


}
