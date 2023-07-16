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
        if(request.getSession().getAttribute("admin") != null){
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
        else {
            response.sendRedirect("login");
        }


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
        if(option.equals("update")) {
            DAOCustomer customerDAO = new DAOCustomer();
            String Aid_raw = request.getParameter("customerId");
            String AName_raw = request.getParameter("customerName");
            String AEmail_raw = request.getParameter("customerEmail");
            String APhone = request.getParameter("customerPhone");
            String cBirth = request.getParameter("customerBirth");
            String CActive = request.getParameter("customerActive");

            int aid = Integer.parseInt(Aid_raw);
            HttpSession session = request.getSession();
            Customer customer = DAOCustomer.getCustomerById(aid);
            customer.setName(AName_raw);
            customer.setPhone(APhone);
            customer.setBirthday(cBirth);
            customer.setStatus(Integer.parseInt(CActive));
            customerDAO.updateCustomer(customer, customer.getCustomer_id());
        }
        List<Customer> listCustomer = DAOCustomer.searchCustomer(name, ((page - 1) * 5));

        int totalCustomer = DAOCustomer.getTotalCustomer(name);
        double totalPages = Math.ceil((double) totalCustomer / 5);

        request.setAttribute("listCustomer", listCustomer);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-user.jsp").forward(request, response);
    }
    }
