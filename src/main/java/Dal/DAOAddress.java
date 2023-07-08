package Dal;

import Model.Address;
import Model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOAddress extends DBContext{
    public int insertAddress (Address adr, int cus_id){
        int n = 0;
        String sql= "INSERT INTO `drink_online_shop1`.`address`\n" +
                "(`address_id`,\n" +
                "`name`,\n" +
                "`email`,\n" +
                "`phone`,\n" +
                "`customer_id`,\n" +
                "`ten_goi_nho`,\n" +
                "`address_name`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?,?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, adr.getAddress_id());
            pre.setString(2, adr.getName());
            pre.setString(3, adr.getEmail());
            pre.setString(4, adr.getPhone());
            pre.setString(6, adr.getTen_goi_nho());
            pre.setInt(5,cus_id);
            pre.setString(7, adr.getAddress_name());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public Address getProductByID(int pro_id) {
        Address adr = null ;
        String sql = "SELECT * FROM drink_online_shop1.address where address_id = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,pro_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int address_id = rs.getInt("address_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String ten_goi_nho = rs.getString("ten_goi_nho");
                String address_name = rs.getString("address_name");
                adr = new Address(address_id,name,email,phone,address_name,ten_goi_nho);

            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return adr;
    }
    public Vector<Address> getAll(int cus_id) {
        String sql = "SELECT * FROM drink_online_shop1.address where customer_id = ?;";
        Vector<Address> vector = new Vector<Address>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cus_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("address_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address_name = rs.getString("address_name");
                String ten_goi_nho = rs.getString("ten_goi_nho");
                Address adr = new Address(id,name,email,phone,address_name,ten_goi_nho);

                vector.add(adr);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public int getIdAddress(){
        String sql = "SELECT address_id FROM address ORDER BY address_id DESC LIMIT 1;";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("address_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n+1;

    }

}
