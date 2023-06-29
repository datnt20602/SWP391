package controller;


import Dal.DAOAdmin;
import Dal.DAOCustomer;
import Dal.DAOStaff;
import Dal.DAOProduct;
import Model.Customer;
import Model.Staff;
import OTPFunction.MailSending;
import com.mysql.cj.xdevapi.Schema;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/signup")
public class SignUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String user = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");

        DAOCustomer customer = new DAOCustomer();

        boolean password = customer.isSecurePassword(pass);
        if(!password){
            request.setAttribute("mess", "Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa,chữ thường và kí tự đặc biệt)!");
            request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
        }
        else if (!pass.equals(repass)) {
            request.setAttribute("mess", "Mật khẩu không khớp!");
            request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
        } else {
            boolean check = true;
            DAOCustomer DaoC = new DAOCustomer();
            if (DaoC.searchByEmail(user) != null) {
                check = false;
            }
            DAOStaff DaoS = new DAOStaff();
            if (DaoS.searchByEmail(user) != null) {
                check = false;
            }
            DAOAdmin DaoA = new DAOAdmin();
            if (DaoA.searchByEmail(user) != null) {
                check = false;
            }
            if (check) {
                HttpSession session = request.getSession();
                Customer newCustomer = new Customer(fullname, phone, user, pass, 0);
                DaoC.insertCustomer(newCustomer);
                Customer cus = DaoC.login(user, pass);
                session.setAttribute("customer", cus);
                response.sendRedirect("activeAccount");
            }

            else {
                request.setAttribute("mess", "Email đã tồn tại!");
                request.getRequestDispatcher("template/front-end/sign-up.jsp").forward(request, response);
            }
        }
    }
}