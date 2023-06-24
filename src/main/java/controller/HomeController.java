package controller;

import Dal.DAOProduct;
import Model.Product;
import com.mysql.cj.xdevapi.Result;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getParameter("service");
        DAOProduct dao = new DAOProduct();
        String sql = "select distinct category_name from product";
        ResultSet rs = dao.getData(sql);

        request.setAttribute("category_name", rs);
        if(service==null) service = "displayAll";
        if(service.equals("displayAll")) {
            String pageSt = request.getParameter("page");
            if (pageSt == null) {
                System.out.println("dsghf");
                pageSt = "1";
            }
            int quantityPage = 0;
//            if(dao.returnSoLuong() % 9 != 0){
//                quantityPage = (dao.returnSoLuong() / 9) + 1;
//            }else{
//                quantityPage = (dao.returnSoLuong() / 9);
//            }
            int page = Integer.parseInt(pageSt);
//            if(page <= quantityPage || page < 0) {
                Vector<Product> vector = dao.getAll("SELECT * FROM product ORDER BY product_id LIMIT " + page + ", 9;");
                request.setAttribute("pageIndex", page);
                request.setAttribute("data", vector);
                dispath(request, response, "template/front-end/home.jsp");
//            }
        }
        if(service.equals("displayAllReduce")){
            Vector<Product> vector = dao.getAll("select * from product order by price DESC");
            request.setAttribute("data", vector);
            dispath(request, response, "template/front-end/home.jsp");
        }
        if(service.equals("displayAllUp")){
            Vector<Product> vector = dao.getAll("select * from product order by price ");
            request.setAttribute("data", vector);
            dispath(request, response, "template/front-end/home.jsp");
        }
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