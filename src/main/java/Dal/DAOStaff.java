package Dal;

import Model.Admin;
import Model.Customer;
import Model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStaff extends DBContext{
    public int insertStaff (Staff staff, int admin_id){
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`staff`\n" +
                "(`staff_id`,\n" +
                "`name`,\n" +
                "`email`,\n" +
                "`phone`,\n" +
                "`active`,\n" +
                "`admin_id`,\n" +
                "`pass`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?,?);";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,staff.getStaff_id());
            pre.setString(2,staff.getName());
            pre.setString(3,staff.getEmail());
            pre.setString(4,staff.getPhone());
            pre.setInt(5,staff.getActive());
            pre.setInt(6,admin_id);
            pre.setString(7,staff.getPass());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public Staff login(String email, String pass) {
        String sql = "select * from staff where email = ? and pass = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2,pass);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                System.out.println("fdgdsfg");
                int id = rs.getInt("staff_id");
                System.out.println(id);
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int status = rs.getInt("active");
                System.out.println("dfgbnd");
                Staff st = new Staff(id,name,email,phone,status,pass);
                return st;
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public int updateStaff (Staff staff , int admin_id){
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`staff`\n" +
                "SET\n" +
                "`name` = ?,\n" +
                "`email` =?,\n" +
                "`phone` = ?,\n" +
                "`active` = ?,\n" +
                "`admin_id` = ?,\n" +
                "`pass` = ?\n" +
                "WHERE `staff_id` = ? ;\n";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(7,staff.getStaff_id());
            pre.setString(1,staff.getName());
            pre.setString(2,staff.getEmail());
            pre.setString(3,staff.getPhone());
            pre.setInt(4,staff.getActive());
            pre.setInt(5,admin_id);
            pre.setString(6,staff.getPass());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public Staff searchByEmail(String email){
        String sql = "SELECT staff_id, name, email, phone, active, pass FROM drink_online_shop1.staff where email = 'account2@gmail.com' ";

        try {

            ResultSet rs =  this.getData(sql);
            while (rs.next()){
                int id = rs.getInt("staff_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                String pass = rs.getString("pass");
                Staff staff = new Staff(id,name,email,phone,active,pass);
                return  staff;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

}
