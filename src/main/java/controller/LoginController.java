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

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String user = request.getParameter("Username");
        String pass = request.getParameter("Password");
        DAOCustomer DaoC = new DAOCustomer();
        Customer customer = DaoC.login(user, pass);
        if (customer != null) {
            if (customer.getStatus() == 1) {
                session.setAttribute("customer", customer);
                response.sendRedirect("home");
            } else {
                session.setAttribute("customer", customer);
                response.sendRedirect("activeAccount");
            }
        } else {
            DAOStaff DaoS = new DAOStaff();
            Staff staff = DaoS.login(user, pass);
            if ( staff != null && staff.getPass().equals(pass)) {
                if(staff.getActive()==1){
                    session.setAttribute("staff", staff);
                    response.sendRedirect("home");
                }else{
                    session.setAttribute("staff",staff);
                    response.sendRedirect("activeAccount");
                }


            } else {
                DAOAdmin DaoA = new DAOAdmin();
                if (DaoA.login(user, pass) != null) {
                    Admin ad = DaoA.login(user, pass);
                    session.setAttribute("admin", ad);
                    //request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
                    response.sendRedirect("home");

                } else {
                    String mess = "Tài khoản hoặc mật khẩu không đúng !";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("template/front-end/login.jsp").forward(request, response);
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