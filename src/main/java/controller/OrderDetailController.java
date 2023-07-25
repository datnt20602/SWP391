package controller;

import Dal.DAOOrder;
import Dal.DAOOrder_Item;
import Model.Order;
import Model.Order_item;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "OrderDetailController", value = "/orderdetail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("ord_id"));
        DAOOrder_Item daoOrder_item = new DAOOrder_Item();
        DAOOrder daoOrder = new DAOOrder();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = daoOrder.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        Vector<Order_item> vector = daoOrder_item.getAll(order_id);
        double total = daoOrder_item.getTotalMoney(order_id);
        Order order = daoOrder.getOrderByID(order_id);
        int payment_method = order.getPayment_methods();
        String payment;
        if (payment_method == 1) {
            payment = "Thanh toán khi nhận hàng";
        } else {
            payment = "Chuyển khoản ngân hàng";
        }
        request.setAttribute("payment_method", payment);
        request.setAttribute("order", order);
        request.setAttribute("address", order.getAddress());
        request.setAttribute("cart_list", vector);
        request.setAttribute("totalMoney", total);
        request.getRequestDispatcher("template/front-end/order-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
