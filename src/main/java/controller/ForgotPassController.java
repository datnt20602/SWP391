package controller;

import Dal.AccountDBContext;
import Model.Account;
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
        String username = request.getParameter("username");
        AccountDBContext adb = new AccountDBContext();
        Account a = adb.getAccountByEmail(username);
        if(a == null){
            request.setAttribute("mess", "Tài khoản không tồn tại !");

            request.getRequestDispatcher("template/front-end/forgot.jsp").forward(request, response);

        }else {
            HttpSession session = request.getSession();
            session.setAttribute("a",a);
            response.sendRedirect("validateOTP");

        }

    }
}