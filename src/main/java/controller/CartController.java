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
                DAOOrder daoOrder = new DAOOrder();
                DAOOrder_Item daoOrder_item = new DAOOrder_Item();
                Vector<Order_item> vector = new Vector<Order_item>();
                ArrayList <Integer> order_list = daoOrder.getOrder_id(cus.getCustomer_id(),1);
                for(Integer i : order_list){
                    String  sql = "select * from order_item where order_id = "+i+" ";
                    Vector<Order_item> order_item_list = daoOrder_item.getAll(sql);
                    for (Order_item order_item : order_item_list){
                        vector.add(order_item);
                    }
                }
                request.setAttribute("data", vector);
                request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);

            }
        }

        if(service.equals("addToCart")){
            Customer cus = (Customer) session.getAttribute("customer");
            if(cus == null){
                response.sendRedirect("login");
            }else {
                int pro_id = Integer.parseInt(request.getParameter("pro_id"));
                DAOProduct daoProduct = new DAOProduct();
                DAOOrder daoOrder = new DAOOrder();
                DAOOrder_Item daoOrder_item = new DAOOrder_Item();
                int order_id = daoOrder.getIdOrder();
                int order_status = 1;
                LocalDate currentDate = LocalDate.now();
                String required_date = "Chua xac nhan";
                String shipped_date = "Chua ro";
                Order order = new Order(order_id,currentDate.toString(),required_date,shipped_date,order_status);
                daoOrder.insertOrder(order, cus.getCustomer_id());
                int item_id = daoOrder_item.getIdOrder_item();
                Product pro = daoProduct.getProductByID(pro_id);
                int quantity = 1;
                double price = pro.getPrice();
                double discount = 0;
                Order_item order_item = new Order_item(item_id,order_id,pro,quantity,price,discount);
                daoOrder_item.insertOrder_Item(order_item,pro_id);
                response.sendRedirect("home");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/cart.jsp").forward(request,response);
    }
}