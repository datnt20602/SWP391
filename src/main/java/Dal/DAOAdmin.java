package Dal;

import Model.Admin;
import Model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOAdmin extends DBContext{
    public int insertAdmin (Admin ad){
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`admin`\n" +
                "(`admin_id`,\n" +
                "`name`,\n" +
                "`email`,\n" +
                "`phone`,\n" +
                "`status`,\n" +
                "`street`,\n" +
                "`city`,\n" +
                "`pass`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,ad.getAdmin_id());
            pre.setString(2, ad.getName());
            pre.setString(3,ad.getEmail());
            pre.setString(4,ad.getPhone());
            pre.setInt(5, ad.getStatus());
            pre.setString(6,ad.getStreet());
            pre.setString(7,ad.getCity());
            pre.setString(8, ad.getPass());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public Admin login(String email, String pass) {
        String sql = "select * from admin where email = ? and pass = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, pass);
            ResultSet rs =  pre.executeQuery();
            int id = rs.getInt("admin_id");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            int status = rs.getInt("status");
            String street  =  rs.getString("street");
            String city = rs.getString("city");
            Admin ad = new Admin(id,name,email,phone,status,street,city,pass);
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}
