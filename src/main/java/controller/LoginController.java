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
import Model.Account;
import Dal.AccountDBContext;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String user = request.getParameter("Username");
        String pass = request.getParameter("Password");
        DAOCustomer DaoC = new DAOCustomer();
        if(DaoC.login(user,pass) != null){
            Customer cus = DaoC.login(user,pass);
            session.setAttribute("customer", cus);
            response.sendRedirect("home");
        }else{
            DAOStaff DaoS = new DAOStaff();
            if(DaoS.login(user, pass) != null){
                Staff st = DaoS.login(user, pass);
                session.setAttribute("staff", st);

            }else{
                DAOAdmin DaoA = new DAOAdmin();
                if(DaoA.login(user, pass) != null){
                    Admin ad = DaoA.login(user, pass);
                    session.setAttribute("admin", ad);

                }else{
                    response.sendRedirect("home");
                }
            }
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}