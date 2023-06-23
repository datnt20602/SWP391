package Dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

import Model.Account;
import Model.Product;

public class AccountDBContext extends DBContext {


    public Account getAdmin(String username, String password) {
        try {
            String sql = "SELECT * FROM admin where email = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("admin_id"));
                a.setName(rs.getString("name"));
                a.setUsername(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setAdmin(rs.getBoolean("isAdmin"));
                return a;
            }
        } catch (SQLException ex) {
            System.err.println("getAdmin: " + ex.getMessage());
        }
        return null;
    }

    public Account getStaff(String username, String password) {
        try {
            String sql = "SELECT * FROM staff where email = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("staff_id"));
                a.setName(rs.getString("name"));
                a.setUsername(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setActive(rs.getBoolean("active"));
                a.setStaff(rs.getBoolean("isStaff"));
                a.setAdminForStaff(getAdminByID(rs.getInt("admin_id")));
                return a;
            }
        } catch (SQLException ex) {
            System.err.println("getStaff: " + ex.getMessage());
        }
        return null;
    }

    public Account getCustomer(String username, String password) {
        try {
            String sql = "SELECT * FROM customer where email = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("customer_id"));
                a.setName(rs.getString("name"));
                a.setPhone(rs.getString("phone"));
                a.setUsername(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setActive(rs.getBoolean("active"));
                return a;
            }
        } catch (SQLException ex) {
            System.err.println("getCustomer: " + ex.getMessage());
        }
        return null;
    }

    public Account getAdminByID(int id) {
        try {
            String sql = "SELECT * FROM admin where admin_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("admin_id"));
                a.setName(rs.getString("name"));
                a.setUsername(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setStaff(rs.getBoolean("isAdmin"));
                return a;
            }
        } catch (SQLException ex) {
            System.err.println("getAdminByID: " + ex.getMessage());
        }
        return null;
    }

    public Account checkAccountExistByUserPass(String username, String password) {
        try {
            String sql = "SELECT * FROM Account where username= ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setUsername(rs.getString(3));
                a.setPassword(rs.getString(4));
                a.setAdmin(rs.getBoolean(5));
                a.setActive(rs.getBoolean(6));

                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        try {
            String sql = "SELECT * FROM customer where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("customer_id"));
                a.setName(rs.getString("name"));
                a.setPhone(rs.getString("phone"));
                a.setUsername(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setActive(rs.getBoolean("active"));
                return a;
            }
        } catch (SQLException ex) {
            System.err.println("checkAccountExist: " + ex.getMessage());
        }
        return null;
    }

    public Account getAccountByEmail(String email) {
        try {
            String sql = "SELECT * FROM customer where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setaID(rs.getInt("customer_id"));
                a.setName(rs.getString("name"));
                a.setUsername(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setPassword(rs.getString("password"));
                a.setActive(rs.getBoolean("active"));
                return a;
            }
        } catch (SQLException ex) {
            System.out.println("getAccountByEmail: " + ex.getMessage());
        }
        return null;
    }

    public void insertAccount(String name, String username, String password) {
        try {
            String sql = "INSERT INTO customer(name,email,password,active) values (?,?,?,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("insertAccount: " + ex.getMessage());
        }
    }

    public void updateCustomer(Account acc, int id) {
        try {
            String sql = "UPDATE customer SET name = ?, phone = ?, email = ?, password = ?, active = ? WHERE customer_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getName());
            stm.setString(2, acc.getPhone());
            stm.setString(3, acc.getUsername());
            stm.setString(4, acc.getPassword());
            stm.setBoolean(5, acc.isActive());
            stm.setInt(6, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateCustomer: " + ex.getMessage());
        }
    }

    public void updateStaff(Account acc, int id) {
        try {
            String sql = "UPDATE staff SET name = ?, email = ?, password = ?, active = ?, isStaff = ? WHERE staff_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getName());
            stm.setString(2, acc.getUsername());
            stm.setString(3, acc.getPassword());
            stm.setBoolean(4, acc.isActive());
            stm.setBoolean(5, acc.isStaff());
            stm.setInt(6, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateStaff: " + ex.getMessage());
        }
    }

//    public static void main(String[] args) {
//        Dal.DAOProduct dao = new DAOProduct();
////        int n = dao.addProductbyPre(pro);
//        dao.getAll();
//    }

}
