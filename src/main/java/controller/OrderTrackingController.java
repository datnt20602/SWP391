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
        Order order = daoOrder.getOrderByID(order_id);
        request.setAttribute("data",order);
        request.getRequestDispatcher("template/front-end/order-tracking.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
