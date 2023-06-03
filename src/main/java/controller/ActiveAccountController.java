package controller;

import Dal.AccountDBContext;
import Model.Account;
import OTPFunction.MailSending;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ActiveAccountController", value = "/activeAccount")
public class ActiveAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MailSending mail = new MailSending();
        String opt = mail.generateOtp();
        session.setAttribute("optValue", opt);
        Thread thread = new Thread() {
            @Override
            public void run() {
                mail.authenEmail("qwertyy.no01@gmail.com", "rcugxvbbbsugvvyf", acc.getUsername(), opt);
            }
        };
        thread.start();
        request.setAttribute("email" , acc.getUsername());
        request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String optValue = (String) session.getAttribute("optValue");
        String optInput = request.getParameter("opt");
        String email = request.getParameter("email");
        Account acc = (Account) session.getAttribute("acc");
        String option = request.getParameter("option");
        if (option.equals("active")) {
            if (optInput.equals(optValue)) {
                acc.setActive(true);
                AccountDBContext ad = new AccountDBContext();
                ad.update(acc, acc.getaID());
                response.sendRedirect("home");
            } else {
                String mess = "Opt incorrect! Please check again or click send again to have a new opt";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
            }
        } else {
            doGet(request, response);
        }
    }
}