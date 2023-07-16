package controller;

import Dal.DAOAdmin;
import Dal.DAOCustomer;
import Dal.DAOStaff;
import Model.Admin;
import Model.Customer;
import Model.Staff;
import OTPFunction.MailSending;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminAddStaffController", value = "/addStaff")
public class AdminAddStaffController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") != null){
            request.getRequestDispatcher("template/front-end/admin-add-staff.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String user = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repass");

        DAOStaff staff = new DAOStaff();

        boolean password = staff.isSecurePassword(pass);
        if(!password){
            request.setAttribute("mess", "Mật khẩu phải gồm 8 kí tự (Gồm 1 chữ hoa,chữ thường và kí tự đặc biệt)!");
            request.getRequestDispatcher("template/front-end/admin-add-staff.jsp").forward(request, response);
        }
        else if (!pass.equals(repass)) {
            request.setAttribute("mess", "Mật khẩu không khớp!");
            request.getRequestDispatcher("template/front-end/admin-add-staff.jsp").forward(request, response);
        } else {
            boolean check = true;
            DAOCustomer DaoC  = new DAOCustomer();
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
                Admin admin = (Admin) session.getAttribute("admin");
                int adminId = admin.getAdmin_id();
                Staff newStaff = new Staff(fullname, user, phone, pass, 0, adminId);
                DaoS.insertStaff(newStaff,adminId);

                // Send email to the staff
                MailSending mail = new MailSending();


                Thread thread = new Thread() {
                    @Override
                    public void run() {
                        mail.sendEmailPassStaff("datnguyentien.20602@gmail.com", "lygzmpkipxtylicx", newStaff.getEmail(),pass);
                    }
                };
                thread.start();

                request.setAttribute("email", newStaff.getEmail());
                request.setAttribute("mess", "Thêm tài khoản thành nhân viên công!");
                request.getRequestDispatcher("template/front-end/admin-add-staff.jsp").forward(request, response);

            }

            else {
                request.setAttribute("mess", "Email đã tồn tại!");
                request.getRequestDispatcher("template/front-end/admin-add-staff.jsp").forward(request, response);
            }
        }
    }
}