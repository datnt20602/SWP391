package controller;

import Dal.DAOProduct;
import Model.Admin;
import Model.Product;
import Model.Staff;
import com.mysql.cj.xdevapi.Result;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

@WebServlet(name = "HomeController", urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        DAOProduct dao = new DAOProduct();
        String sql = "select distinct category_name from product";
        ResultSet rs = dao.getData(sql);
        HttpSession session = request.getSession();
        Vector<Product> vector = new Vector<>();
        String page_raw = request.getParameter("page");

        int page = 1;

        if (session.getAttribute("staff") != null) {
            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else if (session.getAttribute("admin") != null) {
            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
        } else {
            request.setAttribute("category_name", rs);
            if (service == null) service = "displayAll";

            // Create get page and create total page
            if (page_raw != null && !page_raw.equals("1")) {
                page = Integer.parseInt(page_raw);
            }
            int totalProduct = dao.getTotalProduct();
            double totalPages = Math.ceil((double) totalProduct / 12);
            request.setAttribute("pageNumber", page);
            request.setAttribute("totalPages", totalPages);

            // Use limit to limit result
            if (service.equals("displayAll")) {
                vector = dao.getAll("SELECT * FROM product limit 12 offset " + ((page - 1) * 12));
                request.setAttribute("data", vector);
                dispath(request, response, "template/front-end/home.jsp");
            }

            if (service.equals("displayAllReduce")) {
                vector = dao.getAll("select * from product order by price DESC limit 12 offset " + ((page - 1) * 12));
                request.setAttribute("data", vector);
                dispath(request, response, "template/front-end/home.jsp");
            }
            if (service.equals("displayAllUp")) {
                vector = dao.getAll("select * from product order by price limit 12 offset " + ((page - 1) * 12));
                request.setAttribute("data", vector);
                dispath(request, response, "template/front-end/home.jsp");
            }
        }



    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("message", "nghia");
        request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
    }

    void dispath(HttpServletRequest request,
                 HttpServletResponse response, String url)
            throws ServletException, IOException {
        RequestDispatcher disp
                = request.getRequestDispatcher(url);
        disp.forward(request, response);
    }
}