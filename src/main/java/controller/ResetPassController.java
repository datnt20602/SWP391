package controller;

import Dal.AccountDBContext;
import Dal.DAOCustomer;
import Model.Account;
import Model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ResetPassController", value = "/resetpassword")
public class ResetPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        DAOCustomer daoC = new DAOCustomer();

        HttpSession session = request.getSession();
        Customer a = (Customer) session.getAttribute("customer");
        if(newpass.equals(renewpass)){
            a.setPass(newpass);
            daoC.updateCustomerByPre(a);

            session.removeAttribute("customer");
            session.setAttribute("resetmess","Thành công! Mời đăng nhập lại !");
            response.sendRedirect("login");
        }else {
            String mess = "Mật khẩu không khớp !";
            request.setAttribute("mess",mess);
            request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request,response);
        }

    }
}