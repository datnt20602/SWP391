package controller;

import Dal.DAOProduct;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProductDetailController", value = "/productdetail")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOProduct dao = new DAOProduct();
        int pro_id = Integer.parseInt(request.getParameter("pro_id"));
        Product product = dao.getProductByID(pro_id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("template/front-end/product-detail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/product-detail.jsp").forward(request,response);
    }
}