package controller;

import Model.Account;
import Model.Customer;
import OTPFunction.MailSending;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ValidateOTPController", value = "/validateOTP")
public class ValidateOTPController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MailSending mail = new MailSending();
        String opt = mail.generateOtp();
        session.setAttribute("optValue", opt);
        Customer a = (Customer) session.getAttribute("customer");
        Thread thread = new Thread() {
            @Override
            public void run() {
                mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", a.getEmail(), opt);
            }
        };
        thread.start();
        request.setAttribute("email" , a.getEmail());
        request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String optValue = (String) session.getAttribute("optValue");
        String optInput = request.getParameter("opt");

        String op = request.getParameter("option");
        if(op.equals("enter")){
            if(optInput.equals(optValue)){
                response.sendRedirect("resetpassword");
            }else {
                String mess = "Sai mã OTP. Kiểm tra lại mail !";
                request.setAttribute("mess",mess);
                request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request,response);

            }
        }else{
            doGet(request,response);
        }

    }
}