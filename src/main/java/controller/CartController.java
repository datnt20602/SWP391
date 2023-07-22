package controller;

import Dal.*;
import Model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Vector;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String service = request.getParameter("service");
        DAOProduct daoProduct = new DAOProduct();

        if(service==null){
            service = "display";
        }
        if(service.equals("display")){
            Customer cus = (Customer) session.getAttribute("customer");
            if(cus == null){
                response.sendRedirect("login");
            }else {
                double total = 0;
                Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
                if(vector != null) {
                    for (Order_item item : vector) {
                        total += item.getQuantity() * item.getPrice();
                    }
                }
                session.setAttribute("totalMoney", total);
                request.setAttribute("data",vector);
                request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
            }
        }

        if(service.equals("addToCart")){
            Customer cus = (Customer) session.getAttribute("customer");
            if(cus == null){
                response.sendRedirect("login");
            }else {
                String redirect = request.getParameter("redirect");
                int prod_id = Integer.parseInt(request.getParameter("pro_id"));
                String quantity = request.getParameter("quantity");
                int quan;
                DAOOrder_Item daoOrder_item = new DAOOrder_Item();
                Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
                if(quantity == null){
                    quan = 1;
                }else{
                    quan = Integer.parseInt(request.getParameter("quantity"));
                }
                double totalMoney = 0;
                Product product = daoProduct.getProductByID(prod_id);

                double discount  = 0;
                Order_item order_item = new Order_item().builder().price(product.getPrice()).
                quantity(quan).product(product).discount(discount).build();

                if(vector == null){
                    vector = new Vector<Order_item>();
                    totalMoney += (order_item.getProduct().getPrice()*order_item.getQuantity());
                    vector.add(order_item);
                }else{
                    boolean check = true;
                    for(Order_item item : vector){
                        totalMoney += (item.getProduct().getPrice()*item.getQuantity());
                        if(prod_id == item.getProduct().getProduct_id()){
                            check = false;
                            item.setQuantity(item.getQuantity()+quan);
                            System.out.println("item.getQuantity() : " +item.getQuantity());
                            totalMoney += item.getProduct().getPrice();
                        }
                    }
                    if(check){
                        totalMoney += order_item.getProduct().getPrice();

                        vector.add(order_item);
                    }
                }
                session.setAttribute("cart_list", vector);
                session.setAttribute("totalMoney", totalMoney);
                if(redirect == null) {
                    response.sendRedirect("home");
                }else {
                    response.sendRedirect("cart");
                }
            }
        }
        if(service.equals("delete")){
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            Product product = daoProduct.getProductByID(pro_id);
            Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
            Double totalMoney = (Double) session.getAttribute("totalMoney");
            Order_item order_item ;
            int i  = 0;
            for(Order_item item : vector){
                if(product.getProduct_id() == item.getProduct().getProduct_id()){
                    totalMoney =  (totalMoney - (item.getPrice()*item.getQuantity()));
                    i = vector.indexOf(item);
                }
            }
            vector.remove(i);
            session.setAttribute("totalMoney", totalMoney);
            session.setAttribute("cart_list", vector);
            response.sendRedirect("cart");
        }
        if(service.equals("updateQuantity")){
            Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
            Double totalMoney = Double.valueOf(0);
            for(Order_item item : vector){
                int quantity = Integer.parseInt(request.getParameter("quantity"+item.getProduct().getProduct_id()+""));
                item.setQuantity(quantity);
                totalMoney = totalMoney + (quantity*item.getPrice());
            }
            System.out.println(totalMoney);
            session.setAttribute("cart_list", vector);
            session.setAttribute("totalMoney", totalMoney);
            response.sendRedirect("cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
    }
}