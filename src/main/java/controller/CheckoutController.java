package controller;

import Dal.DAOAddress;
import Model.Address;
import Model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Vector;

@WebServlet(name = "CheckoutController", value = "/checkoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus =(Customer) session.getAttribute("customer");
        DAOAddress daoAddress = new DAOAddress();
        String sqlSale = "select volume,product_name,image,price, ((100 - sale_percent)*price/100) as price_sale from sale, sale_details, product where sale.sale_id = sale_details.sale_id and product.product_id = sale_details.product_id;";
        ResultSet rsSale = daoAddress.getData(sqlSale);
        request.setAttribute("rsSale", rsSale);
        Vector<Address> addressVector = daoAddress.getAll(cus.getCustomer_id());
        request.setAttribute("address", addressVector);

        request.getRequestDispatcher("template/front-end/checkout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
