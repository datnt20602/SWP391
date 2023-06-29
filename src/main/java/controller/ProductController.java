package controller;

import Dal.DAOProduct;
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
        DAOProduct DAOProduct = new DAOProduct();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }
        if (category_raw != null && !category_raw.equals("all")) {
            category = category_raw + "%";
        }
        List<Product> listProduct = DAOProduct.searchProduct(name, category, ((page - 1) * 5));
        List<String> listCategory = DAOProduct.getListCategory();
        int totalProduct = DAOProduct.getTotalProduct(name, category);
        double totalPages = Math.ceil((double) totalProduct / 5);

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
        DAOProduct DAOProduct = new DAOProduct();
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

            price_raw = price_raw.replaceAll("[^0-9,]", "");
            volume_raw = volume_raw.replaceAll("[^0-9,]", "");
            price_raw = price_raw.replace(",", "");

                int id = Integer.parseInt(id_raw);
                double price = Double.parseDouble(price_raw);
                int volume = Integer.parseInt(volume_raw);
                Product newProduct = new Product(id, productName_raw, productCategory, price, image_raw, describe, volume);
                DAOProduct.update(newProduct);



        } else {
            String id_raw = request.getParameter("productId");
            int id = Integer.parseInt(id_raw);
            DAOProduct.delete(id);
        }
        List<Product> listProduct = DAOProduct.searchProduct(name, category, ((page - 1) * 5));
        List<String> listCategory = DAOProduct.getListCategory();
        int totalProduct = DAOProduct.getTotalProduct(name, category);
        double totalPages = Math.ceil((double) totalProduct / 5);

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-product.jsp").forward(request, response);
    }
}