package controller;


import Model.Admin;
import Model.Customer;
import Model.Staff;
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
        Customer c = (Customer) session.getAttribute("customer");
        Admin a = (Admin) session.getAttribute("admin");
        Staff s = (Staff) session.getAttribute("staff");
        if (c != null) {
            Thread thread = new Thread() {
                @Override
                public void run() {
                    mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", c.getEmail(), opt);
                }
            };
            thread.start();
            request.setAttribute("email", c.getEmail());
            request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);
        }
        if (a != null) {
            Thread thread = new Thread() {
                @Override
                public void run() {
                    mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", a.getEmail(), opt);
                }
            };
            thread.start();
            request.setAttribute("email", a.getEmail());
            request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);
        }
        if (s != null) {
            Thread thread = new Thread() {
                @Override
                public void run() {
                    mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", s.getEmail(), opt);
                }
            };
            thread.start();
            request.setAttribute("email", s.getEmail());
            request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String optValue = (String) session.getAttribute("optValue");
        String optInput = request.getParameter("opt");
        String op = request.getParameter("option");

        if (op.equals("enter")) {
            if (optInput.equals(optValue)) {
                response.sendRedirect("resetpassword");
            } else {
                String mess = "Sai mã OTP. Kiểm tra lại mail!";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);
            }
        } else if (op.equals("sendAgain")) {
            // Gửi lại email OTP khi người dùng ấn nút "Gửi lại OTP"
            MailSending mail = new MailSending();
            String newOptValue = mail.generateOtp();
            session.setAttribute("optValue", newOptValue);

            // Lấy đối tượng User để gửi lại email OTP
            Customer c = (Customer) session.getAttribute("customer");
            Admin a = (Admin) session.getAttribute("admin");
            Staff s = (Staff) session.getAttribute("staff");

            Thread thread = new Thread() {
                @Override
                public void run() {
                    if (c != null) {
                        mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", c.getEmail(), newOptValue);
                    } else if (a != null) {
                        mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", a.getEmail(), newOptValue);
                    } else if (s != null) {
                        mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", s.getEmail(), newOptValue);
                    }
                }
            };
            thread.start();
            request.getRequestDispatcher("template/front-end/ValidateOTP.jsp").forward(request, response);

        }else{
            doGet(request, response);
        }
    }
}