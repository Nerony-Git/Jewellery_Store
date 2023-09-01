package com.george.jewellery_store;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import com.george.jewellery_store.dao.ProductDao;
import com.george.jewellery_store.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDao = new ProductDao();

    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Assuming productDao is your DAO for fetching products
        List<Product> allProducts = null;
        try {
            allProducts = productDao.getAllProducts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("allProducts", allProducts);

        HttpSession session = request.getSession();
        String sessionID = session.getId();
        session.setAttribute("sessionID", sessionID);

        // Forward the request to the JSP page
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}