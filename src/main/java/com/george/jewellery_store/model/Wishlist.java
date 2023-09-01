package com.george.jewellery_store.model;

public class Wishlist {

    private String productID;
    private String customerID;
    private String productName;
    private String productImagePath;
    private Float productPrice;

    public Wishlist(){

    }

    public Wishlist(String productID, String productName, String productImagePath, Float productPrice) {
        super();
        this.productID = productID;
        this.productName = productName;
        this.productImagePath = productImagePath;
        this.productPrice = productPrice;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImagePath() {
        return productImagePath;
    }

    public void setProductImagePath(String productImagePath) {
        this.productImagePath = productImagePath;
    }

    public Float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Float productPrice) {
        this.productPrice = productPrice;
    }
}
