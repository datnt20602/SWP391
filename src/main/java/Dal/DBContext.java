package Dal;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;




public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "root";
            String pass = "20102002";
            String url = "jdbc:mysql://localhost:3306/drink_online_shop1";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            System.out.println("Connect Fail: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Connect Fail: " + ex.getMessage());
        }
    }
    public ResultSet getData(String sql){
        ResultSet rs=null;
        try {
            Statement state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            rs=state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void main(String[] args) {
        DBContext a = new DBContext();
        System.out.println(a.connection);
    }
}


