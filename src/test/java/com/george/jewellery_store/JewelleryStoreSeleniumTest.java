package com.george.jewellery_store;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;

import java.time.Duration;
import java.util.List;
import java.util.Random;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class JewelleryStoreSeleniumTest {

    private WebDriver driver;

    @BeforeAll
    public static void setupDriver() {
        WebDriverManager.firefoxdriver().setup();
    }

    @BeforeEach
    void setUp() {
        driver = new FirefoxDriver();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
    }

    @AfterEach
    void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

    @Test
    public void jewelleryStoreGuestTest() throws InterruptedException {

        driver.navigate().to("http://localhost:8080/");

        // Click on each navigation link and verify the page title
        // 1) Test Home page
        clickAndVerifyLink("Home", "KC - Jewellery Store");

        // 2) Test Shop page
        clickAndVerifyLink("Shop", "Shop");

        // 3) Test About Us page
        clickAndVerifyLink("About", "About Us");

        // 4) Test Contact Us page
        clickAndVerifyLink("Contact", "Contact Us");

        // 5) Test Cart modal
        driver.findElement(By.cssSelector(".js-show-cart")).click();
        String message = driver.findElement(By.xpath("//span[contains(text(), 'Your Cart')]")).getText();
        Thread.sleep(500);
        assertEquals("YOUR CART", message);

        // 6) Test Hide Cart modal
        driver.findElement(By.cssSelector(".js-hide-cart")).click();
        String classAttribute = driver.findElement(By.cssSelector(".js-show-cart")).getAttribute("class");
        Thread.sleep(500);
        assertEquals(false, classAttribute.contains("show-header-cart"));

        // 7) Test Wishlist modal
        driver.findElement(By.cssSelector(".js-show-wishlist")).click();
        Thread.sleep(500);
        String message1 = driver.findElement(By.xpath("//span[contains(text(), 'Your Wishlist')]")).getText();
        assertEquals("YOUR WISHLIST", message1);

        // 8) Test Hide Wishlist modal
        driver.findElement(By.cssSelector(".js-hide-wishlist")).click();
        Thread.sleep(500);
        String classAttribute1 = driver.findElement(By.cssSelector(".js-show-wishlist")).getAttribute("class");
        assertEquals(false, classAttribute1.contains("show-header-wishlist"));

        // 9) Test Login modal
        driver.findElement(By.cssSelector(".js-show-account")).click();
        Thread.sleep(500);
        String message2 = driver.findElement(By.xpath("//span[contains(text(), 'Login')]")).getText();
        assertEquals("LOGIN", message2);

        // 10) Test Hide Login modal
        driver.findElement(By.cssSelector(".js-hide-account")).click();
        Thread.sleep(500);
        String classAttribute2 = driver.findElement(By.cssSelector(".js-show-account")).getAttribute("class");
        assertEquals(false, classAttribute2.contains("show-header-account"));

        // 11) Test Register modal
        driver.findElement(By.cssSelector(".js-show-account")).click();
        driver.findElement(By.cssSelector(".js-show-register")).click();
        String message3 = driver.findElement(By.xpath("//span[contains(text(), 'Register Account')]")).getText();
        assertEquals("REGISTER ACCOUNT", message3);

        // 12) Test Hide Register modal
        driver.findElement(By.cssSelector(".js-hide-register")).click();
        Thread.sleep(500);
        String classAttribute3 = driver.findElement(By.cssSelector(".js-show-account")).getAttribute("class");
        assertEquals(false, classAttribute3.contains("show-header-account"));
        Thread.sleep(1000);

        // 13) Test Product Details page
        List<WebElement> productLinks = driver.findElements(By.cssSelector("a.js-name-b2"));
        Random random = new Random();
        int randomIndex = random.nextInt(productLinks.size());
        Thread.sleep(1000);
        WebElement randomProductLink = productLinks.get(randomIndex);
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(false);", randomProductLink);
        Thread.sleep(1000);
        randomProductLink.click();

        String message4 = driver.getTitle();
        assertEquals("Product Detail", message4);

        // 14) Test Add to Wishlist Fail
        driver.findElement(By.cssSelector(".js-addwish-details")).click();
        Thread.sleep(500);
        String message5 = driver.findElement(By.xpath("//span[contains(text(), 'Login')]")).getText();
        assertEquals("LOGIN", message5);
        driver.findElement(By.cssSelector(".js-hide-account")).click();
        Thread.sleep(1000);

        // 15) Test Review Section
        driver.findElement(By.linkText("Reviews (1)")).click();
        Thread.sleep(500);
        String classAttribute4 = driver.findElement(By.linkText("Reviews (1)")).getAttribute("class");
        assertEquals(true, classAttribute4.contains("active"));

        // 16) Test Additional information Section
        driver.findElement(By.linkText("Additional information")).click();
        Thread.sleep(500);
        String classAttribute5 = driver.findElement(By.linkText("Additional information")).getAttribute("class");
        assertEquals(true, classAttribute5.contains("active"));

        // 17) Test Product Description Section
        driver.findElement(By.linkText("Description")).click();
        String classAttribute6 = driver.findElement(By.linkText("Description")).getAttribute("class");
        assertEquals(true, classAttribute6.contains("active"));
        Thread.sleep(500);

        // 18) Test Add to Cart
        driver.findElement(By.cssSelector(".btn-num-product-up")).click();
        driver.findElement(By.cssSelector(".btn-num-product-up")).click();
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".js-addcart-detail")).click();
        String classAttribute7 = driver.findElement(By.cssSelector(".swal-overlay")).getAttribute("class");
        assertEquals(true, classAttribute7.contains("swal-overlay--show-modal"));

        // 19) Test Remove Add to Cart modal
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".swal-button")).click();
        Thread.sleep(500);
        String classAttribute8 = driver.findElement(By.cssSelector(".swal-overlay")).getAttribute("class");
        assertEquals(false, classAttribute8.contains("swal-overlay--show-modal"));

        // 20) Test View Cart
        driver.findElement(By.cssSelector(".js-show-cart")).click();
        driver.findElement(By.linkText("VIEW CART")).click();
        String message6 = driver.getTitle();
        assertEquals("View Cart", message6);

        // 21) Test Checkout Failed
        driver.findElement(By.linkText("PROCEED TO CHECKOUT")).click();
        Thread.sleep(500);
        String message7 = driver.findElement(By.xpath("//span[contains(text(), 'Login')]")).getText();
        assertEquals("LOGIN", message7);
        driver.findElement(By.cssSelector(".js-show-register")).click();

        // 22) Test Register Account Failed
        driver.findElement(By.name("firstName")).clear();
        driver.findElement(By.name("firstName")).sendKeys("John");
        driver.findElement(By.name("lastName")).clear();
        driver.findElement(By.name("lastName")).sendKeys("Doe");
        driver.findElement(By.name("dob")).clear();
        driver.findElement(By.name("dob")).sendKeys("20/08/1945");
        driver.findElement(By.name("gender")).sendKeys("M");
        driver.findElement(By.name("postalAddress")).clear();
        driver.findElement(By.name("postalAddress")).sendKeys("DG380HY");
        driver.findElement(By.name("contact")).clear();
        driver.findElement(By.name("contact")).sendKeys("01234567894");
        WebElement password = driver.findElement(By.name("password"));
        JavascriptExecutor executor = (JavascriptExecutor)driver;
        executor.executeScript("arguments[0].value = '';", password);
        executor.executeScript("arguments[0].value = arguments[1];", password, "123456");
        /*driver.findElement(By.name("password")).clear();
        driver.findElement(By.name("password")).sendKeys("123456");*/
        Thread.sleep(500);
        executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
        /*driver.findElement(By.xpath("//button[@type='submit']")).click();*/
        Thread.sleep(500);
        String message8 = driver.findElement(By.xpath("//span[contains(text(), 'Register Account')]")).getText();
        assertEquals("REGISTER ACCOUNT", message8);

        // 23) Test Register Account Success
        driver.findElement(By.name("firstName")).clear();
        driver.findElement(By.name("firstName")).sendKeys("John");
        driver.findElement(By.name("lastName")).clear();
        driver.findElement(By.name("lastName")).sendKeys("Doe");
        executor.executeScript("arguments[0].value = '';", driver.findElement(By.name("username")));
        executor.executeScript("arguments[0].value = arguments[1];", driver.findElement(By.name("username")), "john");
        driver.findElement(By.name("dob")).clear();
        driver.findElement(By.name("dob")).sendKeys("20/08/1945");
        driver.findElement(By.name("gender")).sendKeys("M");
        driver.findElement(By.name("address")).clear();
        driver.findElement(By.name("address")).sendKeys("Hatfield Groove");
        driver.findElement(By.name("postalAddress")).clear();
        driver.findElement(By.name("postalAddress")).sendKeys("DG380HY");
        driver.findElement(By.name("contact")).clear();
        driver.findElement(By.name("contact")).sendKeys("01234567894");
        driver.findElement(By.name("email")).clear();
        driver.findElement(By.name("email")).sendKeys("johndoe@gmail.com");
        executor.executeScript("arguments[0].value = '';", driver.findElement(By.name("password")));
        executor.executeScript("arguments[0].value = arguments[1];", driver.findElement(By.name("password")), "123456");
        Thread.sleep(500);
        executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
        Thread.sleep(1000);
        String message9 = driver.findElement(By.xpath("//span[contains(text(), 'Login')]")).getText();
        assertEquals("LOGIN", message9);

    }

    @Test
    public void jewelleryStoreUserTest() throws InterruptedException {
        driver.navigate().to("http://localhost:8080/");

        // 24) Test Login Failed
        driver.findElement(By.cssSelector(".js-show-account")).click();
        Thread.sleep(500);
        driver.findElement(By.name("username")).clear();
        driver.findElement(By.name("username")).sendKeys("john doe");
        driver.findElement(By.name("password")).clear();
        driver.findElement(By.name("password")).sendKeys("1234567");
        driver.findElement(By.xpath("//button[@type='submit']")).click();
        Thread.sleep(1000);
        String message = driver.findElement(By.xpath("//span[contains(text(), 'Login')]")).getText();
        assertEquals("LOGIN", message);

        // 25) Test Login Success
        Thread.sleep(500);
        driver.findElement(By.name("username")).clear();
        driver.findElement(By.name("username")).sendKeys("test");
        driver.findElement(By.name("password")).clear();
        driver.findElement(By.name("password")).sendKeys("12345");
        driver.findElement(By.xpath("//button[@type='submit']")).click();
        Thread.sleep(1000);
        String message2 = driver.findElement(By.xpath("//span[contains(text(), 'My Account')]")).getText();
        assertEquals("MY ACCOUNT", message2);
        Thread.sleep(1000);
        driver.findElement(By.cssSelector(".js-hide-account")).click();

        // 26) Test Add to Wishlist Success
        Thread.sleep(1000);
        List<WebElement> productWishlist = driver.findElements(By.cssSelector("a.js-addwish-b2"));
        Random random = new Random();
        int randomIndex = random.nextInt(productWishlist.size());
        Thread.sleep(1000);
        WebElement randomProduct = productWishlist.get(randomIndex);
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(false);", randomProduct);
        Thread.sleep(1000);
        randomProduct.click();

        Thread.sleep(500);
        String classAttribute = driver.findElement(By.cssSelector(".swal-overlay")).getAttribute("class");
        assertEquals(true, classAttribute.contains("swal-overlay--show-modal"));
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".swal-button")).click();

        // 27) Test Checkout
        List<WebElement> productLinks = driver.findElements(By.cssSelector("a.js-name-b2"));
        Random random1 = new Random();
        int randomIndex1 = random1.nextInt(productLinks.size());
        Thread.sleep(1000);
        WebElement randomProductLink = productLinks.get(randomIndex1);
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(false);", randomProductLink);
        Thread.sleep(1000);
        randomProductLink.click();
        driver.findElement(By.cssSelector(".btn-num-product-up")).click();
        driver.findElement(By.cssSelector(".btn-num-product-up")).click();
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".js-addcart-detail")).click();
        String classAttribute1 = driver.findElement(By.cssSelector(".swal-overlay")).getAttribute("class");
        assertEquals(true, classAttribute1.contains("swal-overlay--show-modal"));

        driver.findElement(By.cssSelector(".swal-button")).click();
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".js-show-cart")).click();
        Thread.sleep(500);
        driver.findElement(By.linkText("CHECK OUT")).click();
        String message3 = driver.getTitle();
        assertEquals("Checkout", message3);

        WebElement cardNumber = driver.findElement(By.name("cardNumber"));
        WebElement cardName = driver.findElement(By.name("cardName"));
        WebElement expiryMonth = driver.findElement(By.name("expMonth"));
        WebElement expiryYear = driver.findElement(By.name("expYear"));
        WebElement cvcNumber = driver.findElement(By.name("securityCode"));
        WebElement buyButton = driver.findElement(By.xpath("//button[@type='submit']"));
        /*WebElement buyButton = driver.findElement(By.linkText("Buy Now"));*/
        /*Actions actions = new Actions(driver);*/
        // Locate and click the "Buy Now" button
        /*WebElement buyNowButton = driver.findElement(By.cssSelector("button[type='submit']"));*/


        // 28) Test Checkout Fail
        JavascriptExecutor executor = (JavascriptExecutor)driver;
        executor.executeScript("arguments[0].value = '';", cardNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cardNumber, "12345653567909");
        executor.executeScript("arguments[0].value = '';", cardName);
        executor.executeScript("arguments[0].value = arguments[1];", cardName, "John Doe");
        executor.executeScript("arguments[0].value = '';", expiryMonth);
        executor.executeScript("arguments[0].value = arguments[1];", expiryMonth, "12");
        executor.executeScript("arguments[0].value = '';", expiryYear);
        executor.executeScript("arguments[0].value = arguments[1];", expiryYear, "26");
        Thread.sleep(1000);
        executor.executeScript("arguments[0].click();", buyButton);
        String message4 = driver.getTitle();
        assertEquals("Checkout", message4);

        // 29) Test Checkout Success
        Thread.sleep(1000);
        executor.executeScript("arguments[0].value = '';", cardNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cardNumber, "12343567909");
        executor.executeScript("arguments[0].value = '';", cardName);
        executor.executeScript("arguments[0].value = arguments[1];", cardName, "John Doe");
        executor.executeScript("arguments[0].value = '';", expiryMonth);
        executor.executeScript("arguments[0].value = arguments[1];", expiryMonth, "10");
        executor.executeScript("arguments[0].value = '';", expiryYear);
        executor.executeScript("arguments[0].value = arguments[1];", expiryYear, "28");
        executor.executeScript("arguments[0].value = '';", cvcNumber);
        executor.executeScript("arguments[0].value = arguments[1];", cvcNumber, "678");
        Thread.sleep(1000);
        executor.executeScript("arguments[0].click();", buyButton);
        /*driver.findElement(By.cssSelector("button[type='submit']")).click();*/
        /*driver.findElement(By.xpath("//button[@type='submit']")).click();*/
        /*executor.executeScript("arguments[0].scrollIntoView({behavior: 'auto', block: 'center', inline: 'center'});", buyButton);
        actions.moveToElement(buyButton).click().perform();*/
        Thread.sleep(1000);

        String classAttribute7 = driver.findElement(By.cssSelector(".swal-overlay")).getAttribute("class");
        assertEquals(true, classAttribute7.contains("swal-overlay--show-modal"));
        Thread.sleep(500);
        driver.findElement(By.cssSelector(".swal-button")).click();

    }

    public void clickAndVerifyLink(String linkText, String expectedPageTitle) throws InterruptedException {
        WebElement link = driver.findElement(By.linkText(linkText));
        Thread.sleep(1000);
        link.click();
        assertEquals(expectedPageTitle, driver.getTitle());
        driver.navigate().back();
    }

}
