package com.george.jewellery_store.model;

import java.time.LocalDate;
import java.util.List;

public class Order {

    private String orderID;
    private String customerID;
    private LocalDate orderDate;
    private String orderStatus;
    private String shippingAddress;
    private Float totalAmount;
    private List<OrderItem> orderItems;
    private String paymentMethod;

    private int cardNumber;
    private String cardName;
    private int cardExpMonth;
    private int cardExpYear;
    private int cvc;

    public Order() {

    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public int getCardExpMonth() {
        return cardExpMonth;
    }

    public void setCardExpMonth(int cardExpMonth) {
        this.cardExpMonth = cardExpMonth;
    }

    public int getCardExpYear() {
        return cardExpYear;
    }

    public void setCardExpYear(int cardExpYear) {
        this.cardExpYear = cardExpYear;
    }

    public int getCvc() {
        return cvc;
    }

    public void setCvc(int cvc) {
        this.cvc = cvc;
    }
}
