package controller;

import Dal.DAOProduct;
import Dal.DAOWishlist;
import Model.Customer;
import Model.Product;
import Model.Wishlist;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        DAOProduct daoProduct = new DAOProduct();
        DAOWishlist daoWishlist = new DAOWishlist();
        int id ;
        if(customer == null){
            id = 0;
        }else {
            id = customer.getCustomer_id();
        }
        Wishlist wishlist = daoWishlist.getAll(id);
        Vector<Product> vector = daoProduct.searchByName(text);
        PrintWriter out = response.getWriter();
        for(Product item : vector){
            StringBuilder sb = new StringBuilder();
            sb.append("<div >\n" +
                    "                        <div class=\"product-box-3 h-100 wow fadeInUp\"   data-wow-delay=\"0.6\">\n" +
                    "                            <div class=\"product-header\">\n" +
                    "                                <div class=\"product-image\">\n" +
                    "                                    <a href=\"productdetail?pro_id="+item.getProduct_id()+"\">\n" +
                    "                                        <img src=\""+item.getImage()+"\"\n" +
                    "                                             class=\"img-fluid blur-up lazyload\" alt=\"\">\n" +
                    "                                    </a>\n" +
                    "\n" +
                    "                                    <ul class=\"product-option\">\n" +
                    "                                        <li data-bs-toggle=\"tooltip\" data-bs-placement=\"top\" title=\"Wishlist\" class=\"wishlist-li\">\n");
            if(customer != null){
                sb.append("<a style=\"padding-left: 95px\" onclick=\"changeFavourite("+item.getProduct_id()+")\" class=\"notifi-wishlist\" >");
            }else {
                sb.append("<a style=\"padding-left: 95px\" href=\"login\" >");
            }
            if(wishlist.getPro_list().contains(item.getProduct_id())){
                sb.append("<i data-feather=\"heart\" style=\"color: red\" id=\""+item.getProduct_id()+"\"></i>");
            }else {
                sb.append("<i data-feather=\"heart\" id=\""+item.getProduct_id()+"\"></i>");
            }
            sb.append(" </a>\n" +
                    "                                        </li>\n" +
                    "                                    </ul>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                            <div class=\"product-footer\">\n" +
                    "                                <div class=\"product-detail\">\n" +
                    "                                    <span class=\"span-name\">"+item.getCategory_name()+"</span>\n" +
                    "                                    <a href=\"productdetail\">\n" +
                    "                                        <h5 class=\"name\">"+item.getProduct_name()+"</h5>\n" +
                    "                                    </a>\n" +
                    "                                    <p class=\"text-content mt-1 mb-2 product-content\">"+item.getDescribe()+"</p>\n" +
                    "                                    <div class=\"product-rating mt-2\">\n" +
                    "                                        <ul class=\"rating\">\n" +
                    "                                            <li>\n" +
                    "                                                <i data-feather=\"star\" class=\"fill\"></i>\n" +
                    "                                            </li>\n" +
                    "                                            <li>\n" +
                    "                                                <i data-feather=\"star\" class=\"fill\"></i>\n" +
                    "                                            </li>\n" +
                    "                                            <li>\n" +
                    "                                                <i data-feather=\"star\" class=\"fill\"></i>\n" +
                    "                                            </li>\n" +
                    "                                            <li>\n" +
                    "                                                <i data-feather=\"star\" class=\"fill\"></i>\n" +
                    "                                            </li>\n" +
                    "                                            <li>\n" +
                    "                                                <i data-feather=\"star\"></i>\n" +
                    "                                            </li>\n" +
                    "                                        </ul>\n" +
                    "                                        <span>(4.0)</span>\n" +
                    "                                    </div>\n" +
                    "                                    <h6 class=\"unit\">"+item.getVolume()+"ml</h6>\n" +
                    "                                    <h5 class=\"price\"><span class=\"theme-color\">"+item.getPrice()+"00 VND</span>\n" +
                    "                                        <del>15.000 VND</del>\n" +
                    "                                    </h5>\n" +
                    "                                    <div class=\"add-to-cart-box bg-white\">");
            if(customer != null){
                sb.append("<a onclick=\"addToCart("+item.getProduct_id()+")\">\n" +
                        "                                            <button class=\"btn btn-add-cart addcart-button\"\n" +
                        "                                            >Add\n" +
                        "                                            </button>\n" +
                        "                                        </a>");
            }else {
                sb.append("<a href=\"login\" >\n" +
                        "                                            <button class=\"btn btn-add-cart addcart-button\"\n" +
                        "                                                    >Mua\n" +
                        "                                            </button>\n" +
                        "                                        </a>");
            }
            sb.append("</div>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>");
            String html = sb.toString();
            out.println(html);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}