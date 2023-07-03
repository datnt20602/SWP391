package Dal;

import Model.Customer;
import Model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DAOStaff extends DBContext {
    public int insertStaff(Staff staff, int admin_id) {
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
            pre.setInt(1, staff.getStaff_id());
            pre.setString(2, staff.getName());
            pre.setString(3, staff.getEmail());
            pre.setString(4, staff.getPhone());
            pre.setInt(5, staff.getActive());
            pre.setInt(6, admin_id);
            pre.setString(7, staff.getPass());
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
            pre.setString(2, pass);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("staff_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                Staff staff = new Staff(id, name, email, phone, active, pass);
                return staff;
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }


    public int updateStaff(Staff staff, int admin_id) {
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
            pre.setInt(7, staff.getStaff_id());
            pre.setString(1, staff.getName());
            pre.setString(2, staff.getEmail());
            pre.setString(3, staff.getPhone());
            pre.setInt(4, staff.getActive());
            pre.setInt(5, admin_id);
            pre.setString(6, staff.getPass());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public Staff searchByEmail(String email) {
        String sql = "select * from staff where email = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("staff_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int active = rs.getInt("active");
                String pass = rs.getString("pass");
                Staff staff = new Staff(id, name, email, phone, active, pass);
                return staff;
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }


    public List<Staff> searchStaff(String name, int page) {
        List<Staff> listStaff = new ArrayList<>();
        try {
            String query = "select * from staff\n" +
                    "where name like ?\n" +
                    "limit 5 offset ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listStaff.add(new Staff(rs.getInt("staff_id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("phone"), rs.getInt("active"), rs.getInt("admin_id"), rs.getString("pass")));
            }
        } catch (SQLException e) {
            System.err.println("searchStaff: " + e.getMessage());
        }
        return listStaff;
    }

    public int getTotalStaff(String name) {
        try {
            String query = "select count(staff_id) from staff\n" +
                    "where name like ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count(staff_id)");
            }
        } catch (SQLException e) {
            System.err.println("getTotalStaff: " + e.getMessage());
        }
        return 0;
    }

    public int getNumberStaff() {
        try {
            String query = "select count(staff_id) from staff";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count(staff_id)");
            }
        } catch (SQLException e) {
            System.err.println("getNumberStaff: " + e.getMessage());
        }
        return 0;
    }

    public void delete(int id) {
        try {
            String query = "delete from staff where staff_id = ?;";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("DAOStaff-delete: " + e.getMessage());
        }
    }

    public boolean isSecurePassword(String password) {
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    public int updateStaffByPre(Staff staff) {
        int n = 0;
        String sql = "UPDATE `drink_online_shop1`.`staff`\n" +
                "SET\n" +
                "`name` = ?,\n" +
                "`email` = ?,\n" +
                "`phone` = ?,\n" +
                "`active` = ?,\n" +
                "`admin_id` = ?,\n" +
                "`pass` = ?\n" +
                "WHERE `staff_id` = ?;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(7, staff.getStaff_id());
            pre.setString(1, staff.getName());
            pre.setString(2, staff.getEmail());
            pre.setString(3, staff.getPhone());
            pre.setInt(4, staff.getActive());
            pre.setInt(5, staff.getAdmin_id());
            pre.setString(6,staff.getPass());

            pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateStaffByPre" + ex.getMessage());
        }
        return n;
    }
}
