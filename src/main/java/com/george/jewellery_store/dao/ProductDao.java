package com.george.jewellery_store.dao;

import com.george.jewellery_store.model.Cart;
import com.george.jewellery_store.model.Product;
import com.george.jewellery_store.model.Wishlist;
import com.george.jewellery_store.utils.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    //SQl Statements
    private static final String GET_ALL_PRODUCTS_SQL = "SELECT * FROM products";
    private static final String CHECK_WISHLIST_SQL = "SELECT COUNT(*) FROM wishlist WHERE product_id = ? AND customer_id = ?";
    private static final String ADD_TO_WISHLIST_SQL = "INSERT INTO wishlist (product_id, customer_id) VALUES (?, ?)";
    private static final String GET_CUSTOMER_WISHLIST_COUNT_SQL = "SELECT COUNT(*) FROM wishlist WHERE customer_id = ?";
    private static final String GET_CUSTOMER_WISHLIST_ITEMS_SQL = "SELECT p.product_id, p.product_name, p.product_price, p.product_category, p.product_material, p.product_image_path FROM products p INNER JOIN wishlist w ON p.product_id = w.product_id WHERE w.customer_id = ?";
    private static final String DELETE_WISHLIST_SQL = "DELETE FROM wishlist WHERE customer_id = ? AND product_id = ?";
    private static final String GET_PRODUCT_BY_ID = "SELECT * FROM products WHERE product_id = ?";
    private static final String GET_PRODUCTS_BY_MATERIAL_SQL = "SELECT * FROM products WHERE product_material = ?";
    private static final String ADD_TO_CART_SQL = "INSERT INTO cart (product_id, customer_id, session_id, quantity) VALUES (?, ?, ?, ?) ON CONFLICT (product_id, customer_id, session_id) DO UPDATE SET quantity = cart.quantity + EXCLUDED.quantity";
    private static final String UPDATE_CART_SQL = "UPDATE cart SET quantity = ? WHERE (customer_id = ? OR session_id = ?) AND product_id = ?";
    private static final String GET_CUSTOMER_CART_COUNT_SQL = "SELECT COUNT(*) FROM cart WHERE customer_id = ? OR session_id = ?";
    private static final String GET_CUSTOMER_CART_ITEMS_SQL = "SELECT p.product_id, p.product_name, p.product_price, p.product_category, p.product_material, p.product_image_path, c.quantity FROM products p INNER JOIN cart c ON p.product_id = c.product_id WHERE c.customer_id = ? OR c.session_id = ?";
    private static final String DELETE_CART_SQL = "DELETE FROM cart WHERE (customer_id = ? OR session_id = ?) AND product_id = ?";
    private static final String DELETE_CART_BY_CUSTOMER_ID_SQL = "DELETE FROM cart WHERE customer_id = ?";
    private static final String GENERATE_RANDOM_PRODUCTS = "SELECT * FROM products ORDER BY RANDOM() LIMIT 8";

    public List<Product> getAllProducts() throws SQLException {
        List<Product> allProducts = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_PRODUCTS_SQL)){

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String productID = resultSet.getString("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                float productPrice = resultSet.getFloat("product_price");
                String productCategory = resultSet.getString("product_category");
                String productMaterial = resultSet.getString("product_material");
                String productPromo = resultSet.getString("product_promo");
                String productGender = resultSet.getString("product_gender");
                int productImagePath = resultSet.getInt("product_image_path");
                int productImagePath1 = resultSet.getInt("product_image_path_1");
                int productImagePath2 = resultSet.getInt("product_image_path_2");
                String productBrand = resultSet.getString("product_brand");
                String productSize = resultSet.getString("product_size");

                allProducts.add(new Product(productID, productName, productDescription, productPrice, productCategory, productMaterial, productPromo, productGender, productImagePath, productImagePath1, productImagePath2, productBrand, productSize));
            }

        }
        return allProducts;
    }

    public List<Product> getRandomProducts() throws SQLException {
        List<Product> allProducts = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GENERATE_RANDOM_PRODUCTS)){

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String productID = resultSet.getString("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                float productPrice = resultSet.getFloat("product_price");
                String productCategory = resultSet.getString("product_category");
                String productMaterial = resultSet.getString("product_material");
                String productPromo = resultSet.getString("product_promo");
                String productGender = resultSet.getString("product_gender");
                int productImagePath = resultSet.getInt("product_image_path");
                int productImagePath1 = resultSet.getInt("product_image_path_1");
                int productImagePath2 = resultSet.getInt("product_image_path_2");
                String productBrand = resultSet.getString("product_brand");
                String productSize = resultSet.getString("product_size");

                allProducts.add(new Product(productID, productName, productDescription, productPrice, productCategory, productMaterial, productPromo, productGender, productImagePath, productImagePath1, productImagePath2, productBrand, productSize));
            }

        }
        return allProducts;
    }

    public boolean addToWishlist(String productID, String customerID) throws SQLException {
        boolean u = false;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement checkStatement = connection.prepareStatement(CHECK_WISHLIST_SQL);
        PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_WISHLIST_SQL)){
            // Check if the product is already in the wishlist for the given customer
            checkStatement.setString(1, productID);
            checkStatement.setString(2, customerID);

            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            if (count == 0){
                preparedStatement.setString(1, productID);
                preparedStatement.setString(2, customerID);

                u = preparedStatement.executeUpdate() > 0;
            }
        }
        return u;
    }

    public int getCustomerWishlistCount(String customerID) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_WISHLIST_COUNT_SQL)){
            preparedStatement.setString(1, customerID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    public int getCustomerCartCount(String customerID, String sessionID) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_CART_COUNT_SQL)){
            preparedStatement.setString(1, customerID);
            preparedStatement.setString(2, sessionID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    public List<Wishlist> getCustomerWishlistItems(String customerID) throws SQLException {
        List<Wishlist> wishlistItems = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_WISHLIST_ITEMS_SQL)){
            preparedStatement.setString(1, customerID);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String productID = resultSet.getString("product_id");
                String productName = resultSet.getString("product_name");
                String productImagePath = "assets/img/products/" + resultSet.getString("product_material") + "/" + resultSet.getString("product_category") + "/" + resultSet.getString("product_image_path") + ".jpg";
                Float productPrice = resultSet.getFloat("product_price");

                wishlistItems.add(new Wishlist(productID, productName, productImagePath, productPrice));
            }
        }
        return wishlistItems;
    }

    public List<Cart> getCustomerCartItems(String customerID, String sessionID) throws SQLException {
        List<Cart> cartItems = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_CART_ITEMS_SQL)){
            preparedStatement.setString(1, customerID);
            preparedStatement.setString(2, sessionID);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String productID = resultSet.getString("product_id");
                String productName = resultSet.getString("product_name");
                String productImagePath = "assets/img/products/" + resultSet.getString("product_material") + "/" + resultSet.getString("product_category") + "/" + resultSet.getString("product_image_path") + ".jpg";
                Float productPrice = resultSet.getFloat("product_price");
                int quantity = Integer.parseInt(resultSet.getString("quantity"));

                cartItems.add(new Cart(productID, productName, productImagePath, productPrice, quantity));
            }
        }
        return cartItems;
    }

    public boolean deleteCustomerWishlistItem(String customerID, String productID) throws SQLException {
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_WISHLIST_SQL)){
            preparedStatement.setString(1, customerID);
            preparedStatement.setString(2, productID);

            u = preparedStatement.executeUpdate() > 0;
        }

        return u;
    }

    public boolean deleteCustomerCartItem(String customerID, String sessionID, String productID) throws SQLException {
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_SQL)){
            preparedStatement.setString(1, customerID);
            preparedStatement.setString(2, sessionID);
            preparedStatement.setString(3, productID);

            System.out.println(preparedStatement);
            u = preparedStatement.executeUpdate() > 0;
        }
        return u;
    }

    public boolean updateCartItemDetails(String customerID, String sessionID, String productID, int quantity) throws SQLException {
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_SQL)){
            preparedStatement.setString(2, customerID);
            preparedStatement.setString(3, sessionID);
            preparedStatement.setString(4, productID);
            preparedStatement.setInt(1, quantity);

            System.out.println(preparedStatement);

            u = preparedStatement.executeUpdate() > 0;
        }
        return u;
    }

    public Product getProductById(String productID) throws SQLException {
        Product product = null;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_BY_ID)){
            preparedStatement.setString(1, productID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                product = new Product();
                product.setProductID(resultSet.getString("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setProductDescription(resultSet.getString("product_description"));
                product.setProductPrice(resultSet.getFloat("product_price"));
                product.setProductCategory(resultSet.getString("product_category"));
                product.setProductMaterial(resultSet.getString("product_material"));
                product.setProductPromo(resultSet.getString("product_promo"));
                product.setProductGender(resultSet.getString("product_gender"));
                product.setProductImagePath(resultSet.getInt("product_image_path"));
                product.setProductImagePath1(resultSet.getInt("product_image_path_1"));
                product.setProductImagePath2(resultSet.getInt("product_image_path_2"));
                product.setProductBrand(resultSet.getString("product_brand"));
                product.setProductSize(resultSet.getString("product_size"));
            }
        }
        return product;
    }

    public List<Product> getProductByMaterial(String productMat) throws SQLException {
        List<Product> materialProducts = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCTS_BY_MATERIAL_SQL)){
            preparedStatement.setString(1, productMat);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String productID = resultSet.getString("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                float productPrice = resultSet.getFloat("product_price");
                String productCategory = resultSet.getString("product_category");
                String productMaterial = resultSet.getString("product_material");
                String productPromo = resultSet.getString("product_promo");
                String productGender = resultSet.getString("product_gender");
                int productImagePath = resultSet.getInt("product_image_path");
                int productImagePath1 = resultSet.getInt("product_image_path_1");
                int productImagePath2 = resultSet.getInt("product_image_path_2");
                String productBrand = resultSet.getString("product_brand");
                String productSize = resultSet.getString("product_size");

                materialProducts.add(new Product(productID, productName, productDescription, productPrice, productCategory, productMaterial, productPromo, productGender, productImagePath, productImagePath1, productImagePath2, productBrand, productSize));
            }
        }
        return materialProducts;
    }

    public boolean addToCart(String productID, String customerID, String sessionID, int quantity) throws SQLException{
        boolean u;

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_CART_SQL)){

            preparedStatement.setString(1, productID);
            /*preparedStatement.setString(2, customerID);
            preparedStatement.setString(3, sessionID);*/

            if (customerID != null && !customerID.isEmpty()) {
                preparedStatement.setString(2, customerID);
                preparedStatement.setNull(3, Types.VARCHAR);
            } else {
                preparedStatement.setString(2, "Not");
                preparedStatement.setString(3, sessionID);
            }

            preparedStatement.setInt(4, quantity);

            System.out.println(preparedStatement);

            u = preparedStatement.executeUpdate() > 0;
        }
        return u;
    }

    public void deleteCustomerCartItems(String customerID) throws SQLException {

        try (Connection connection = JDBCUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_BY_CUSTOMER_ID_SQL)){
            preparedStatement.setString(1, customerID);

            preparedStatement.executeUpdate();
        }
    }

}
