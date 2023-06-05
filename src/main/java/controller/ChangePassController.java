package controller;

import Dal.AccountDBContext;
import Model.Account;
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
        Account a = (Account) session.getAttribute("acc");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        AccountDBContext adb = new AccountDBContext();

        if (!oldpass.equals(a.getPassword())) {

            request.setAttribute("mess", "Wrong old-password !");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Re-Password does not match!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
            return;
        }
        if (newpass.equals(renewpass)) {
            a.setPassword(newpass);
            adb.update(a,a.getaID());

            request.setAttribute("mess", "Change Password successfully!");
            request.getRequestDispatcher("template/front-end/change-password.jsp").forward(request, response);
        }


    }
}