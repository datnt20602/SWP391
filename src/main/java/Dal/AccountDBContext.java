package Dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

import Model.Account;

public class AccountDBContext extends DBContext {


    public Account login(String username, String password) {
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
            String sql = "SELECT * FROM account where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
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

    public Account getAccountByEmail(String email) {
        try {
            String sql = "SELECT * FROM Account where username= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
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
            System.out.println("getAccountByEmail: " + ex.getMessage());
        }
        return null;
    }

    public void insertAccount(String name, String username, String password) {
        try {
            String sql = "INSERT INTO account(name,username,password, isAdmin,isActive) values (?,?,?, 0,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update (Account acc, int id) {
        try {
            String sql = "UPDATE account SET name = ?, username = ?, password = ?, isAdmin = ?, isActive = ? WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getName());
            stm.setString(2, acc.getUsername());
            stm.setString(3, acc.getPassword());
            stm.setBoolean(4, acc.isAdmin());
            stm.setBoolean(5, acc.isActive());
            stm.setInt(6, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("update: " + ex.getMessage());
        }
    }
}
