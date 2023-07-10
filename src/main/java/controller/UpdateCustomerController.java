package controller;

import Dal.DAOCustomer;
import Model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateCustomerController", value = "/updateCustomer")
public class UpdateCustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOCustomer daoCustomer = new DAOCustomer();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        String name = request.getParameter("nameCus");
        String email = request.getParameter("emailCus");
        String phone = request.getParameter("phone");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String birthday = request.getParameter("birthday");
        System.out.println(birthday);
        Customer cus = new Customer(customer.getCustomer_id(),name,phone,email,
                customer.getPass(), customer.getStatus(),gender,birthday);
        daoCustomer.updateCustomerByPre(cus);
        response.sendRedirect("customer");
    }
}
