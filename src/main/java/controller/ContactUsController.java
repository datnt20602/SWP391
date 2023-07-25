package controller;

import Dal.DAOProduct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "ContactUsController", value = "/contactus")
public class ContactUsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOProduct dao = new DAOProduct();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = dao.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        request.getRequestDispatcher("template/front-end/contact-us.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
