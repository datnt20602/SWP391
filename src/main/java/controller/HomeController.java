package controller;
import Dal.*;
import Model.*;
import com.mysql.cj.xdevapi.Result;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

@WebServlet(name = "HomeController", urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        String[] categories = request.getParameterValues("category");
        DAOProduct dao = new DAOProduct();
        String sql = "select distinct category_name from product";
        ResultSet rs = dao.getData(sql);
        HttpSession session = request.getSession();
        Vector<Product> vector = new Vector<>();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = dao.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        ArrayList<Integer> pro_list = new ArrayList<>();
        if(customer != null){
            DAOWishlist daoWishlist = new DAOWishlist();
            pro_list = daoWishlist.getAll(customer.getCustomer_id()).getPro_list();
            session.setAttribute("quantityWishlist",pro_list);
        }
        request.setAttribute("wishlistproductID",pro_list);
        if (session.getAttribute("staff") != null) {
            DAOCustomer DAOCustomer = new DAOCustomer();
            DAOProduct DAOProduct = new DAOProduct();
            DAOStaff DAOStaff = new DAOStaff();
            DAOOrder_Item daoOrderItem = new DAOOrder_Item();
            String productName = "";
            int page = 1;
            String page_raw = request.getParameter("page");
            String product_name = request.getParameter("product");
            if (page_raw != null && !page_raw.equals("1")) {
                page = Integer.parseInt(page_raw);
            }
            if (product_name != null && !product_name.isEmpty()) {
                productName = product_name;
            }

            int totalCustomer = DAOCustomer.getNumberCustomer();
            int totalProduct = DAOProduct.getNumberProduct();
            double totalOrder = daoOrderItem.getTotalOrder(productName);
            double totalPages = Math.ceil((double) totalOrder/5);
            List<Order_item> orderItems = daoOrderItem.getListOrderItemByProduct(productName, (page-1) * 5);

            request.setAttribute("orderItems", orderItems);
            request.setAttribute("totalCustomer", totalCustomer);
            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("pageNumber", page);
            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else if (session.getAttribute("admin") != null) {
            DAOCustomer DAOCustomer = new DAOCustomer();
            DAOProduct DAOProduct = new DAOProduct();
            DAOStaff DAOStaff = new DAOStaff();
            DAOOrder_Item daoOrderItem = new DAOOrder_Item();
            String productName = "%";
            int page = 1;
            String page_raw = request.getParameter("page");
            String product_name = request.getParameter("product");
            if (page_raw != null && !page_raw.equals("1")) {
                page = Integer.parseInt(page_raw);
            }
            if (product_name != null && !product_name.isEmpty()) {
                productName = product_name+ "%" ;
            }
            int totalCustomer = DAOCustomer.getNumberCustomer();
            int totalProduct = DAOProduct.getNumberProduct();
            int totalStaff = DAOStaff.getNumberStaff();
            double totalOrder = daoOrderItem.getTotalOrder(productName);
            double totalPages = Math.ceil((double) totalOrder/5);
            List<Order_item> orderItems = daoOrderItem.getListOrderItemByProduct(productName, (page-1) * 5);
            request.setAttribute("orderItems", orderItems);
            request.setAttribute("totalCustomer", totalCustomer);
            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("totalStaff", totalStaff);
            request.setAttribute("pageNumber", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else {
            int page = 1;
            String page_raw = request.getParameter("page");
            List<String> listCategory = new ArrayList<>();
            while (true) {
                try {
                    if (!rs.next()) break;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                try {
                    listCategory.add(rs.getString("category_name"));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            request.setAttribute("listCategory", listCategory);
            if (service == null) service = "displayAll";

            // Create get page and create total page
            if (page_raw != null && !page_raw.equals("1")) {
                page = Integer.parseInt(page_raw);
            }
            int totalProduct = 0;
            double totalPages = Math.ceil((double) totalProduct / 12);

            // Use limit to limit result
            if (service.equals("displayAll")) {
                String query = "";
                if (categories == null || categories.length == 0) {
                    query = "SELECT * FROM product ";
                } else {
                    query = "SELECT * FROM product where";
                    for (int i = 0; i < categories.length; i++) {
                        query += (" category_name = '" + categories[i] + "'");
                        if (i < categories.length - 1) {
                            query += " or";
                        }
                    }
                    List cate = Arrays.asList(categories);
                    request.setAttribute("categories", cate);
                }

                totalProduct = dao.getAll(query).size();
                totalPages = Math.ceil((double) totalProduct / 12);
                query += " limit 12 offset " + ((page - 1) * 12);
                vector = dao.getAll(query);
                request.setAttribute("data", vector);
                request.setAttribute("pageNumber", page);
                request.setAttribute("totalPages", totalPages);

                dispath(request, response, "template/front-end/home.jsp");
            }else if (service.equals("displayAllReduce")) {
                String query = "";
                if (categories == null || categories.length == 0) {
                    query = "SELECT * FROM product order by price DESC ";
                } else {
                    query = "SELECT * FROM product where";
                    for (int i = 0; i < categories.length; i++) {
                        query += (" category_name = '" + categories[i] + "'");
                        if (i < categories.length - 1) {
                            query += " or";
                        }
                    }
                    query += " order by price DESC ";
                    List cate = Arrays.asList(categories);
                    request.setAttribute("categories", cate);
                }

                totalProduct = dao.getAll(query).size();
                totalPages = Math.ceil((double) totalProduct / 12);
                query += " limit 12 offset " + ((page - 1) * 12);
                vector = dao.getAll(query);
                request.setAttribute("data", vector);
                request.setAttribute("pageNumber", page);
                request.setAttribute("totalPages", totalPages);

                dispath(request, response, "template/front-end/home.jsp");
            }
            else if (service.equals("displayAllUp")) {
                String query = "";
                if (categories == null || categories.length == 0) {
                    query = "SELECT * FROM product order by price ";
                } else {
                    query = "SELECT * FROM product where";
                    for (int i = 0; i < categories.length; i++) {
                        query += (" category_name = '" + categories[i] + "'");
                        if (i < categories.length - 1) {
                            query += " or";
                        }
                    }
                    query += " order by price ";
                    List cate = Arrays.asList(categories);
                    request.setAttribute("categories", cate);
                }

                totalProduct = dao.getAll(query).size();
                totalPages = Math.ceil((double) totalProduct / 12);
                query += " limit 12 offset " + ((page - 1) * 12);
                vector = dao.getAll(query);
                request.setAttribute("data", vector);
                request.setAttribute("pageNumber", page);
                request.setAttribute("totalPages", totalPages);

                dispath(request, response, "template/front-end/home.jsp");
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("message", "nghia");
        request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
    }

    void dispath(HttpServletRequest request,
                 HttpServletResponse response, String url)
            throws ServletException, IOException {
        RequestDispatcher disp
                = request.getRequestDispatcher(url);
        disp.forward(request, response);
    }
}