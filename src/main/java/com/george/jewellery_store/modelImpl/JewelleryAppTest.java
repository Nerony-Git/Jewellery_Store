package com.george.jewellery_store.modelImpl;

import com.george.jewellery_store.Jewellery;
import com.github.javafaker.Faker;
import org.graphwalker.core.machine.ExecutionContext;
import org.graphwalker.java.annotation.*;
import org.hamcrest.CoreMatchers;
import org.junit.rules.ErrorCollector;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.List;
import java.util.Random;

@GraphWalker(value = "random(edge_coverage(100))", start = "e_init")
public class JewelleryAppTest extends ExecutionContext implements Jewellery {

    static WebDriver driver = null;
    static WebDriverWait waiter = null;
    static ErrorCollector collector = new ErrorCollector();
    static Faker faker = new Faker();
    static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void e_CheckoutFailed() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardNumber")));
        WebElement cardNumber = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardNumber")));
        WebElement cardName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardName")));
        WebElement expiryMonth = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("expMonth")));
        WebElement expiryYear = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("expYear")));
        WebElement buyNowButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));

        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", cardNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cardNumber, faker.finance().creditCard());
        executor.executeScript("arguments[0].value = '';", cardName);
        executor.executeScript("arguments[0].value = arguments[1];", cardName, faker.name().fullName());
        executor.executeScript("arguments[0].value = '';", expiryMonth);
        executor.executeScript("arguments[0].value = arguments[1];", expiryMonth, faker.number().numberBetween(1, 12));
        executor.executeScript("arguments[0].value = '';", expiryYear);
        executor.executeScript("arguments[0].value = arguments[1];", expiryYear, String.format("%02d", faker.number().numberBetween(0, 99)));
        executor.executeScript("arguments[0].click();", buyNowButton);
    }

    @Override
    public void v_Shop() {
        waiter.until(ExpectedConditions.titleContains("Shop"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Shop"));
    }

    @Override
    public void e_AboutUs() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("About")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("About"))).click();
    }

    @Override
    public void e_Wishlist() {
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-show-wishlist")));
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-show-wishlist"))).click();
    }

    @Override
    public void e_ResgisterSuccess() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Register Account')]")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("firstName")));
        WebElement firstName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("firstName")));
        WebElement lastName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("lastName")));
        WebElement otherName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("otherName")));
        WebElement dob = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("dob")));
        WebElement gender = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("gender")));
        WebElement address = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("address")));
        WebElement postalAddress = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));
        WebElement contact = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("contact")));
        WebElement email = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("email")));
        WebElement registerButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));

        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", firstName);
        executor.executeScript("arguments[0].value = arguments[1];", firstName, faker.name().firstName());
        executor.executeScript("arguments[0].value = '';", lastName);
        executor.executeScript("arguments[0].value = arguments[1];", lastName, faker.name().lastName());
        executor.executeScript("arguments[0].value = '';", otherName);
        executor.executeScript("arguments[0].value = arguments[1];", otherName, faker.name().username());
        WebElement username = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("username")));
        executor.executeScript("arguments[0].value = '';", username);
        executor.executeScript("arguments[0].value = arguments[1];", username, faker.name().username());
        executor.executeScript("arguments[0].value = '';", dob);
        executor.executeScript("arguments[0].value = arguments[1];", dob, dateFormat.format(faker.date().birthday()));
        executor.executeScript("arguments[0].value = '';", gender);
        executor.executeScript("arguments[0].value = arguments[1];", gender, faker.options().option("M", "F"));
        executor.executeScript("arguments[0].value = '';", address);
        executor.executeScript("arguments[0].value = arguments[1];", address, faker.address().fullAddress());
        executor.executeScript("arguments[0].value = '';", postalAddress);
        executor.executeScript("arguments[0].value = arguments[1];", postalAddress, faker.address().zipCode());
        executor.executeScript("arguments[0].value = '';", contact);
        executor.executeScript("arguments[0].value = arguments[1];", contact, faker.number().digits(11));
        executor.executeScript("arguments[0].value = '';", email);
        executor.executeScript("arguments[0].value = arguments[1];", email, faker.internet().emailAddress());
        executor.executeScript("arguments[0].click();", registerButton);

    }

    @Override
    public void e_Logout() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Logout")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Logout"))).click();
    }

    @Override
    public void e_ContactUs() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Contact")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Contact"))).click();
    }

    @Override
    public void e_Shop() {
        waiter.until(ExpectedConditions.elementToBeClickable(By.linkText("Shop")));
        waiter.until(ExpectedConditions.elementToBeClickable(By.linkText("Shop"))).click();
    }

    @Override
    public void v_AddToCart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-overlay")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-overlay"))).getAttribute("class");
        collector.checkThat(message.contains("swal-overlay--show-modal"), CoreMatchers.equalTo(true));
    }

    @Override
    public void v_Orders() {
        waiter.until(ExpectedConditions.titleContains("Your Orders"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Your Orders"));
    }

    @Override
    public void e_ViewEditAccountSuccess() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));
        WebElement postalAddress = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("contact")));
        WebElement contact = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("contact")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        WebElement updateButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", postalAddress);
        executor.executeScript("arguments[0].value = arguments[1];", postalAddress, faker.address().zipCode());
        executor.executeScript("arguments[0].value = '';", contact);
        executor.executeScript("arguments[0].value = arguments[1];", contact, faker.number().digits(11));
        executor.executeScript("arguments[0].click();", updateButton);
    }

    @Override
    public void e_AddToCart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".btn-num-product-up")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".btn-num-product-up"))).click();
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".btn-num-product-up"))).click();
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-addcart-detail")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-addcart-detail"))).click();
    }

    @Override
    public void v_ProductDetails() {
        waiter.until(ExpectedConditions.titleContains("Product Detail"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Product Detail"));
    }

    @Override
    public void e_Wishlist_Account() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Wishlist")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Wishlist"))).click();
    }

    @Override
    public void e_ProductDetails() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a.js-name-b2")));
        List<WebElement> productLinks = driver.findElements(By.cssSelector("a.js-name-b2"));
        Random random = new Random();
        int randomIndex = random.nextInt(productLinks.size());
        WebElement randomProductLink = productLinks.get(randomIndex);
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(false);", randomProductLink);
        randomProductLink.click();
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Product Detail"));
    }

    @Override
    public void e_Orders() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Order")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Order"))).click();
    }

    @Override
    public void e_ViewCart_Account() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("View Cart")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("View Cart"))).click();
    }

    @Override
    public void v_Homepage() {
        waiter.until(ExpectedConditions.titleContains("KC - Jewellery Store"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("KC - Jewellery Store"));
    }

    @Override
    public void e_LoginFailed() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("username")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("username"))).sendKeys(faker.name().username());
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("password")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("password"))).sendKeys(faker.internet().password());
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']"))).click();
    }

    @Override
    public void e_AddToWishlist() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a.js-addwish-b2")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a.js-addwish-b2"))).click();
    }

    @Override
    public void e_Account() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-account")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-account"))).click();
    }

    @Override
    public void v_ContactUs() {
        waiter.until(ExpectedConditions.titleContains("Contact Us"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Contact Us"));
    }

    @Override
    public void v_ViewEditAccount() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'View / Edit Account')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Login')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("VIEW / EDIT ACCOUNT"));
    }

    @Override
    public void e_BackToProductDetails() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-button")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-button"))).click();
    }

    @Override
    public void e_ViewEditAccountFailed() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));
        WebElement postalAddress = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("contact")));
        WebElement contact = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("contact")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        WebElement updateButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", postalAddress);
        executor.executeScript("arguments[0].value = '';", contact);
        executor.executeScript("arguments[0].value = arguments[1];", contact, faker.number().digits(11));
        executor.executeScript("arguments[0].click();", updateButton);
    }

    @Override
    public void e_ProceedCheckout() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("PROCEED TO CHECKOUT")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("PROCEED TO CHECKOUT"))).click();
    }

    @Override
    public void e_WishlistExit() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-wishlist")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-wishlist"))).click();
        waiter.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".s-full.js-hide-wishlist")));
    }

    @Override
    public void v_AccountViewCart() {
        waiter.until(ExpectedConditions.titleContains("View Cart"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("View Cart"));
    }

    @Override
    public void e_AccountCart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-account")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-account"))).click();
        waiter.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".s-full.js-hide-account")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-cart")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-cart"))).click();
    }

    @Override
    public void v_AccountCart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Cart')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Cart')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("YOUR CART"));
    }

    @Override
    public void v_AccountWishlist() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Wishlist')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Wishlist')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("YOUR WISHLIST"));
    }

    @Override
    public void v_Checkout() {
        waiter.until(ExpectedConditions.titleContains("Checkout"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("Checkout"));
    }

    @Override
    public void e_Login() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-account")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-account"))).click();
    }

    @Override
    public void v_Resgister() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Register Account')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Register Account')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("REGISTER ACCOUNT"));
    }

    @Override
    public void e_Resgister() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-register")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-show-register"))).click();
    }

    @Override
    public void v_AboutUs() {
        waiter.until(ExpectedConditions.titleContains("About Us"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("About Us"));
    }

    @Override
    public void e_Description() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Description")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Description"))).click();
    }

    @Override
    public void e_LoginSuccess() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("username")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("username"))).sendKeys("test");
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("password")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("password"))).sendKeys("12345");
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']"))).click();
    }

    @Override
    public void v_Info() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Additional information")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Additional information"))).getAttribute("class");
        collector.checkThat(message.contains("active"), CoreMatchers.equalTo(true));
    }

    @Override
    public void v_Reviews() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Reviews (1)")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Reviews (1)"))).getAttribute("class");
        collector.checkThat(message.contains("active"), CoreMatchers.equalTo(true));
    }

    @Override
    public void v_Wishlist() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Wishlist')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Wishlist')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("YOUR WISHLIST"));
    }

    @Override
    public void e_Checkout() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("PROCEED TO CHECKOUT")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("PROCEED TO CHECKOUT"))).click();
    }

    @Override
    public void e_ResgisterFailed() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Register Account')]")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("firstName")));
        WebElement firstName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("firstName")));
        WebElement lastName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("lastName")));
        WebElement otherName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("otherName")));
        WebElement dob = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("dob")));
        WebElement gender = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("gender")));
        WebElement address = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("address")));
        WebElement postalAddress = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("postalAddress")));

        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", firstName);
        executor.executeScript("arguments[0].value = arguments[1];", firstName, faker.name().firstName());
        executor.executeScript("arguments[0].value = '';", lastName);
        executor.executeScript("arguments[0].value = arguments[1];", lastName, faker.name().lastName());
        executor.executeScript("arguments[0].value = '';", otherName);
        executor.executeScript("arguments[0].value = arguments[1];", otherName, faker.name().username());
        executor.executeScript("arguments[0].value = '';", dob);
        executor.executeScript("arguments[0].value = arguments[1];", dob, dateFormat.format(faker.date().birthday()));
        executor.executeScript("arguments[0].value = '';", gender);
        executor.executeScript("arguments[0].value = arguments[1];", gender, faker.options().option("M", "F"));
        executor.executeScript("arguments[0].value = '';", address);
        executor.executeScript("arguments[0].value = arguments[1];", address, faker.address().fullAddress());
        executor.executeScript("arguments[0].value = '';", postalAddress);
        executor.executeScript("arguments[0].value = arguments[1];", postalAddress, faker.address().zipCode());
        WebElement email = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("email")));
        executor.executeScript("arguments[0].value = '';", email);
        executor.executeScript("arguments[0].value = arguments[1];", email, faker.internet().emailAddress());
        WebElement registerButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        executor.executeScript("arguments[0].click();", registerButton);
    }

    @Override
    public void v_Login() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Login')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Login')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("LOGIN"));
    }

    @Override
    public void v_Cart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Cart')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'Your Cart')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("YOUR CART"));
    }

    @Override
    public void e_Info() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Additional information")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Additional information"))).click();
    }

    @Override
    public void e_CheckoutSuccess() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardNumber")));
        WebElement cardNumber = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardNumber")));
        WebElement cardName = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("cardName")));
        WebElement expiryMonth = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("expMonth")));
        WebElement expiryYear = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("expYear")));
        WebElement cvcNumber = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.name("securityCode")));

        JavascriptExecutor executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].value = '';", cardNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cardNumber, faker.finance().creditCard());
        executor.executeScript("arguments[0].value = '';", cardName);
        executor.executeScript("arguments[0].value = arguments[1];", cardName, faker.name().fullName());
        executor.executeScript("arguments[0].value = '';", expiryMonth);
        executor.executeScript("arguments[0].value = arguments[1];", expiryMonth, faker.number().numberBetween(1, 12));
        executor.executeScript("arguments[0].value = '';", expiryYear);
        executor.executeScript("arguments[0].value = arguments[1];", expiryYear, String.format("%02d", faker.number().numberBetween(0, 99)));
        executor.executeScript("arguments[0].value = '';", cvcNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cvcNumber, faker.number().numberBetween(100, 999));
        WebElement buyNowButton = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@type='submit']")));
        executor.executeScript("arguments[0].click();", buyNowButton);
    }

    @Override
    public void v_Account() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'My Account')]")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[contains(text(), 'My Account')]"))).getText();
        collector.checkThat(message, CoreMatchers.equalTo("MY ACCOUNT"));
    }

    @Override
    public void v_Description() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Description")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Description"))).getAttribute("class");
        collector.checkThat(message.contains("active"), CoreMatchers.equalTo(true));
    }

    @Override
    public void e_Homepage() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Home")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Home"))).click();
    }

    @Override
    public void e_ViewCart() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("VIEW CART")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("VIEW CART"))).click();
    }

    @Override
    public void v_AddToWishlist() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-overlay")));
        String message = waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".swal-overlay"))).getAttribute("class");
        collector.checkThat(message.contains("swal-overlay--show-modal"), CoreMatchers.equalTo(true));
    }

    @Override
    public void e_Exit() {
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-hide-account")));
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-hide-account"))).click();
        waiter.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".s-full.js-hide-account")));
    }

    @Override
    public void e_Cart() {
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-show-cart")));
        waiter.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".js-show-cart"))).click();
    }

    @Override
    public void e_init() {
        if (driver == null) {
            driver = new FirefoxDriver();
        }

        waiter = new WebDriverWait(driver, Duration.ofSeconds(20));

        driver.get("http://localhost:8080/");
    }

    @Override
    public void e_Reviews() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Reviews (1)")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Reviews (1)"))).click();
    }

    @Override
    public void v_ViewCart() {
        waiter.until(ExpectedConditions.titleContains("View Cart"));
        String message = driver.getTitle();
        collector.checkThat(message, CoreMatchers.equalTo("View Cart"));
    }

    @Override
    public void e_ViewEditAccount() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Account")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("My Account"))).click();
    }

    @Override
    public void e_RegisterExit() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-register")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-register"))).click();
        waiter.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".s-full.js-hide-register")));
    }

    @Override
    public void e_CartExit() {
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-cart")));
        waiter.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".js-hide-cart"))).click();
        waiter.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".s-full.js-hide-cart")));
    }

    public void threads() throws InterruptedException {
        Thread.sleep(1000);
    }

    @BeforeExecution
    public void setup() {
        System.out.println("Executing Jewellery Store GraphWalker Test cases.");
        if (driver == null) {
            driver = new FirefoxDriver();
        }
    }

    @AfterExecution
    public void cleanup() {
        System.out.println("Execution of Jewellery Store GraphWalker Test cases completed.");
        if (driver != null) {
            driver.quit();
            driver = null;
        }
    }

    @BeforeElement
    public void printBeforeElement() {
        System.out.println("Executing " + getCurrentElement().getName() + " Test case.");
    }

    @AfterElement
    public void printAfterElement() {
        System.out.println(getCurrentElement().getName() + " Test case passed.");
    }
}
