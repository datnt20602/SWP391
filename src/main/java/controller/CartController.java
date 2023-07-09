package controller;

import Dal.DAOOrder;
import Dal.DAOOrder_Item;
import Dal.DAOProduct;
import Dal.DAOProductInConsignment;
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
        if(service==null){
            service = "display";
        }
        if(service.equals("display")){
            Customer cus = (Customer) session.getAttribute("customer");
            if(cus == null){
                response.sendRedirect("login");
            }else {
                Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
                request.setAttribute("data",vector);
                request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
            }
        }

        if(service.equals("addToCart")){
            Customer cus = (Customer) session.getAttribute("customer");
            if(cus == null){
                response.sendRedirect("login");
            }else {

                int prod_id = Integer.parseInt(request.getParameter("pro_id"));
                System.out.println(prod_id);
                String quantity = request.getParameter("quantity");
                int quan;
                DAOOrder_Item daoOrder_item = new DAOOrder_Item();
                DAOProduct daoProduct = new DAOProduct();
                Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
                if(quantity == null){
                    quan = 1;
                }else{
                    quan = Integer.parseInt(request.getParameter("quantity"));
                }
                Product product = daoProduct.getProductByID(prod_id);
                int item_id = daoOrder_item.getIdOrder_item();
                double discount  = 0;
                Order_item order_item = new Order_item(item_id,product,1,product.getPrice(),discount);
                double totalMoney = 0;
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
                            item.setQuantity(item.getQuantity()+1);
                            totalMoney += item.getProduct().getPrice();
                        }
                    }
                    if(check){
                        totalMoney += order_item.getProduct().getPrice();

                        vector.add(order_item);
                    }
                }
                session.setAttribute("cart_list", vector);
                System.out.println(totalMoney);
                session.setAttribute("totalMoney", totalMoney);
                request.setAttribute("data",vector);
                request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
    }
}