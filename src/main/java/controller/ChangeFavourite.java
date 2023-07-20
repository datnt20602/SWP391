package controller;

import Dal.DAOWishlist;
import Model.Customer;
import Model.Wishlist;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeFavourite", value = "/changeFavourite")
public class ChangeFavourite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        DAOWishlist daoWishlist = new DAOWishlist();
        Wishlist wish = daoWishlist.getAll(customer.getCustomer_id());
        int wishlist_id = daoWishlist.quantityWishList() + 1;
        if(wish.getPro_list().contains(Integer.parseInt(id))){
            daoWishlist.removeWishlist(customer.getCustomer_id(),Integer.parseInt(id));
        }
        else {
            daoWishlist.insertWishList(customer.getCustomer_id(), Integer.parseInt(id),wishlist_id);
        }
        Wishlist wish1 = daoWishlist.getAll(customer.getCustomer_id());
        PrintWriter out = response.getWriter();
        out.println("<i data-feather=\"heart\"></i>\n" +
                "                                        <span id=\"wishlist\" class=\"position-absolute top-0 start-100 translate-middle badge\">"+wish1.getPro_list().size()+"\n" +
                "                                                </span>");
    }
}
