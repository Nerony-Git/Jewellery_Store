<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 21/08/2023
  Time: 08:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Checkout</title>
    <jsp:include page="../../assets/head/head.jsp"></jsp:include>
</head>
<body class="animsition">

<!-- ===== Header ===== -->
<jsp:include page="../../assets/header/header.jsp"></jsp:include>
<!-- ===== End Header ===== -->

<jsp:include page="../../assets/utils/sidebar.jsp"></jsp:include>

<!-- ===== Main Body ===== -->
<main id="main">
    <!-- Shopping Cart -->
    <form class="bg0 p-t-95 p-b-85" method="POST" action="<%=request.getContextPath()%>/order" id="checkoutForm">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table table-shopping-cart">
                                <%--<tr class="table_head">
                                    <th class="column-1">Product</th>
                                    <th class="column-2"></th>
                                    <th class="column-3">Price</th>
                                </tr>--%>

                                <tr>
                                    <th style="width: 5%" rowspan="3">1</th>
                                    <th style="width: 35%" rowspan="3">Delivery Address</th>
                                    <td style="width: 60%">
                                        ${customer.firstName} &nbsp; ${customer.otherName} &nbsp; ${customer.lastName}
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        ${customer.address}
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="hidden" name="customerPostalAddress" value="${customer.postalAddress}">
                                        ${customer.postalAddress}
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="5">2</th>
                                    <th rowspan="5">Payment Method</th>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="hidden" name="customerID" value="${customer.customerID}">
                                        <label class="form-label" for="cardNumber">Card Number</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="card"><i class="fa-brands fa-cc-visa"></i> </span>
                                            <input type="number" name="cardNumber" class="form-control" id="cardNumber" required>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label class="form-label" for="cardName">Name on Card</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="name"><i class="fa-solid fa-circle-user"></i> </span>
                                            <input type="text" name="cardName" class="form-control" id="cardName" required>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label class="form-label" for="expMonth">Expiration Date</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="expM"><strong>MM</strong></span>
                                            <input type="number" name="expMonth" class="form-control" id="expMonth" required minlength="2" maxlength="2">
                                            <span class="input-group-text" id="expY"><strong>YY</strong></span>
                                            <input type="number" name="expYear" class="form-control" id="expYear" required minlength="2" maxlength="2">
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label class="form-label" for="securityCode">Security Code (CVC)</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="security"><i class="fa-solid fa-credit-card"></i> </span>
                                            <input type="number" name="securityCode" class="form-control" id="securityCode" required minlength="3" maxlength="3">
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="2">3</th>
                                    <th colspan="2">Review items and delivery</th>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <c:forEach var="cartItem" items="${cartItems}" varStatus="loop">
                                            <div class="card mb-3">
                                                <input type="hidden" name="productID${loop.index}" value="${cartItem.productID}">
                                                <input type="hidden" name="quantity${loop.index}" value="${cartItem.quantity}">
                                                <input type="hidden" name="productPrice${loop.index}" value="${cartItem.productPrice}">
                                                <input type="hidden" name="totalPrice${loop.index}" value="${cartItem.quantity * cartItem.productPrice}">
                                                <div class="row g-0">
                                                    <div class="col-md-4">
                                                        <img src="${cartItem.productImagePath}" class="img-fluid rounded-start"  alt="${cartItem.productName}">
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="card-body">
                                                            <p class="card-title"><strong>${cartItem.productName}</strong></p> <br>
                                                            <p class="card-text js-cart-item-quantity"> <strong>Quantity:</strong> ${cartItem.quantity}</p>
                                                            <p class="card-text js-cart-item-price"> <strong>Price:</strong> £${cartItem.productPrice}</p>
                                                            <p class="card-text js-cart-item-total"> </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                        <h4 class="mtext-109 cl2 p-b-30">
                            Cart Totals
                        </h4>

                        <div class="flex-w flex-t bor12 p-b-13">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
                            </div>

                            <div class="size-209">
								<span class="mtext-110 cl2 js-cart-total">

								</span>
                            </div>
                        </div>

                        <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                            <div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping:
								</span>
                            </div>

                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                <p class="stext-111 cl6 p-t-2 text-success">
                                    Free Shipping
                                </p>

                                <%--<div class="p-t-15">
									<span class="stext-112 cl8">
										Calculate Shipping
									</span>

                                    <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
                                        <select class="js-select2" name="time">
                                            <option>Select a country...</option>
                                            <option>USA</option>
                                            <option>UK</option>
                                        </select>
                                        <div class="dropDownSelect2"></div>
                                    </div>

                                    <div class="bor8 bg0 m-b-12">
                                        <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="State /  country">
                                    </div>

                                    <div class="bor8 bg0 m-b-22">
                                        <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="Postcode / Zip">
                                    </div>

                                    <div class="flex-w">
                                        <div class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
                                            Update Totals
                                        </div>
                                    </div>

                                </div>--%>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-27 p-b-33">
                            <div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
                            </div>

                            <div class="size-209 p-t-1">
                                <input type="hidden" name="totalAmount" class="js-cart-total-input">
								<span class="mtext-110 cl2 js-cart-total">

								</span>
                            </div>
                        </div>

                        <button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            Buy Now
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- End Shopping Cart -->
</main>
<!-- ===== End Main Body ===== -->


<!-- ===== Footer ===== -->
<jsp:include page="../../assets/footer/footer.jsp"></jsp:include>
<!-- ===== End Footer ===== -->

<jsp:include page="../../assets/utils/product_details.jsp"></jsp:include>

<!-- ===== Scripts ===== -->
<jsp:include page="../../assets/foot/foot.jsp"></jsp:include>
<!-- ===== End Scripts ===== -->

<jsp:include page="../../assets/utils/logic_js.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        // Calculate and update item totals on page load
        $('.js-cart-item-quantity').each(function () {
            var quantity = parseInt($(this).text().split(':')[1].trim());
            var price = parseFloat($(this).closest('.card-body').find('.js-cart-item-price').text().split('£')[1].trim());
            var total = quantity * price;
            $(this).closest('.card-body').find('.js-cart-item-total').text('Total: £' + total.toFixed(2));
        });

        // Calculate and update grand total
        var grandTotal = 0;
        $('.js-cart-item-total').each(function () {
            var total = parseFloat($(this).text().split('£')[1].trim());
            grandTotal += total;
        });
        $('.js-cart-total').text('£' + grandTotal.toFixed(2));
        $('.js-cart-total-input').val(grandTotal.toFixed(2));

        // Set total amount in hidden input field before form submission
        /*$('#checkoutForm').submit(function () {
            $('.js-cart-total-input').val(grandTotal.toFixed(2));
        });*/
    });
</script>

</body>

</html>
