package controller;

import Dal.DAOAdmin;
import Dal.DAOCustomer;
import Dal.DAOStaff;
import Dal.DAOWishlist;
import Model.Admin;
import Model.Customer;
import Model.Staff;
import Model.Wishlist;
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
            } else if (customer.getStatus() == 2) {
                session.removeAttribute("customer");
                session.setAttribute("alertAccount", "Tài khoản của bạn đã bị khóa, vui lòng liên hệ admin");
                response.sendRedirect("login");
            } else {
                session.setAttribute("customer", customer);
                response.sendRedirect("activeAccount");
            }
        } else {
            DAOStaff DaoS = new DAOStaff();
            Staff staff = DaoS.login(user, pass);
            if (staff != null) {
                if (staff.getActive() == 1) {
                    session.setAttribute("staff", staff);
                    response.sendRedirect("home");
                    //request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request,response);
                } else {
                    session.setAttribute("staff", staff);
                    response.sendRedirect("activeAccount");
                }

            } else {
                DAOAdmin DaoA = new DAOAdmin();
                if (DaoA.login(user, pass) != null) {
                    Admin ad = DaoA.login(user, pass);
                    session.setAttribute("admin", ad);
                    response.sendRedirect("home");
                    //request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request,response);
                } else {
//                    String mess = "Tài khoản hoặc mật khẩu không đúng !";
//                    request.setAttribute("mess", mess);
//                    request.getRequestDispatcher("template/front-end/login.jsp").forward(request, response);

                    boolean check = true;

                    if (DaoC.searchByEmail(user) != null) {
                        check = false;
                    }

                    if (DaoS.searchByEmail(user) != null) {
                        check = false;
                    }

                    if (DaoA.searchByEmail(user) != null) {
                        check = false;
                    }
                    if (check) {

                        session.setAttribute("alertAccount", "Email chưa được đăng kí tài khoản, bạn sẽ được chuyển đến trang đăng kí");
                        response.sendRedirect("signup");
                    } else {
                        String email = request.getParameter("Username");
                        session.setAttribute("alertAccount", "Nhập sai tài khoản hoặc mật khẩu, vui lòng kiểm tra lại");
                        session.setAttribute("enteredEmail", email);
                        response.sendRedirect("login");
                    }
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