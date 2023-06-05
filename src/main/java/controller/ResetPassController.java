package controller;

import Dal.AccountDBContext;
import Model.Account;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ResetPassController", value = "/resetpassword")
public class ResetPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        AccountDBContext adb = new AccountDBContext();

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("a");
        if(newpass.equals(renewpass)){
            a.setPassword(newpass);
            adb.update(a,a.getaID());

            session.removeAttribute("a");
            session.setAttribute("resetmess","Reset password SUCCESSFULLY! Please login again !");
            response.sendRedirect("login");
        }else {
            String mess = "Password doesn't match !";
            request.setAttribute("mess",mess);
            request.getRequestDispatcher("template/front-end/reset-password.jsp").forward(request,response);
        }

    }
}