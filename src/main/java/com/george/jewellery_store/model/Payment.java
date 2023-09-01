package com.george.jewellery_store.model;

import java.time.LocalDate;

public class Payment {

    private String orderID;
    private LocalDate paymentDate;
    private String paymentMethod;
    private Float amount;
    private int cardNumber;
    private String cardName;
    private int cardExpMonth;
    private int cardExpYear;
    private int cvc;

    public Payment() {

    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDate paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
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
