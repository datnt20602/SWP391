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
        String sql = "INSERT INTO `drink_online_shop1`.`customer`(" +
                "`name`,\n" +
                "`phone`,\n" +
                "`email`,\n" +
                "`active`,\n" +
                "`pass`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?);";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, cus.getName());
            pre.setString(2, cus.getPhone());
            pre.setString(3, cus.getEmail());
            pre.setBoolean(4, false);
            pre.setString(5,cus.getPass());
            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public int getIdCustomer(){
        String sql = "SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("customer_id");
            }
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
        Customer cus = null;
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
                cus = new Customer(id,name,phone,email,pass,active);
            }
            return cus;
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public Customer getCustomerByID(int cus_id){
        String sql = "select * from customer where customer_id = ? ";
        Customer cus = null;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cus_id);
            ResultSet rs =  pre.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                String pass = rs.getString("pass");
                String birthday = rs.getString("birthday");
                int gender = rs.getInt("gender");
                cus = new Customer(cus_id,name,phone,email,pass,active,gender,birthday);
            }
            return cus;
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public int updateCustomerByPre(Customer cus) {
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`customer`\n" +
                "SET\n" +
                "`name` = ?,\n" +
                "`phone` =?,\n" +
                "`email` = ?,\n" +
                "`active` = ?,\n" +
                "`pass` = ?,\n" +
                "`birthday` = ?,\n" +
                "`gender` = ?\n" +
                "WHERE `customer_id` = ?;\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(8, cus.getCustomer_id());
            pre.setString(1, cus.getName());
            pre.setString(2, cus.getPhone());
            pre.setString(3, cus.getEmail());
            pre.setInt(4, cus.getStatus());
            pre.setString(5,cus.getPass());
            pre.setString(6,cus.getBirthday());
            pre.setInt(7,cus.getGender());
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }


    public void updateCustomer(Customer c, int customerId) {
        try {
            String sql = "UPDATE customer SET name = ?, phone = ?, email = ?, active = ?, pass = ? WHERE customer_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getName());
            stm.setString(2, c.getPhone());
            stm.setString(3, c.getEmail());
            stm.setInt(4, c.getStatus());
            stm.setString(5, c.getPass());
            stm.setInt(6, customerId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateCustomer: " + ex.getMessage());
        }
    }
}
