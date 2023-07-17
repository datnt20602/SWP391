package controller;

import Dal.DAOAddress;
import Dal.DAOOrder;
import Dal.DAOOrder_Item;
import Model.Address;
import Model.Customer;
import Model.Order;
import Model.Order_item;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

@WebServlet(name = "OrderSuccessController", value = "/ordersuccess")
public class OrderSuccessController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service  = request.getParameter("service");
        if(service == null){
            service = "display";
        }
        if(service.equals("display")) {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            DAOOrder daoOrder = new DAOOrder();
            DAOAddress daoAddress = new DAOAddress();
            int order_id = daoOrder.getIdOrder();
            Date currentDate = new Date();
            int add_id = 0;
            add_id = Integer.parseInt(request.getParameter("addressID"));
            int payment_method = Integer.parseInt(request.getParameter("flexRadioDefault"));
            Address adr = daoAddress.getProductByID(add_id);
            String payment;
            if (payment_method == 1) {
                payment = "Thanh toán khi nhận hàng";
            } else {
                payment = "Chuyển khoản ngân hàng";
            }

            //insert Order
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            String order_date = dateFormat.format(currentDate);
            String required_date = "Van chua xac nhan";
            String shipped_date = "Van chua xac dinh";
            int order_status = 1;
            Order order = new Order(order_id, order_date, order_status, required_date, shipped_date, customer, payment_method, adr);
            daoOrder.insertOrder(order);

            //insert Order_item
            DAOOrder_Item daoOrder_item = new DAOOrder_Item();
            Vector<Order_item> orderItemVector = (Vector<Order_item>) session.getAttribute("cart_list");
            int item_id = daoOrder_item.getIdOrder_item() - 1;
            double total = 0;
            for (Order_item item : orderItemVector) {
                item_id = item_id + 1;
                item.setItem_id(item_id);
                total = total + (item.getPrice() * item.getQuantity());
                daoOrder_item.insertOrder_Item(item, item.getProduct().getProduct_id(), order_id);
            }
            for (Order_item od : orderItemVector) {
                System.out.println(od.getItem_id());
            }
            session.removeAttribute("cart_list");
            session.removeAttribute("totalMoney");
            request.setAttribute("totalMoney", total);
            request.setAttribute("cart_list", orderItemVector);
            request.setAttribute("payment_method", payment);
            request.setAttribute("order", order);
            request.setAttribute("address", adr);
            request.getRequestDispatcher("template/front-end/order-success.jsp").forward(request, response);
        }

    }
}
