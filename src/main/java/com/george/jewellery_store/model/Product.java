package com.george.jewellery_store.model;

public class Product {

    private String productID;
    private String productName;
    private String productDescription;
    private float productPrice;
    private String productCategory;
    private String productMaterial;
    private String productPromo;
    private String productGender;
    private int productImagePath;
    private int productImagePath1;
    private int productImagePath2;
    private String productBrand;
    private String productSize;

    public Product(){

    }

    public Product(String productID, String productName, String productDescription, float productPrice, String productCategory, String productMaterial, String productPromo, String productGender, int productImagePath, int productImagePath1, int productImagePath2, String productBrand, String productSize) {
        super();
        this.productID = productID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.productMaterial = productMaterial;
        this.productPromo = productPromo;
        this.productGender = productGender;
        this.productImagePath = productImagePath;
        this.productImagePath1 = productImagePath1;
        this.productImagePath2 = productImagePath2;
        this.productBrand = productBrand;
        this.productSize = productSize;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductMaterial() {
        return productMaterial;
    }

    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }

    public String getProductPromo() {
        return productPromo;
    }

    public void setProductPromo(String productPromo) {
        this.productPromo = productPromo;
    }

    public String getProductGender() {
        return productGender;
    }

    public void setProductGender(String productGender) {
        this.productGender = productGender;
    }

    public int getProductImagePath1() {
        return productImagePath1;
    }

    public void setProductImagePath1(int productImagePath1) {
        this.productImagePath1 = productImagePath1;
    }

    public int getProductImagePath2() {
        return productImagePath2;
    }

    public void setProductImagePath2(int productImagePath2) {
        this.productImagePath2 = productImagePath2;
    }

    public int getProductImagePath() {
        return productImagePath;
    }

    public void setProductImagePath(int productImagePath) {
        this.productImagePath = productImagePath;
    }

    public String getProductBrand() {
        return productBrand;
    }

    public void setProductBrand(String productBrand) {
        this.productBrand = productBrand;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }
}
