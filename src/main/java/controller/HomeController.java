package controller;
import Dal.DAOCustomer;
import Dal.DAOProduct;
import Dal.DAOStaff;
import Model.Admin;
import Model.Product;
import Model.Staff;
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
        String page_raw = request.getParameter("page");

        int page = 1;

        if (session.getAttribute("staff") != null) {
            DAOCustomer DAOCustomer = new DAOCustomer();
            DAOProduct DAOProduct = new DAOProduct();

            int totalCustomer = DAOCustomer.getNumberCustomer();
            int totalProduct = DAOProduct.getNumberProduct();

            request.setAttribute("totalCustomer", totalCustomer);
            request.setAttribute("totalProduct", totalProduct);

            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else if (session.getAttribute("admin") != null) {
            DAOCustomer DAOCustomer = new DAOCustomer();
            DAOProduct DAOProduct = new DAOProduct();
            DAOStaff DAOStaff = new DAOStaff();
            int totalCustomer = DAOCustomer.getNumberCustomer();
            int totalProduct = DAOProduct.getNumberProduct();
            int totalStaff = DAOStaff.getNumberStaff();
            request.setAttribute("totalCustomer", totalCustomer);
            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("totalStaff", totalStaff);
            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else {
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