package com.george.jewellery_store.controller;

import com.george.jewellery_store.dao.OrderDao;
import com.george.jewellery_store.dao.ProductDao;
import com.george.jewellery_store.model.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet({
        "/shop", "/about_us", "/contact_us", "/product_detail", "/cart", "/add_wishlist", "/get_wishlist_count",
        "/get_wishlist_items", "/remove_wishlist_item", "/shops", "/add_to_cart", "/get_cart_items",
        "/remove_cart_item", "/get_cart_count", "/update_cart", "/checkout", "/order", "/order_history"
})

public class AdminController extends HttpServlet {

    private ProductDao productDao = new ProductDao();
    private OrderDao orderDao = new OrderDao();

    @Override
    public void init(){}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/shop":
                    shopProduct(request, response);
                    break;
                case "/shops":
                    shopProducts(request, response);
                    break;
                case "/about_us":
                    aboutUs(request, response);
                    break;
                case "/contact_us":
                    contactUs(request, response);
                    break;
                case "/product_detail":
                    productDetail(request, response);
                    break;
                case "/cart":
                    viewCart(request, response);
                    break;
                case "/add_wishlist":
                    addToWishlist(request, response);
                    break;
                case "/get_wishlist_count":
                    getWishlistCount(request, response);
                    break;
                case "/get_wishlist_items":
                    getWishlistItems(request, response);
                    break;
                case "/remove_wishlist_item":
                    deleteCustomerWishlistItem(request, response);
                    break;
                case "/add_to_cart":
                    addToCart(request, response);
                    break;
                case "/get_cart_items":
                    getCartItems(request, response);
                    break;
                case "/remove_cart_item":
                    deleteCustomerCartItem(request, response);
                    break;
                case "/get_cart_count":
                    getCartCount(request, response);
                    break;
                case "/update_cart":
                    updateCartItemDetails(request, response);
                    break;
                case "/checkout":
                    proceedToCheckout(request, response);
                    break;
                case "/order":
                    orderItems(request, response);
                    break;
                case "/order_history":
                    viewOrderHistory(request, response);
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

    private void shopProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String productMaterial = request.getParameter("id");
        List<Product> allProducts = productDao.getProductByMaterial(productMaterial);
        request.setAttribute("allProducts", allProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/shop.jsp");
        dispatcher.forward(request, response);
    }

    private void shopProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> allProducts = productDao.getAllProducts();
        request.setAttribute("allProducts", allProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/shop.jsp");
        dispatcher.forward(request, response);
    }

    private void aboutUs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> allProducts = productDao.getAllProducts();
        request.setAttribute("allProducts", allProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/about_us.jsp");
        dispatcher.forward(request, response);
    }

