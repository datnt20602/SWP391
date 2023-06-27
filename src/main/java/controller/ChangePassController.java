package controller;

import Dal.AccountDBContext;
import Model.Account;
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
        Customer a = (Customer) session.getAttribute("acc");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        AccountDBContext adb = new AccountDBContext();

        if (!oldpass.equals(a.getPass())) {
            request.setAttribute("mess", "Mật khẩu cũ không đúng!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Mật khẩu không khớp!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
//        if (newpass.equals(renewpass)) {
//            if (session.getAttribute("isStaff") != null) {
//                a.setPass(newpass);
//                adb.updateStaff(a, a.getaID());
//                request.setAttribute("mess", "Đổi mật khẩu thành công!");
//                request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
//            } else {
//                a.setPassword(newpass);
//                adb.updateCustomer(a, a.getaID());
//                request.setAttribute("mess", "Đổi mật khẩu thành công!");
//                request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
//            }
//        }


    }
}