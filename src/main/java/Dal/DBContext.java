package Dal;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;




    public class DBContext {

        protected Connection connection;

        public DBContext() {
            try {
                String user = "root";
                String pass = "Minh2002";
                String url = "jdbc:mysql://localhost:3306/drink_online_shop1";
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, pass);
            } catch (ClassNotFoundException ex) {
                System.out.println("Connect Fail: " + ex.getMessage());
            } catch (SQLException ex) {
                System.out.println("Connect Fail: " + ex.getMessage());
            }
        }

        public static void main(String[] args) {
            DBContext a = new DBContext();
            System.out.println(a.connection);
        }
    }


