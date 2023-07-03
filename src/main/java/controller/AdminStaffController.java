package controller;

import Dal.DAOCustomer;

import Dal.DAOProduct;
import Dal.DAOStaff;
import Model.Customer;
import Model.Product;
import Model.Staff;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminStaffController", value = "/staff")
public class AdminStaffController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");

        String name = "%";

        int page = 1;
        DAOStaff DAOStaff = new DAOStaff();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }

        List<Staff> listStaff = DAOStaff.searchStaff(name,((page)-1)*5);

        int totalStaff = DAOStaff.getTotalStaff(name);
        double totalPages = Math.ceil((double) totalStaff / 5);

        request.setAttribute("listStaff", listStaff);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");

        String option = request.getParameter("option");
        String name = "%";

        int page = 1;
        DAOStaff DAOStaff = new DAOStaff();
        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name = name_raw + "%";
        }
        if (option.equals("delete")) {
            String id_raw = request.getParameter("staffid");
            int id = Integer.parseInt(id_raw);
            DAOStaff.delete(id);
        }
        List<Staff> listStaff = DAOStaff.searchStaff(name, ((page - 1) * 5));

        int totalStaff = DAOStaff.getTotalStaff(name);
        double totalPages = Math.ceil((double) totalStaff / 5);

        request.setAttribute("listStaff", listStaff);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-staff.jsp").forward(request, response);
    }
}