package controller;

import Dal.DAOProduct;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("searchname");
        Vector<Product> v = new Vector<>();
        v = new DAOProduct().searchByName(search);
        if (v == null) {
            response.sendRedirect("home");
            return;
        }
        request.setAttribute("listsearch", v);
        request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = "";
        if (request.getParameter("searchname") != null) {
            search = request.getParameter("searchname");
        }
        DAOProduct dao = new DAOProduct();
        Vector<Product> v = new Vector<>();
        v = dao.searchByName(search);
        if (v == null) {
            response.sendRedirect("home");
            return;
        }

        String sql = "select distinct category_name from product";
        ResultSet rs = dao.getData(sql);
        request.setAttribute("category_name", rs);
        request.setAttribute("data", v);
        request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
    }
}