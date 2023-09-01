package com.george.jewellery_store.dao;

import com.george.jewellery_store.model.Customer;
import com.george.jewellery_store.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDao {

    private ProductDao productDao = new ProductDao();

    //SQL Statements
    private static final String ADD_NEW_CUSTOMER_SQL = "INSERT INTO customers (customer_id, first_name, last_name, other_name, username, gender, dob, contact, email, address, postal_address, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_LAST_CUSTOMER_ID_SQL = "SELECT customer_id FROM customers ORDER BY customer_id DESC LIMIT 1";
    private static final String CUSTOMER_LOGIN_SQL = "SELECT * FROM customers WHERE username = ? AND password =?";
    private static final String UPDATE_CUSTOMER_PROFILE_SQL = "UPDATE customers SET first_name = ?, last_name = ?, other_name = ?, gender = ?, dob = ?, contact = ?, email = ?, address = ?, postal_address = ? WHERE customer_id = ?";
    private static final String GET_CUSTOMER_BY_ID_SQL = "SELECT * FROM customers WHERE customer_id = ?";


    public String getLastCustomerID() throws SQLException {
        String lastCustomerID = null;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_LAST_CUSTOMER_ID_SQL)){
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                lastCustomerID = resultSet.getString("customer_id");
            }
        }
        return lastCustomerID;
    }

    public boolean registerCustomer(Customer customer) throws SQLException {
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_CUSTOMER_SQL)){
            String lastCustomerID = getLastCustomerID();
            String newCustomerID;

            if (lastCustomerID == null) {
                newCustomerID = "CUS0001"; // Default ID if no records exist
            } else {
                int id = Integer.parseInt(lastCustomerID.substring(3)) + 1;
                newCustomerID = "CUS" + String.format("%04d", id);
            }

            preparedStatement.setString(1, newCustomerID);
            preparedStatement.setString(2, customer.getFirstName());
            preparedStatement.setString(3, customer.getLastName());
            preparedStatement.setString(4, customer.getOtherName());
            preparedStatement.setString(5, customer.getUsername());
            preparedStatement.setString(6, customer.getGender());
            preparedStatement.setDate(7, JDBCUtils.getSQLDate(customer.getDob()));
            preparedStatement.setString(8, customer.getContact());
            preparedStatement.setString(9, customer.getEmail());
            preparedStatement.setString(10, customer.getAddress());
            preparedStatement.setString(11, customer.getPostalAddress());
            preparedStatement.setString(12, customer.getPassword());

            u = preparedStatement.executeUpdate() > 0;

        }
        return u;
    }

    public Customer validateCustomer(String username, String password) throws SQLException {
        Customer customer = null;
        String customerID = "";
        String sessionID = "";
        int wishlistCount = 0;
        int cartCount = 0;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(CUSTOMER_LOGIN_SQL)){
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerID(resultSet.getString("customer_id"));
                customer.setFirstName(resultSet.getString("first_name"));
                customer.setLastName(resultSet.getString("last_name"));
                customer.setOtherName(resultSet.getString("other_name"));
                customer.setUsername(resultSet.getString("username"));
                customer.setGender(resultSet.getString("gender"));
                customer.setDob(resultSet.getDate("dob").toLocalDate());
                customer.setContact(resultSet.getString("contact"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("address"));
                customer.setPostalAddress(resultSet.getString("postal_address"));
                customer.setWishlistCount(wishlistCount);
                customer.setCartCount(cartCount);

                customerID = resultSet.getString("customer_id");
                wishlistCount = productDao.getCustomerWishlistCount(customerID);
                cartCount = productDao.getCustomerCartCount(customerID, sessionID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }

    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_PROFILE_SQL)){

            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getOtherName());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setDate(5, JDBCUtils.getSQLDate(customer.getDob()));
            preparedStatement.setString(6, customer.getContact());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setString(9, customer.getPostalAddress());
            preparedStatement.setString(10, customer.getCustomerID());

            System.out.println(preparedStatement);

            u = preparedStatement.executeUpdate() > 0;
        }
        return u;
    }

    public Customer getCustomerByID(String customerID) throws SQLException {
        Customer customer = null;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_BY_ID_SQL)){
            preparedStatement.setString(1, customerID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerID(resultSet.getString("customer_id"));
                customer.setFirstName(resultSet.getString("first_name"));
                customer.setLastName(resultSet.getString("last_name"));
                customer.setOtherName(resultSet.getString("other_name"));
                customer.setUsername(resultSet.getString("username"));
                customer.setGender(resultSet.getString("gender"));
                customer.setDob(resultSet.getDate("dob").toLocalDate());
                customer.setContact(resultSet.getString("contact"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("address"));
                customer.setPostalAddress(resultSet.getString("postal_address"));
            }
        }
        return customer;
    }
}
