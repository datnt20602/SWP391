package controller;

import Dal.ProductDAO;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");
        String category_raw = request.getParameter("category");
        String name = "%";
        String category = "%";
        int page = 1;
        ProductDAO productDAO = new ProductDAO();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }
        if (category_raw != null && !category_raw.equals("all")) {
            category = category_raw + "%";
        }
        List<Product> listProduct = productDAO.searchProduct(name, category, ((page - 1) * 5));
        List<String> listCategory = productDAO.getListCategory();
        int totalProduct = productDAO.getTotalProduct(name, category);
        double totalPages = Math.ceil((double) totalProduct/5);

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");
        String category_raw = request.getParameter("category");
        String option = request.getParameter("option");
        String name = "%";
        String category = "%";
        int page = 1;
        ProductDAO productDAO = new ProductDAO();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }
        if (category_raw != null && !category_raw.equals("all")) {
            category = category_raw + "%";
        }
        if (option.equals("update")) {
            String id_raw = request.getParameter("productId");
            String productName_raw = request.getParameter("productName");
            String price_raw = request.getParameter("productPrice");
            String image_raw = request.getParameter("productImage");
            String volume_raw = request.getParameter("productVolume");
            String describe = request.getParameter("productDescribe");
            String productCategory = request.getParameter("productCategory");

            int id = Integer.parseInt(id_raw);
            double price = Double.parseDouble(price_raw);
            int volume = Integer.parseInt(volume_raw);
            Product newProduct = new Product(id, productName_raw, productCategory, price, image_raw, describe, volume);
            productDAO.update(newProduct);
        } else {
            String id_raw = request.getParameter("productId");
            int id = Integer.parseInt(id_raw);
            productDAO.delete(id);
        }
        List<Product> listProduct = productDAO.searchProduct(name, category, ((page - 1) * 5));
        List<String> listCategory = productDAO.getListCategory();
        int totalProduct = productDAO.getTotalProduct(name, category);
        double totalPages = Math.ceil((double) totalProduct/5);

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-product.jsp").forward(request, response);
    }
}