package controller;

import Dal.DAOOrder_Item;
import Dal.DAOProduct;
import Dal.ProductDAO;
import Model.Customer;
import Model.Order_item;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

@WebServlet(name = "AddToCartAjax", value = "/addToCartAjax")
public class AddToCartAjax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");
        Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
        double totalMoney = 0;
        boolean check = true;
        int prod_id = Integer.parseInt(request.getParameter("id"));
        if (vector == null) {
            vector = new Vector<>();
        } else {
            for (Order_item item : vector) {
                if (prod_id == item.getProduct().getProduct_id()) {
                    check = false;
                }
            }
        }
        if (check) {
            DAOProduct daoProduct = new DAOProduct();
            Product product = daoProduct.getProductByID(prod_id);
            int quantity = 1;
            Order_item order_item = new Order_item().builder().price(product.getPrice()).
                    quantity(quantity).product(product).discount(1).build();
            System.out.println(order_item.getProduct().getProduct_name());
            System.out.println(vector.size());
            vector.add(order_item);
        } else {
            for (Order_item item : vector) {
                if (prod_id == item.getProduct().getProduct_id()) {
                    item.setQuantity(item.getQuantity() + 1);
                }
                totalMoney += item.getPrice()* item.getQuantity();
            }
        }
        session.setAttribute("cart_list", vector);
        session.setAttribute("totalMoney", totalMoney);
        PrintWriter out = response.getWriter();
        if(vector.size() - 3 < 0){
            for(Order_item order_item : vector) {
                out.println("<li class=\"product-box-contain\">\n" +
                        "                                                    <div class=\"drop-cart\">\n" +
                        "                                                        <a href=\"productdetail\" class=\"drop-image\">\n" +
                        "                                                            <img src=\"" + order_item.getProduct().getImage() + "\"\n" +
                        "                                                                 class=\"blur-up lazyload\" alt=\"\">\n" +
                        "                                                        </a>\n" +
                        "\n" +
                        "                                                        <div class=\"drop-contain\">\n" +
                        "                                                            <a href=\"productdetail\">\n" +
                        "                                                                <h5>" + order_item.getProduct().getProduct_name() + "</h5>\n" +
                        "                                                            </a>\n" +
                        "                                                            <h6><span>" + order_item.getQuantity() + " x</span>" + order_item.getPrice() + "00 VND</h6>\n" +
                        "                                                            <button class=\"close-button close_button\">\n" +
                        "                                                                <i class=\"fa-solid fa-xmark\"></i>\n" +
                        "                                                            </button>\n" +
                        "                                                        </div>\n" +
                        "                                                    </div>\n" +
                        "                                                </li>");
            }
        }else {
            for(int i = vector.size()- 1 ; i > vector.size()-4; i--) {
                out.println("<li class=\"product-box-contain\">\n" +
                        "                                                    <div class=\"drop-cart\">\n" +
                        "                                                        <a href=\"productdetail\" class=\"drop-image\">\n" +
                        "                                                            <img src=\"" + vector.get(i).getProduct().getImage() + "\"\n" +
                        "                                                                 class=\"blur-up lazyload\" alt=\"\">\n" +
                        "                                                        </a>\n" +
                        "\n" +
                        "                                                        <div class=\"drop-contain\">\n" +
                        "                                                            <a href=\"productdetail\">\n" +
                        "                                                                <h5>" + vector.get(i).getProduct().getProduct_name() + "</h5>\n" +
                        "                                                            </a>\n" +
                        "                                                            <h6><span>" + vector.get(i).getQuantity() + " x</span>" + vector.get(i).getPrice() + "00 VND</h6>\n" +
                        "                                                            <button class=\"close-button close_button\">\n" +
                        "                                                                <i class=\"fa-solid fa-xmark\"></i>\n" +
                        "                                                            </button>\n" +
                        "                                                        </div>\n" +
                        "                                                    </div>\n" +
                        "                                                </li>");
            }
        }
    }
}
