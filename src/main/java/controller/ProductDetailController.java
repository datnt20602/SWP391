package controller;

import Dal.DAOFeedback;
import Dal.DAOProduct;
import Model.Customer;
import Model.Feedback;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Vector;

@WebServlet(name = "ProductDetailController", value = "/productdetail")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOProduct dao = new DAOProduct();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = dao.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        DAOFeedback daoFeedback = new DAOFeedback();
        int pro_id = Integer.parseInt(request.getParameter("pro_id"));
        Vector<Feedback> feedbackVector = daoFeedback.FeedBackList(pro_id);

        Product product = dao.getProductByID(pro_id);
        Vector<Product> vector = dao.getTop5Treending();
        request.setAttribute("feedbackVector",feedbackVector);
        request.setAttribute("data", vector);
        request.setAttribute("product", product);
        request.getRequestDispatcher("template/front-end/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            if(customer == null){
                response.sendRedirect("login");
            }else {

                DAOFeedback daoFeedback = new DAOFeedback();
                DAOProduct daoProduct = new DAOProduct();
                String content = request.getParameter("content");
                int pro_id = Integer.parseInt(request.getParameter("pro_id"));

                LocalDateTime currentTime = LocalDateTime.now();
                Product product = daoProduct.getProductByID(pro_id);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                String formattedTime = formatter.format(currentTime);
                int start_rate = 5;
                Feedback fb = new Feedback(customer,product,0, formattedTime,content,start_rate);
                daoFeedback.insertFeedback(fb);
                System.out.println(pro_id);
                response.sendRedirect("productdetail?pro_id="+pro_id+"");
            }

    }
}