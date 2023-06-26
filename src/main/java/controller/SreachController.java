package controller;

import Dal.DAOProduct;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

@WebServlet(name = "SreachController", value = "/SreachController")
public class SreachController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOProduct dao = new DAOProduct();
        String name  = (String) request.getParameter("txt");
        Vector<Product> vector = new Vector<Product>();
        vector = dao.searchByName(name);
        PrintWriter out = response.getWriter();
        for(Product temp : vector){
            out.println("" +
            "<div>\n" +
            "                        <div class=\"product-box-3 h-100 wow fadeInUp\" data-wow-delay=\"0.6\">\n" +
            "                            <div class=\"product-header\">\n" +
            "                                <div class=\"product-image\">\n" +
            "                                    <a href=\"productdetail\">\n" +
            "                                        <img src=\"<%=temp.getImage()%>\"\n" +
            "                                             class=\"img-fluid blur-up lazyload\" alt=\"\">\n" +
            "                                    </a>\n" +
            "\n" +
            "                                    <ul class=\"product-option\">\n" +
            "\n" +
            "                                        <li data-bs-toggle=\"tooltip\" data-bs-placement=\"top\" title=\"Wishlist\">\n" +
            "                            <%\n" +
            "                                if(session.getAttribute(\"customer\") != null){\n" +
            "                                    Customer customer = (Customer) session.getAttribute(\"customer\");\n" +
            "                            %>\n" +
            "                                            <a style=\"padding-left: 95px\" href=\"wishlist?service=addToWislist&pro_id=<%=temp.getProduct_id()%>\" class=\"notifi-wishlist\">\n" +
            "                                                <i data-feather=\"heart\"></i>\n" +
            "                                            </a>\n" +
            "                            <%\n" +
            "                                }else{\n" +
            "                            %>\n" +
            "                                            <a style=\"padding-left: 95px\" href=\"login\" class=\"notifi-wishlist\">\n" +
            "                                                <i data-feather=\"heart\"></i>\n" +
            "                                            </a>\n" +
            "                            <%}%>\n" +
            "                                        </li>\n" +
            "                                    </ul>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"product-footer\">\n" +
            "                                <div class=\"product-detail\">\n" +
            "                                    <span class=\"span-name\"><%=temp.getCategory_name()%></span>\n" +
            "                                    <a href=\"productdetail\">\n" +
            "                                        <h5 class=\"name\"><%=temp.getProduct_name()%></h5>\n" +
            "                                    </a>\n" +
            "                                    <p class=\"text-content mt-1 mb-2 product-content\"><%=temp.getDescribe()%></p>\n" +
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
            "                                    <h6 class=\"unit\"><%= temp.getVolume()%>ml</h6>\n" +
            "                                    <h5 class=\"price\"><span class=\"theme-color\"><%= temp.getPrice()%></span>\n" +
            "                                        <del>$15.15</del>\n" +
            "                                    </h5>\n" +
            "                                    <div class=\"add-to-cart-box bg-white\">\n" +
            "                                        <button class=\"btn btn-add-cart addcart-button\">Add\n" +
            "                                            <span class=\"add-icon bg-light-gray\">\n" +
            "                                                    <i class=\"fa-solid fa-plus\"></i>\n" +
            "                                                </span>\n" +
            "                                        </button>\n" +
            "                                        <div class=\"cart_qty qty-box\">\n" +
            "                                            <div class=\"input-group bg-white\">\n" +
            "                                                <button type=\"button\" class=\"qty-left-minus bg-gray\"\n" +
            "                                                        data-type=\"minus\" data-field=\"\">\n" +
            "                                                    <i class=\"fa fa-minus\" aria-hidden=\"true\"></i>\n" +
            "                                                </button>\n" +
            "                                                <input  class=\"form-control input-number qty-input\" type=\"text\"\n" +
            "                                                       name=\"quantity\" value=\"0\">\n" +
            "                                                <button type=\"button\" class=\"qty-right-plus bg-gray\"\n" +
            "                                                        data-type=\"plus\" data-field=\"\">\n" +
            "                                                    <i class=\"fa fa-plus\" aria-hidden=\"true\"></i>\n" +
            "                                                </button>\n" +
            "                                            </div>\n" +
            "                                        </div>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                    </div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
