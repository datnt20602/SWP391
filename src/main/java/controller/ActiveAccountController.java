package controller;

import Dal.AccountDBContext;
import Dal.DAOCustomer;
import Model.Account;
import Model.Customer;
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
        Customer acc = (Customer) session.getAttribute("customer");
        MailSending mail = new MailSending();
        String opt = mail.generateOtp();
        session.setAttribute("optValue", opt);
        Thread thread = new Thread() {
            @Override
            public void run() {
                mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", acc.getEmail(), opt);
            }
        };
        thread.start();
        request.setAttribute("email" , acc.getEmail());
        request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String optValue = (String) session.getAttribute("optValue");
        String optInput = request.getParameter("opt");
        String email = request.getParameter("email");
        Customer acc = (Customer) session.getAttribute("customer");
        String option = request.getParameter("option");
        if (option.equals("active")) {
            if (optInput.equals(optValue)) {
                acc.setStatus(1);
                DAOCustomer daoC = new DAOCustomer();
                daoC.updateCustomerByPre(acc);
                session.setAttribute("customer", acc);

                response.sendRedirect("home");
            } else {
                String mess = "Sai mã OTP, Xin hãy nhập lại";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
            }
        } else {
            doGet(request, response);
        }
    }
}