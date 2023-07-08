package controller;


import Dal.DAOAdmin;
import Dal.DAOCustomer;

import Dal.DAOStaff;
import Model.Admin;
import Model.Customer;
import Model.Staff;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ResetPassController", value = "/resetpassword")
public class ResetPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String newpass = request.getParameter("newpass");
//        String renewpass = request.getParameter("renewpass");
//
//        DAOCustomer daoC = new DAOCustomer();
//
//        HttpSession session = request.getSession();
//        Customer a = (Customer) session.getAttribute("customer");
//        if(newpass.equals(renewpass)){
//            a.setPass(newpass);
//            daoC.updateCustomerByPre(a);
//
//            session.removeAttribute("customer");
//            session.setAttribute("resetmess","Thành công! Mời đăng nhập lại !");
//            response.sendRedirect("login");
//        }else {
//            String mess = "Mật khẩu không khớp !";
//            request.setAttribute("mess",mess);
//            request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request,response);
//        }
//
//    }
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Admin admin = (Admin) session.getAttribute("admin");
        Staff staff = (Staff) session.getAttribute("staff");

        String forwardPage = "template/front-end/reset-password.jsp";

        if (newpass.equals(renewpass)) {
            if (customer != null) {
                DAOCustomer daoCustomer = new DAOCustomer();
                if (daoCustomer.isSecurePassword(newpass)) {
                    customer.setPass(newpass);
                    daoCustomer.updateCustomerByPre(customer);
                    session.removeAttribute("customer");
                    session.setAttribute("resetmess", "Thành công! Mời đăng nhập lại!");
                    response.sendRedirect("login");
                    return;
                }
            } else if (admin != null) {
                DAOAdmin daoAdmin = new DAOAdmin();
                if (daoAdmin.isSecurePassword(newpass)) {
                    admin.setPass(newpass);
                    daoAdmin.updateAdminByPre(admin);
                    session.removeAttribute("admin");
                    session.setAttribute("resetmess", "Thành công! Mời đăng nhập lại!");
                    response.sendRedirect("login");
                    return;
                }
            } else if (staff != null) {
                DAOStaff daoStaff = new DAOStaff();
                if (daoStaff.isSecurePassword(newpass)) {
                    staff.setPass(newpass);
                    daoStaff.updateStaffByPre(staff);
                    session.removeAttribute("staff");
                    session.setAttribute("resetmess", "Thành công! Mời đăng nhập lại!");
                    response.sendRedirect("login");
                    return;
                }
            }
        }

        String mess = "Mật khẩu không khớp hoặc không đáp ứng yêu cầu bảo mật!";
        request.setAttribute("mess", mess);
        request.getRequestDispatcher(forwardPage).forward(request, response);

    }
}