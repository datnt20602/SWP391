package controller;


import Dal.DAOAdmin;
import Dal.DAOCustomer;

import Dal.DAOStaff;
import Model.Admin;
import Model.Customer;
import Model.Staff;
import jakarta.mail.Session;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ChangePassController", value = "/changepass")
public class ChangePassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        DAOCustomer DAOCustomer = new DAOCustomer();
        DAOAdmin DAOAdmin = new DAOAdmin();
        DAOStaff DAOStaff = new DAOStaff();
        String successMessage = "Đổi mật khẩu thành công!";


        if (session.getAttribute("customer") != null) {
            Customer c = (Customer) session.getAttribute("customer");
            if (!oldpass.equals(c.getPass())) {
                request.setAttribute("mess","Mật khẩu cũ không đúng!");
            } else if (!DAOCustomer.isSecurePassword(newpass)) {
                request.setAttribute("mess","Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa, chữ thường và kí tự đặc biệt)!");
            } else if (!newpass.equals(renewpass)) {
                request.setAttribute("mess","Mật khẩu không khớp!");
            } else {
                c.setPass(newpass);
                DAOCustomer.updateCustomer(c, c.getCustomer_id());
                request.setAttribute("mess", successMessage);
            }
        } else if (session.getAttribute("admin") != null) {
            Admin a = (Admin) session.getAttribute("admin");
            if (!oldpass.equals(a.getPass())) {
                request.setAttribute("mess","Mật khẩu cũ không đúng!");
            } else if (!DAOAdmin.isSecurePassword(newpass)) {
                request.setAttribute("mess","Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa, chữ thường và kí tự đặc biệt)!");
            } else if (!newpass.equals(renewpass)) {
                request.setAttribute("mess","Mật khẩu không khớp!");
            } else {
                a.setPass(newpass);
                DAOAdmin.updateAdmin(a, a.getAdmin_id());
                request.setAttribute("mess", successMessage);
            }
        } else if (session.getAttribute("staff") != null) {
            Staff s = (Staff) session.getAttribute("staff");
            if (!oldpass.equals(s.getPass())) {
                request.setAttribute("mess","Mật khẩu cũ không đúng!");
            } else if (!DAOStaff.isSecurePassword(newpass)) {
                request.setAttribute("mess","Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa, chữ thường và kí tự đặc biệt)!");
            } else if (!newpass.equals(renewpass)) {
                request.setAttribute("mess","Mật khẩu không khớp!");
            } else {
                s.setPass(newpass);
                DAOStaff.updateStaff(s, s.getStaff_id());
                request.setAttribute("mess", successMessage);
            }
        }



        request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);

    }
}