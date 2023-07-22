package controller;



import Dal.DAOAdmin;
import Dal.DAOCustomer;

import Dal.DAOStaff;
import Model.Admin;

import Dal.DAOCustomer;


import Model.Customer;
import Model.Staff;
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
        Staff accStaff = (Staff) session.getAttribute("staff");
        if (acc != null) {
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
            request.setAttribute("email", acc.getEmail());
            request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
        } else if (accStaff != null) {
            MailSending mail = new MailSending();
            String opt = mail.generateOtp();
            session.setAttribute("optValue", opt);
            Thread thread = new Thread() {
                @Override
                public void run() {
                    mail.authenEmailStaff("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", accStaff.getEmail(), accStaff.getPass(), opt);
                }
            };
            thread.start();
            request.setAttribute("email", accStaff.getEmail());
            request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String optValue = (String) session.getAttribute("optValue");
//        String optInput = request.getParameter("opt");
//        String email = request.getParameter("email");
//        Customer acc = (Customer) session.getAttribute("customer");
//        Staff accStaff = (Staff) session.getAttribute("staff");
//        String option = request.getParameter("option");
//        if (acc != null) {
//            if (option.equals("active")) {
//                if (optInput.equals(optValue)) {
//                    acc.setStatus(1);
//                    DAOCustomer daoC = new DAOCustomer();
//                    daoC.updateCustomerByPre(acc);
//                    session.setAttribute("customer", acc);
//
//                    response.sendRedirect("home");
//                } else {
//                    String mess = "Sai mã OTP, Xin hãy nhập lại";
//                    request.setAttribute("mess", mess);
//                    request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
//                }
//            } else {
//                doGet(request, response);
//            }
//        } else if (accStaff != null) {
//            if (option.equals("active")) {
//                if (optInput.equals(optValue)) {
//                    accStaff.setActive(1);
//                    //accStaff.getAdmin_id();
//                    DAOStaff daoS = new DAOStaff();
//                    daoS.updateStaffByPre(accStaff);
//                    session.setAttribute("staff", accStaff);
//
//                    response.sendRedirect("home");
//                } else {
//                    String mess = "Sai mã OTP, Xin hãy nhập lại";
//                    request.setAttribute("mess", mess);
//                    request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
//                }
//            } else {
//                doGet(request, response);
//            }
//        }
//
//
//    }
        HttpSession session = request.getSession();
        String optValue = (String) session.getAttribute("optValue");
        String optInput = request.getParameter("opt");
        String email = request.getParameter("email");
        Customer acc = (Customer) session.getAttribute("customer");
        Staff accStaff = (Staff) session.getAttribute("staff");
        String option = request.getParameter("option");

        if (option.equals("active")) {
            if (optInput.equals(optValue)) {
                if (acc != null) {
                    acc.setStatus(1);
                    DAOCustomer daoC = new DAOCustomer();
                    daoC.updateCustomerByPre(acc);
                    session.setAttribute("customer", acc);
                } else if (accStaff != null) {
                    accStaff.setActive(1);
                    DAOStaff daoS = new DAOStaff();
                    daoS.updateStaffByPre(accStaff);
                    session.setAttribute("staff", accStaff);
                }
                response.sendRedirect("home");
            } else {
                String mess = "Sai mã OTP, Xin hãy nhập lại";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
            }
        } else if (option.equals("sendAgain")) {
            // Gửi lại email khi người dùng ấn nút "Gửi lại mã OTP"
            session.removeAttribute("optValue");
            MailSending mail = new MailSending();
            String newOptValue = mail.generateOtp();
            session.setAttribute("optValue", newOptValue);
            Thread thread = new Thread() {
                @Override
                public void run() {
                    if (acc != null) {
                        mail.authenEmail("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", acc.getEmail(), newOptValue);
                    } else if (accStaff != null) {
                        mail.authenEmailStaff("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", accStaff.getEmail(), accStaff.getPass(), newOptValue);
                    }
                }
            };
            thread.start();
            request.getRequestDispatcher("template/front-end/activeAccount.jsp").forward(request, response);
        }
    }
}