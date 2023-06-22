package controller;

import Dal.AccountDBContext;
import Model.Account;
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
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");
        if (!pass.equals(repass)) {
            request.setAttribute("mess", "Pass not match!");
            request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
        } else {
            AccountDBContext adb = new AccountDBContext();
            Account a = adb.checkAccountExist(user);
            if (a == null) {
                Account b = new Account();
                b.setName(fullname);
                b.setUsername(user);
                b.setPassword(pass);
                adb.insertAccount(fullname, user, pass);
                HttpSession session = request.getSession();
                Account acc = adb.getAccountByEmail(user);
                session.setAttribute("acc", acc);
                response.sendRedirect("activeAccount");
            } else {
                request.setAttribute("mess", "Account Exist!");
                request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
            }
        }
    }
}