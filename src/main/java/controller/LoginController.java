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

        Customer cus = DaoC.login(user,pass);
        if(cus != null){
            session.setAttribute("customer", cus);
            response.sendRedirect("home");
        }else{
            DAOAdmin DaoA = new DAOAdmin();
            Admin ad = DaoA.login(user,pass);
            if(ad != null){
                session.setAttribute("admin", ad);

            }else{
                DAOStaff DaoS = new DAOStaff();
                Staff st = DaoS.login(user,pass);
                if(st != null){
                    session.setAttribute("staff",st);

                }
                else{
                    request.setAttribute("mess", "Wrong Username or Password");
                    request.getRequestDispatcher("template/front-end/login.jsp").forward(request, response);
                }
            }
        }

//        AccountDBContext adb = new AccountDBContext();
//        Account a = adb.getAdmin(user, pass);
//        if (a==null) {
//            a = adb.getStaff(user, pass);
//            if (a == null) {
//                a = adb.getCustomer(user, pass);
//                if (a == null) {
//                    request.setAttribute("mess", "Wrong Username or Password");
//                    request.getRequestDispatcher("template/front-end/login.jsp").forward(request, response);
//                } else {
//                    session.setAttribute("acc", a);
//                    response.sendRedirect("home");
//                }
//            }
//            else {
//                session.setAttribute("acc", a);
//                session.setAttribute("isStaff", true);
//                response.sendRedirect("home");
//            }
//        }else{
//            session.setAttribute("acc", a);
//            session.setAttribute("isAdmin", true);
//            response.sendRedirect("home");
//        }

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