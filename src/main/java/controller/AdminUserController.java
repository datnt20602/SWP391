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
import java.util.List;

@WebServlet(name = "AdminUserController", value = "/user")
public class AdminUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");

        String name = "%";

        int page = 1;
        DAOCustomer DAOCustomer = new DAOCustomer();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }

        List<Customer> listCustomer = DAOCustomer.searchCustomer(name,((page)-1)*5);

        int totalCustomer = DAOCustomer.getTotalCustomer(name);
        double totalPages = Math.ceil((double) totalCustomer / 5);

        request.setAttribute("listCustomer", listCustomer);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");

        String option = request.getParameter("option");
        String name = "%";

        int page = 1;
        DAOCustomer DAOCustomer = new DAOCustomer();

        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }
        if (option.equals("delete")) {
            String id_raw = request.getParameter("customerid");
            int id = Integer.parseInt(id_raw);
            DAOCustomer.delete(id);
        }
//        if(option.equals("updateProfile")) {
//            DAOAdmin DAOAdmin = new DAOAdmin();
//            String Aid_raw = request.getParameter("adminId");
//            String AName_raw = request.getParameter("adminName");
//            String AEmail_raw = request.getParameter("adminEmail");
//            String APhone = request.getParameter("adminPhone");
//            String street = request.getParameter("adminStreet");
//            String city = request.getParameter("adminCity");
//            String pass = request.getParameter("adminPass");
//
//            int aid = Integer.parseInt(Aid_raw);
//            HttpSession session = request.getSession();
//            Admin admin = (Admin) session.getAttribute("admin");
//            admin.setAdmin_id(aid);
//            admin.setName(AName_raw);
//            admin.setEmail(AEmail_raw);
//            admin.setPhone(APhone);
//            admin.setStreet(street);
//            admin.setCity(city);
//            admin.setPass(pass);
//            DAOAdmin.update(admin);
//            session.setAttribute("admin", admin);
//        }
        List<Customer> listCustomer = DAOCustomer.searchCustomer(name, ((page - 1) * 5));

        int totalCustomer = DAOCustomer.getTotalCustomer(name);
        double totalPages = Math.ceil((double) totalCustomer / 5);

        request.setAttribute("listCustomer", listCustomer);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-user.jsp").forward(request, response);
    }
    }
