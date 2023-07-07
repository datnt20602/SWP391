package controller;


import Dal.DAOCustomer;

import Model.Customer;
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
        Customer c = (Customer) session.getAttribute("customer");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        DAOCustomer customer = new DAOCustomer();
        boolean password = customer.isSecurePassword(newpass);


        if (!oldpass.equals(c.getPass())) {
            request.setAttribute("mess", "Mật khẩu cũ không đúng!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if(!password){
            request.setAttribute("mess", "Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa,chữ thường và kí tự đặc biệt)!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Mật khẩu không khớp!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if (newpass.equals(renewpass)) {
            if (session.getAttribute("customer") != null) {
                c.setPass(newpass);
                customer.updateCustomer(c, c.getCustomer_id());
                request.setAttribute("mess", "Đổi mật khẩu thành công!");
                request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            }
//            else {
//                a.setPass(newpass);
//                adb.updateCustomer(a, a.getaID());
//                request.setAttribute("mess", "Đổi mật khẩu thành công!");
//                request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
//            }
        }


    }
}