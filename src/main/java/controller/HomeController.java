package controller;

import Dal.DAOProduct;
import Model.Product;
import com.mysql.cj.xdevapi.Result;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOProduct dao = new DAOProduct();
        Vector<Product> vector = dao.getAll();
        String sql = "select distinct category_name from product";
        ResultSet rs =  dao.getData(sql);
        request.setAttribute("category_name", rs);
        request.setAttribute("data", vector);
        dispath(request,response,"template/front-end/home.jsp");
//        response.sendRedirect("template/front-end/login.jsp");
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