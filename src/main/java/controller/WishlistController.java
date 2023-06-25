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
            if(cus != null){
                Vector<Product> vector = new Vector<Product>();
                DAOProduct daoP = new DAOProduct();
                Wishlist wishlist = dao.getAll(cus.getCustomer_id());
                for(Integer i : wishlist.getPro_list()){
                    vector.add(daoP.getProductByID(i));
                }
                request.setAttribute("data", vector);
                request.getRequestDispatcher("template/front-end/wishlist.jsp").forward(request, response);
            }else{
                response.sendRedirect("login");
            }
        }
        if(service.equals("addToWislist")){
            int cus_id = Integer.parseInt(request.getParameter("cus_id"));
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            int wishlist_id = dao.quantityWishList()+1;
            dao.insertWishList(cus_id, pro_id,wishlist_id);
            response.sendRedirect("wishlist");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/wishlist.jsp").forward(request, response);
    }
}