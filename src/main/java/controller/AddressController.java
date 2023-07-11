package controller;

import Dal.DAOAddress;
import Model.Address;
import Model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddressController", value = "/address")
public class AddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");
        String check = request.getParameter("addAddress");
        DAOAddress dao = new DAOAddress();
        int id = dao.getIdAddress();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address= request.getParameter("address");
        String ten_goi_nho = request.getParameter("ten_nho");
        Address adr = new Address(id,name,email,phone,address,ten_goi_nho);
        dao.insertAddress(adr, cus.getCustomer_id());
        if(check.equals("checkout")){
            response.sendRedirect("checkoutController");
        }else {
            response.sendRedirect("customer");
        }
    }
}
