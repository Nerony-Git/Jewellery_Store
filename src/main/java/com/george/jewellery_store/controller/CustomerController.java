package com.george.jewellery_store.controller;

import com.george.jewellery_store.dao.CustomerDao;
import com.george.jewellery_store.dao.ProductDao;
import com.george.jewellery_store.model.Customer;
import com.george.jewellery_store.model.Product;
import com.george.jewellery_store.model.Wishlist;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


@WebServlet({
        "/register", "/login", "/logout", "/update"
})
public class CustomerController extends HttpServlet {

    private CustomerDao customerDao = new CustomerDao();
    private ProductDao productDao = new ProductDao();

    private static final DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Override
    public void init() {
        customerDao = new CustomerDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/register":
                    newCustomer(request, response);
                    break;
                case "/login":
                    customerLogin(request, response);
                    break;
                case "/logout":
                    customerLogout(request, response);
                    break;
                case "/update":
                    customerUpdate(request, response);
                    break;
                default:
                    List<Product> allProducts = productDao.getAllProducts();
                    request.setAttribute("allProducts", allProducts);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void customerLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String customerID = "";

        try {
            Customer customer = customerDao.validateCustomer(username, password);
            HttpSession session = request.getSession();

            if (customer != null) {
                customerID = customer.getCustomerID();
                List<Wishlist> wishlistItems = productDao.getCustomerWishlistItems(customerID);
                session.setAttribute("wishlistItems", wishlistItems);
                session.setAttribute("customer", customer);
                session.setAttribute("successMsg", "Account login successfully.");
                session.setAttribute("loginStatus", true);
            } else {
                session.setAttribute("errorMsg", "Invalid username or password.");
                session.setAttribute("loginStatus", false);
            }

            List<Product> allProducts = productDao.getAllProducts();
            request.setAttribute("allProducts", allProducts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void newCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String otherName = request.getParameter("otherName");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"), df);
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String postalAddress = request.getParameter("postalAddress");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        Customer newCustomer = new Customer();
        newCustomer.setFirstName(firstName);
        newCustomer.setLastName(lastName);
        newCustomer.setOtherName(otherName);
        newCustomer.setUsername(username);
        newCustomer.setGender(gender);
        newCustomer.setDob(dob);
        newCustomer.setContact(contact);
        newCustomer.setEmail(email);
        newCustomer.setAddress(address);
        newCustomer.setPostalAddress(postalAddress);
        newCustomer.setPassword(password);

        try {
            boolean u = customerDao.registerCustomer(newCustomer);

            if (u) {
                session.setAttribute("successMsg", "Account created successfully");
                session.setAttribute("registrationSuccess", true);
            } else {
                session.setAttribute("errorMsg", "Failed to create account. Try again!");
                session.setAttribute("registrationSuccess", false);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void customerLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        session.removeAttribute("customer");
        session.setAttribute("successMsg", "Successfully Logout.");
        session.setAttribute("logoutStatus", true);

        List<Product> allProducts = productDao.getAllProducts();
        request.setAttribute("allProducts", allProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void customerUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        boolean u;

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String otherName = request.getParameter("otherName");
        String gender = request.getParameter("gender");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"), df);
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String postalAddress = request.getParameter("postalAddress");
        String customerID = request.getParameter("customerID");

        try {
            Customer updatedCustomer = new Customer(firstName, lastName, otherName, gender, dob, contact, email, address, postalAddress, customerID);
            u = customerDao.updateCustomer(updatedCustomer);
            HttpSession session = request.getSession();

            if (u) {
                Customer updatedCustomerObject = customerDao.getCustomerByID(customerID);
                session.setAttribute("customer", updatedCustomerObject);
                session.setAttribute("successMsg", "Account updated successfully");
                session.setAttribute("updateSuccess", true);
            } else {
                session.setAttribute("errorMsg", "Failed to update account. Try again!");
                session.setAttribute("updateSuccess", false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);

    }
}
