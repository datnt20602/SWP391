package Dal;
import Model.Customer;
import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DAOProduct extends DBContext{

    public int getTotalProduct() {
        try {
            String query = "select count(product_id) from product";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count(product_id)");
            }
        } catch (SQLException e) {
            System.out.println("getTotalProduct: " + e.getMessage());
        }
        return 0;
    }

    public int addProductbyPre(Product pro) {
        int n = 0;
        String sql = "INSERT INTO `drink_online_shop1`.`product`\n" +
                "(`product_id`,\n" +
                "`product_name`,\n" +
                "`price`,\n" +
                "`category_name`,\n" +
                "`image`,\n" +
                "`describe`)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?);";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, pro.getProduct_id());
            pre.setString(2, pro.getProduct_name());
            pre.setDouble(3, pro.getPrice());
            pre.setString(4, pro.getCategory_name());
            pre.setString(5, pro.getImage());
            pre.setString(6,pro.getDescribe());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public Vector<Product> searchByName(String name){
        String sql = "SELECT * FROM product where product_name like ?";
        Vector<Product> vector = new Vector<Product>();

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%"+name+"%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String nameP = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                Product pro = new Product(id,nameP, categoryName, price, image, describe,volume);
                vector.add(pro);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public Vector<Product> getAll(String sql) {
        Vector<Product> vector = new Vector<Product>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                Product pro = new Product(id,name, categoryName, price, image, describe,volume);
                vector.add(pro);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }
    public Product getProductByID(int pro_id) {
        Product pro = new Product();
        ResultSet rs = this.getData("select * from product where product_id ="+pro_id+"");
        try {
            while (rs.next()) {
                String name = rs.getString("product_name");
                Double price = rs.getDouble("price");
                String categoryName = rs.getString("category_name");
                String image = rs.getString("image");
                String describe = rs.getString("describe");
                int volume = rs.getInt("volume");
                pro = new Product(pro_id,name, categoryName, price, image, describe,volume);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return pro;
    }

    public int returnSoLuong() {
        String sql = "select COUNT(*) as soluong from product";
        ResultSet rs = this.getData(sql);
        int n = 0;
        try {
            while (rs.next()) {
                n = rs.getInt("soluong");
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }
    public int updateProduct(Product pro) {
        int n = 0;

        String sql = "UPDATE `drink_online_shop1`.`product`\n" +
                "SET\n" +
                "`product_name` = ?,\n" +
                "`price` = ?,\n" +
                "`category_name` = ?,\n" +
                "`image` = ?,\n" +
                "`describe` = ?\n" +
                "`volume` = ?\n" +
                "WHERE `product_id` = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);

            pre.setString(1, pro.getProduct_name());
            pre.setDouble(2,pro.getPrice());
            pre.setString(3, pro.getCategory_name());
            pre.setString(4, pro.getImage());
            pre.setString(5, pro.getDescribe());
            pre.setInt(6, pro.getVolume());
            pre.setInt(7, pro.getProduct_id());
            //run
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

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
    public int getNumberProduct() {
        try {
            String query = "select count(product_id) from product";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count(product_id)");
            }
        } catch (SQLException e) {
            System.err.println("getNumberProduct: " + e.getMessage());
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

    public void insert(Product product) {
        try {
            String query = "insert into product (product_name, price, category_name, image, `describe`, volume) VALUE (?, ?, ?, ?, ?, ?);";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, product.getProduct_name());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getCategory_name());
            ps.setString(4, product.getImage());
            ps.setInt(6, product.getVolume());
            ps.setString(5, product.getDescribe());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("ProductDAO-insert: " + e.getMessage());
        }
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


    
    public List<Product> getProductsByPageSortedByPrice(int offset, int limit, String sortOrder) {
        List<Product> products = new ArrayList<>();

        String query = "SELECT * FROM product ORDER BY price " + sortOrder + " LIMIT ?, ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProduct_id(rs.getInt("product_id"));
                    product.setProduct_name(rs.getString("product_name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setCategory_name(rs.getString("category_name"));
                    product.setImage(rs.getString("image"));
                    product.setVolume(rs.getInt("volume"));
                    product.setDescribe(rs.getString("describe"));

                    products.add(product);
                }
            }
        } catch (SQLException e) {
            System.err.println("ProductDAO-getProductsByPageSortedByPrice: " + e.getMessage());
        }

        return products;
    }

    public List<Product> getProductsByPage(int offset, int productsPerPage) {
        List<Product> products = new ArrayList<>();

        String query = "SELECT * FROM product LIMIT ?, ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, productsPerPage);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProduct_id(rs.getInt("product_id"));
                    product.setProduct_name(rs.getString("product_name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setCategory_name(rs.getString("category_name"));
                    product.setImage(rs.getString("image"));
                    product.setVolume(rs.getInt("volume"));
                    product.setDescribe(rs.getString("describe"));

                    products.add(product);
                }
            }
        } catch (SQLException e) {
            System.err.println("ProductDAO-getProductsByPage: " + e.getMessage());
        }

        return products;
    }

    public int getTotalProducts() {
        int totalProducts = 0;

        String query = "SELECT COUNT(*) AS total FROM product";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalProducts = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.err.println("ProductDAO-getTotalProducts: " + e.getMessage());
        }

        return totalProducts;
    }


    public static void main(String[] args) {
        Vector<Product> v =new DAOProduct().searchByName("BL");
        for (Product p: v
             ) {
            System.out.println(v.toString());

        }
    }

}
