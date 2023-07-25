package controller;

import Dal.DAOOrder;
import Model.Order;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "OrderTrackingController", value = "/ordertracking")
public class OrderTrackingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        DAOOrder daoOrder = new DAOOrder();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = daoOrder.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        Order order = daoOrder.getOrderByID(order_id);
        request.setAttribute("data",order);
        request.getRequestDispatcher("template/front-end/order-tracking.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
