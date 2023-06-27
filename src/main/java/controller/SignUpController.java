package controller;

import Dal.AccountDBContext;
import Dal.DAOAdmin;
import Dal.DAOCustomer;
import Dal.DAOStaff;
import Model.Account;
import Model.Customer;
import Model.Staff;
import OTPFunction.MailSending;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/signup")
public class SignUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String user = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");
        if (!pass.equals(repass)) {
            request.setAttribute("mess", "Pass not match!");
            request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
        } else {
            boolean check = true;
            DAOCustomer DaoC = new DAOCustomer();
            if(DaoC.searchByEmail(user) != null)check = false;
            DAOStaff DaoS = new DAOStaff();
            if(DaoS.searchByEmail(user) != null) check = false;
            DAOAdmin DaoA = new DAOAdmin();
            if(DaoA.searchByEmail(user) != null) check = false;
            if(check == true){
                HttpSession session = request.getSession();
                int id = DaoC.getIdCustomer()+1;
                Customer cus = new Customer(id,fullname,phone,user,pass,0);
                DaoC.insertCustomer(cus);
                session.setAttribute("customer", cus);
                response.sendRedirect("activeAccount");
            }
            else {
                request.setAttribute("mess", "Account Exist!");
                request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
            }
        }
    }
}