package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "HomeController", urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        if (session.getAttribute("isAdmin") != null) {
//            request.getRequestDispatcher("template/front-end/admin-home.jsp").forward(request, response);
//        } else if (session.getAttribute("isStaff") != null) {
//            request.getRequestDispatcher("template/front-end/staff-home.jsp").forward(request, response);
//        } else {
//            request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
//        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("message", "nghia");
        request.getRequestDispatcher("template/front-end/home.jsp").forward(request, response);
    }
}