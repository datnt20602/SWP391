package controller;

import Dal.DAOAddress;
import Dal.DAOProduct;
import Dal.DAOWishlist;
import Model.Address;
import Model.Customer;
import Model.Product;
import Model.Wishlist;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");

        //data wishlist
        DAOWishlist daoWishlist = new DAOWishlist();
        Vector<Product> vector = new Vector<Product>();
        DAOProduct daoP = new DAOProduct();
        Wishlist wishlist = daoWishlist.getAll(cus.getCustomer_id());
        for(Integer i : wishlist.getPro_list()){
            vector.add(daoP.getProductByID(i));
            System.out.println(daoP.getProductByID(i).getProduct_name());
        }


        //data Address
        DAOAddress daoAddress = new DAOAddress();
        Vector<Address> addressVector = daoAddress.getAll(cus.getCustomer_id());


        request.setAttribute("address", addressVector);
        request.setAttribute("wishlist", vector);
        request.getRequestDispatcher("template/front-end/user-dashboard.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
