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
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "WishlistController", value = "/wishlist")
public class WishlistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOWishlist dao = new DAOWishlist();
        String service = request.getParameter("service");

        if(service == null){
            service = "displayAll";
        }
        if(service.equals("displayAll")){
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("customer");
            String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
            ResultSet rsSale = dao.getData(sqlSale);
            request.setAttribute("rsSale", rsSale);
            if(cus != null){
                Vector<Product> vector = new Vector<Product>();
                DAOProduct daoP = new DAOProduct();
                Wishlist wishlist = dao.getAll(cus.getCustomer_id());
                for(Integer i : wishlist.getPro_list()){
                    vector.add(daoP.getProductByID(i));
                    System.out.println(daoP.getProductByID(i).getProduct_name());
                }
                request.setAttribute("data", vector);
                request.getRequestDispatcher("template/front-end/wishlist.jsp").forward(request, response);
            }else{
                response.sendRedirect("login");
            }
        }
        if(service.equals("addToWislist")){
            HttpSession session = request.getSession();

            if(session.getAttribute("customer") != null) {
                Customer customer = (Customer) session.getAttribute("customer");
                int pro_id = Integer.parseInt(request.getParameter("pro_id"));
                int wishlist_id = dao.quantityWishList() + 1;
                Wishlist wishlist = dao.getAll(customer.getCustomer_id());
                boolean check = true;
                for (Integer i : wishlist.getPro_list()) {
                    if (pro_id == i) check = false;
                }
                if (check) dao.insertWishList(customer.getCustomer_id(), pro_id, wishlist_id);
                response.sendRedirect("productdetail?pro_id="+pro_id+"");
            }
            else {
                response.sendRedirect("login");
            }
        }
        if(service.equals("cancelWishlist")){
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("customer");
            int pro_id = Integer.parseInt(request.getParameter("cancel"));
            dao.removeWishlist(cus.getCustomer_id(), pro_id);
            response.sendRedirect("wishlist");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/wishlist.jsp").forward(request, response);
    }
}