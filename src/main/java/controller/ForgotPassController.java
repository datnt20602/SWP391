package controller;


import Dal.DAOAdmin;
import Dal.DAOCustomer;

import Dal.DAOStaff;
import Model.Admin;
import Model.Customer;
import Model.Staff;
import OTPFunction.MailSending;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ForgotPassController", value = "/forgotpass")
public class ForgotPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/forgot.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        DAOCustomer daoC = new DAOCustomer();
//        Customer a = daoC.searchByEmail(username);
//        if(a == null){
//            request.setAttribute("mess", "Tài khoản không tồn tại !");
//
//            request.getRequestDispatcher("template/front-end/forgot.jsp").forward(request, response);
//
//        }else {
//            HttpSession session = request.getSession();
//            session.setAttribute("customer",a);
//            response.sendRedirect("validateOTP");
//
//        }

        String username = request.getParameter("username");
        DAOCustomer daoCustomer = new DAOCustomer();
        DAOAdmin daoAdmin = new DAOAdmin();
        DAOStaff daoStaff = new DAOStaff();

        Customer customer = daoCustomer.searchByEmail(username);
        Admin admin = daoAdmin.searchByEmail(username);
        Staff staff = daoStaff.searchByEmail(username);

        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("validateOTP");
        } else if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("validateOTP");
        } else if (staff != null) {
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            response.sendRedirect("validateOTP");
        } else {
            request.setAttribute("mess", "Tài khoản không tồn tại!");
            request.getRequestDispatcher("template/front-end/forgot.jsp").forward(request, response);
        }


    }
}