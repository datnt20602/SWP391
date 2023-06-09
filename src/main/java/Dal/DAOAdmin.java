package Dal;

import Model.Admin;
import Model.Customer;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            while (rs.next()){
                int id = rs.getInt("admin_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                String street  =  rs.getString("street");
                String city = rs.getString("city");
                String passAd = rs.getString("pass");
                Admin ad = new Admin(id,name,email,phone,status,street,city,passAd);
                return ad;
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Admin searchByEmail(String email){
        String sql = "select * from admin where email = ? ";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs =  pre.executeQuery();
            while (rs.next()){
                int id = rs.getInt("admin_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                String street  =  rs.getString("street");
                String city = rs.getString("city");
                String pass = rs.getString("pass");
                Admin ad = new Admin(id,name,email,phone,status,street,city,pass);
                return ad;
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void updateAdmin(Admin a, int adminId) {
        try {
            String sql = "UPDATE admin SET name = ?, email = ?, phone = ?, status = ?, street = ?, city = ?, pass = ? WHERE admin_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, a.getName());
            stm.setString(2, a.getEmail());
            stm.setString(3, a.getPhone());
            stm.setInt(4, a.getStatus());
            stm.setString(5, a.getStreet());
            stm.setString(6, a.getCity());
            stm.setString(7, a.getPass());
            stm.setInt(8, adminId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateAdmin: " + ex.getMessage());
        }
    }

    public boolean isSecurePassword(String password) {
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    public int updateAdminByPre(Admin admin) {
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`admin`\n" +
                "SET\n" +
                "`name` = ?,\n" +
                "`email` = ?,\n" +
                "`phone` = ?,\n" +
                "`status` = ?,\n" +
                "`street` = ?,\n" +
                "`city` = ?,\n" +
                "`pass` = ?\n" +
                "WHERE `admin_id` = ?;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(8, admin.getAdmin_id());
            pre.setString(1, admin.getName());
            pre.setString(2, admin.getEmail());
            pre.setString(3, admin.getPhone());
            pre.setInt(4, admin.getStatus());
            pre.setString(5, admin.getStreet());
            pre.setString(6, admin.getCity());
            pre.setString(7,admin.getPass());

            pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateAdminByPre" + ex.getMessage());
        }
        return n;
    }

    public List<Admin> searchAdmin() {
        List<Admin> listAdmin = new ArrayList<>();
        try {
            String query = "select * from admin";

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listAdmin.add(new Admin(rs.getInt("admin_id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("email"), rs.getInt("status"), rs.getString("street"), rs.getString("city"), rs.getString("pass")));
            }
        } catch (SQLException e) {
            System.err.println("searchAdmin: " + e.getMessage());
        }
        return listAdmin;
    }

    public Admin update(Admin admin) {
        try {
            String query = "UPDATE `drink_online_shop1`.`admin`\n" +
                    "SET\n" +
                    "`name` = ?,\n" +
                    "`email` = ?,\n" +
                    "`phone` = ?,\n" +
                    "`status` = ?,\n" +
                    "`street` = ?,\n" +
                    "`city` = ?,\n" +
                    "`pass` = ?\n" +
                    "WHERE `admin_id` = ?;";


            PreparedStatement pre = connection.prepareStatement(query);
            pre.setInt(8, admin.getAdmin_id());
            pre.setString(1, admin.getName());
            pre.setString(2, admin.getEmail());
            pre.setString(3, admin.getPhone());
            pre.setInt(4, admin.getStatus());
            pre.setString(5, admin.getStreet());
            pre.setString(6, admin.getCity());
            pre.setString(7,admin.getPass());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.err.println("DAOAdmin-update: " + e.getMessage());
        }
        return admin;
    }
}
