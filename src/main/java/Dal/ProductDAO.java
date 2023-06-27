package Dal;

import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductDAO extends DBContext{
    public List<String> getListCategory() {
        List<String> listCategory = new ArrayList<>();
        try {
            String query = "select distinct category_name from product;";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listCategory.add(rs.getString("category_name"));
            }
        } catch (SQLException e) {
            System.err.println("getListCategory: " + e.getMessage());
        }
        return listCategory;
    }

    public List<Product> searchProduct(String name, String category, int page) {
        List<Product> listProduct = new ArrayList<>();
        try {
            String query = "select * from product\n" +
                    "where product_name like ? and category_name like ?\n" +
                    "limit 5 offset ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setInt(3, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("category_name"),
                        rs.getDouble("price"), rs.getString("image"), rs.getString("describe"), rs.getInt("volume")));
            }
        } catch (SQLException e) {
            System.err.println("searchProduct: " + e.getMessage());
        }
        return listProduct;
    }

    public int getTotalProduct(String name, String category) {
        try {
            String query = "select count(product_id) from product\n" +
                    "where product_name like ? and category_name like ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, category);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count(product_id)");
            }
         } catch (SQLException e) {
            System.err.println("searchProduct: " + e.getMessage());
        }
        return 0;
    }

    public Product update(Product product) {
        try {
            String query = "update product\n" +
                    "set product_name = ?, price = ?, category_name = ?, image = ?,\n" +
                    "    volume = ?, `describe` = ?\n" +
                    "where product_id = ?;";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, product.getProduct_name());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getCategory_name());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getVolume());
            ps.setString(6, product.getDescribe());
            ps.setInt(7, product.getProduct_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("ProductDAO-update: " + e.getMessage());
        }
        return product;
    }

    public void delete(int id) {
        try {
            String query = "delete from product where product_id = ?;";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("ProductDAO-delete: " + e.getMessage());
        }
    }
}
