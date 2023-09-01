package com.george.jewellery_store.dao;

import com.george.jewellery_store.model.Order;
import com.george.jewellery_store.model.OrderItem;
import com.george.jewellery_store.model.Product;
import com.george.jewellery_store.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    private ProductDao productDao = new ProductDao();

    //SQL Statements
    private static final String ADD_NEW_ORDER_SQL = "INSERT INTO orders (order_id, customer_id, order_status, shipping_address, total_amount) VALUES (?, ?, ?, ?, ?)";
    private static final String ADD_ORDER_ITEMS_SQL = "INSERT INTO order_items (order_id, product_id, quantity, product_price, total_price) VALUES (?, ?, ?, ?, ?)";
    private static final String ADD_PAYMENTS_INFO_SQL = "INSERT INTO payments (order_id, payment_method, amount, card_number, card_name, card_exp_month, card_exp_year, cvc) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_LAST_ORDER_ID_SQL = "SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1";
    private static final String GET_CUSTOMERS_ORDER_SQL = "SELECT o.order_id, o.order_date, o.order_status, o.shipping_address, o.total_amount, oi.product_id, oi.quantity, oi.product_price, oi.total_price FROM orders o INNER JOIN order_items oi ON o.order_id = oi.order_id WHERE o.customer_id = ? ORDER BY o.order_id DESC";


    public String getLastOrderID() throws SQLException {
        String lastOrderID = null;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_LAST_ORDER_ID_SQL)){
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                lastOrderID = resultSet.getString("order_id");
            }
        }
        return lastOrderID;
    }

    public int createOrder(Order order) throws SQLException {

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement orderStatement = connection.prepareStatement(ADD_NEW_ORDER_SQL);
             PreparedStatement orderItemsStatement = connection.prepareStatement(ADD_ORDER_ITEMS_SQL);
             PreparedStatement paymentStatement = connection.prepareStatement(ADD_PAYMENTS_INFO_SQL)){

            String lastOrderID = getLastOrderID();
            String newOrderID;

            if (lastOrderID == null) {
                newOrderID = "ORD0001"; // Default ID if no records exist
            } else {
                int id = Integer.parseInt(lastOrderID.substring(3)) + 1;
                newOrderID = "ORD" + String.format("%04d", id);
            }

            connection.setAutoCommit(false);

            //Insert into order tables
            orderStatement.setString(1, newOrderID);
            orderStatement.setString(2, order.getCustomerID());
            orderStatement.setString(3, order.getOrderStatus());
            orderStatement.setString(4, order.getShippingAddress());
            orderStatement.setFloat(5, order.getTotalAmount());

            System.out.println(orderStatement);

            int resultSet = orderStatement.executeUpdate();
            if (resultSet > 0) {
                //Insert order items
                for (OrderItem item: order.getOrderItems()) {
                    orderItemsStatement.setString(1, newOrderID);
                    orderItemsStatement.setString(2, item.getProductID());
                    orderItemsStatement.setInt(3, item.getQuantity());
                    orderItemsStatement.setFloat(4, item.getProductPrice());
                    orderItemsStatement.setFloat(5, item.getTotalPrice());
                    System.out.println(orderItemsStatement);
                    orderItemsStatement.addBatch();
                }

                System.out.println(orderItemsStatement);

                orderItemsStatement.executeBatch();

                paymentStatement.setString(1, newOrderID);
                paymentStatement.setString(2, order.getPaymentMethod());
                paymentStatement.setFloat(3, order.getTotalAmount());
                paymentStatement.setInt(4, order.getCardNumber());
                paymentStatement.setString(5, order.getCardName());
                paymentStatement.setInt(6, order.getCardExpMonth());
                paymentStatement.setInt(7, order.getCardExpYear());
                paymentStatement.setInt(8, order.getCvc());

                System.out.println(paymentStatement);

                paymentStatement.executeUpdate();

                connection.commit();
                return resultSet;
            } else {
                connection.rollback();
                throw new SQLException("Failed to insert order");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<Order> getCustomerOrders(String customerID) throws SQLException {
        List<Order> orderHistory = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMERS_ORDER_SQL)){
            preparedStatement.setString(1, customerID);

            ResultSet resultSet = preparedStatement.executeQuery();

            String currentOderID = null;
            Order currentOrder = null;

            while (resultSet.next()) {
                String orderID = resultSet.getString("order_id");
                if (!orderID.equals(currentOderID)) {
                    if (currentOrder != null) {
                        orderHistory.add(currentOrder);
                    }

                    currentOderID = orderID;
                    currentOrder = new Order();

                    currentOrder.setOrderID(orderID);
                    currentOrder.setOrderDate(resultSet.getDate("order_date").toLocalDate());
                    currentOrder.setOrderStatus(resultSet.getString("order_status"));
                    currentOrder.setShippingAddress(resultSet.getString("shipping_address"));
                    currentOrder.setTotalAmount(resultSet.getFloat("total_amount"));
                    currentOrder.setOrderItems(new ArrayList<>());
                }

                if (currentOrder != null) {
                    OrderItem orderItem = new OrderItem();
                    orderItem.setProductID(resultSet.getString("product_id"));
                    orderItem.setQuantity(resultSet.getInt("quantity"));
                    orderItem.setProductPrice(resultSet.getFloat("product_price"));
                    orderItem.setTotalPrice(resultSet.getFloat("total_price"));

                    // Get product details from products
                    Product product = productDao.getProductById(orderItem.getProductID());
                    if (product != null) {
                        orderItem.setProductName(product.getProductName());
                        orderItem.setProductMaterial(product.getProductMaterial());
                        orderItem.setProductCategory(product.getProductCategory());
                        orderItem.setProductImagePath(product.getProductImagePath());
                    }

                    currentOrder.getOrderItems().add(orderItem);
                }
            }

            if (currentOrder != null) {
                orderHistory.add(currentOrder);
            }
        }
        return orderHistory;
    }
}
