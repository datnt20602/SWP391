package controller;

import Dal.DAOFeedback;
import Dal.DAOStaff;
import Model.Feedback;
import Model.Staff;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminFeedBackController", value = "/adminfeedback")
public class AdminFeedBackController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("admin") != null || request.getSession().getAttribute("staff") != null ){
            String page_raw = request.getParameter("page");
            String name_raw = request.getParameter("name");
            DAOFeedback DAOFeedback = new DAOFeedback();
            String name = "%";

            int page = 1;

            if (page_raw != null && !page_raw.equals("1")) {
                page = Integer.parseInt(page_raw);
            }
            if (name_raw != null && !name_raw.isEmpty()) {
                name += name_raw + "%";
            }

            List<Feedback> listFeedback = DAOFeedback.SearchFeedback(name,((page)-1)*5);

            int totalFeedback = DAOFeedback.getTotalFeedback(name);
            double totalPages = Math.ceil((double) totalFeedback / 5);

            request.setAttribute("listFeedback", listFeedback);

            request.setAttribute("pageNumber", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("template/front-end/admin-feedback.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        String name_raw = request.getParameter("name");
        DAOFeedback DAOFeedback = new DAOFeedback();
        String option = request.getParameter("option");
        String name = "%";

        int page = 1;

        if (page_raw != null && !page_raw.equals("1")) {
            page = Integer.parseInt(page_raw);
        }
        if (name_raw != null && !name_raw.isEmpty()) {
            name += name_raw + "%";
        }
        if (option.equals("delete")) {
            String id_raw = request.getParameter("feedback_id");
            int id = Integer.parseInt(id_raw);
            DAOFeedback.delete(id);
        }

        List<Feedback> listFeedback = DAOFeedback.SearchFeedback(name,((page)-1)*5);

        int totalFeedback = DAOFeedback.getTotalFeedback(name);
        double totalPages = Math.ceil((double) totalFeedback / 5);

        request.setAttribute("listFeedback", listFeedback);

        request.setAttribute("pageNumber", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("template/front-end/admin-feedback.jsp").forward(request, response);

    }
}