    private void contactUs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/contact_us.jsp");
        dispatcher.forward(request, response);
    }

    private void productDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String productID = request.getParameter("id");
        Product productDetail = productDao.getProductById(productID);
        request.setAttribute("productDetail", productDetail);
        List<Product> allProducts = productDao.getRandomProducts();
        request.setAttribute("allProducts", allProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/product_detail.jsp");
        dispatcher.forward(request, response);
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerID = request.getParameter("id");
        String sessionID = request.getParameter("sid");
        List<Cart> cartItems = productDao.getCustomerCartItems(customerID, sessionID);
        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/view_cart.jsp");
        dispatcher.forward(request, response);
    }

    private void addToWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("id");
        String customerID = request.getParameter("customerID");

        try {
            boolean u = productDao.addToWishlist(productID, customerID);

            if (u) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Product added to wishlist successfully");
                System.out.println("Success");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Unable to add product to wishlist");
                System.out.println("Failed");
            }
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error: Unable to add product to wishlist");
            System.out.println("Error");
        }
    }

    private void getWishlistCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerID = request.getParameter("customerID");

        try {
            int wishlistCount = productDao.getCustomerWishlistCount(customerID);
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("count", wishlistCount);

            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error getting wishlist count");
        }
    }

    private void getCartCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String customerID = request.getParameter("customerID");
        String sessionID = request.getParameter("sessionID");

        try {
            int cartCount = productDao.getCustomerCartCount(customerID, sessionID);
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("count", cartCount);

            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error getting cart count");
        }
    }

    private void getWishlistItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerID = request.getParameter("customerID");

        try {
            List<Wishlist> wishlistItems = productDao.getCustomerWishlistItems(customerID);
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(wishlistItems);
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error getting wishlist items");
        }
    }

    private void getCartItems(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String customerID = request.getParameter("customerID");
        String sessionID = request.getParameter("sessionID");

        try {
            List<Cart> cartItems = productDao.getCustomerCartItems(customerID, sessionID);
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(cartItems);
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error getting cart items");
        }
    }

    private void deleteCustomerWishlistItem(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        String customerID = request.getParameter("customerID");
        String productID = request.getParameter("productID");

        try {
            boolean u = productDao.deleteCustomerWishlistItem(customerID, productID);

            if (u) {
                System.out.println("Deleted Successfully");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomerCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String customerID = request.getParameter("customerID");
        String sessionID = request.getParameter("sessionID");
        String productID = request.getParameter("productID");

        try {
            boolean u = productDao.deleteCustomerCartItem(customerID, sessionID, productID);
            if (u) {
                System.out.println("Deleted Successfully");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateCartItemDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String customerID = request.getParameter("customerID");
        String sessionID = request.getParameter("sessionID");
        String productID = request.getParameter("productID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            boolean u = productDao.updateCartItemDetails(customerID, sessionID, productID, quantity);
            if (u) {
                System.out.println("Updated Successfully");
            } else {
                System.out.println("Update failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        String customerID = request.getParameter("customerID");
        String sessionID = request.getParameter("sessionID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            boolean u = productDao.addToCart(productID, customerID, sessionID, quantity);

            if (u) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Product added to cart successfully");
                System.out.println("Success");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Unable to add cart to wishlist");
                System.out.println("Failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void proceedToCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerID = request.getParameter("id");
        String sessionID = request.getParameter("sid");
        List<Cart> cartItems = productDao.getCustomerCartItems(customerID, sessionID);
        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/web/checkout.jsp");
        dispatcher.forward(request, response);
    }

    private void viewOrderHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerID = request.getParameter("id");

        try {
            List<Order> orderHistory = orderDao.getCustomerOrders(customerID);
            request.setAttribute("orderHistory", orderHistory);
            request.getRequestDispatcher("pages/web/orders.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void orderItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Retrieve customer Information
        String customerID = request.getParameter("customerID");
        String shippingAddress = request.getParameter("customerPostalAddress");
        String orderStatus = "Shipped";
        String paymentMethod = "Visa Card";

        // Retrieve payment information
        String cardNumber = request.getParameter("cardNumber");
        String cardName = request.getParameter("cardName");
        int expMonth = Integer.parseInt(request.getParameter("expMonth"));
        int expYear = Integer.parseInt(request.getParameter("expYear"));
        int securityCode = Integer.parseInt(request.getParameter("securityCode"));
        Float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));

        // Create order item list
        List<OrderItem> orderItems = new ArrayList<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("productID")){
                String productID = request.getParameter(paramName);
                int quantity = Integer.parseInt(request.getParameter("quantity" + paramName.substring(9))); // 9 is the length of "productID"
                float productPrice = Float.parseFloat(request.getParameter("productPrice" + paramName.substring(9)));
                float totalPrice = Float.parseFloat(request.getParameter("totalPrice" + paramName.substring(9)));

                OrderItem orderItem = new OrderItem();
                orderItem.setProductID(productID);
                orderItem.setQuantity(quantity);
                orderItem.setProductPrice(productPrice);
                orderItem.setTotalPrice(totalPrice);

                orderItems.add(orderItem);
            }
        }

        // Create Order objects
        Order order = new Order();
        order.setCustomerID(customerID);
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);
        order.setOrderStatus(orderStatus);
        order.setCardNumber(cardNumber);
        order.setCardName(cardName);
        order.setCardExpMonth(expMonth);
        order.setCardExpYear(expYear);
        order.setCvc(securityCode);
        order.setTotalAmount(totalAmount);
        order.setOrderItems(orderItems);

        try {
            System.out.println("Number of items in order: " + order.getOrderItems().size());

            int orders = orderDao.createOrder(order);

            if (orders > 0) {
                productDao.deleteCustomerCartItems(customerID);
                request.setAttribute("orderPlaced", true);
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }
            System.out.println(orders);

        } catch (SQLException e){
            e.printStackTrace();
        }

    }

}
