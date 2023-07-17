package controller;

import Dal.*;
import Model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");

        if(cus != null){
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

            //datatotal Order
            DAOOrder daoOrder = new DAOOrder();
            int totalOrder = daoOrder.getQuantityOrder(cus.getCustomer_id(),1);
            //data total wishlist
            int totalWishList = daoWishlist.totalWishList(cus.getCustomer_id());

            //data ordere
            DAOOrder_Item daoOrder_item = new DAOOrder_Item();
            String sql = "select orders.order_id,order_date,sum(quantity*price) as total,count(item_id) as so_san_pham,city,dia_chi_cu_the,district,ward,address.address_id , order_status from order_item,orders, address\n" +
                    "where order_item.order_id = orders.order_id and orders.customer_id ="+cus.getCustomer_id()+" and address.address_id = orders.address_id\n" +
                    "group by order_item.order_id order by orders.order_id DESC\n";
            ResultSet rs = daoOrder_item.getData(sql);




            request.setAttribute("order", rs);
            request.setAttribute("totalOrder",totalOrder);
            request.setAttribute("totalWishList", totalWishList);
            request.setAttribute("address", addressVector);
            request.setAttribute("wishlist", vector);
            request.getRequestDispatcher("template/front-end/user-dashboard.jsp").forward(request,response);
        }else{
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
