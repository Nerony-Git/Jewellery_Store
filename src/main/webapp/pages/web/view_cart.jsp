<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 15/08/2023
  Time: 07:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>View Cart</title>
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
    <form class="bg0 p-t-95 p-b-85">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1">Product</th>
                                    <th class="column-2"></th>
                                    <th class="column-3">Price</th>
                                    <th class="column-4">Quantity</th>
                                    <th class="column-5">Total</th>
                                </tr>

                                <c:forEach var="cartItem" items="${cartItems}">
                                    <tr class="table_row">
                                        <td class="column-1">
                                            <div class="how-itemcart1">
                                                <img src="${cartItem.productImagePath}" alt="${cartItem.productName}">
                                            </div>
                                            <p class="js-product-id" style="display: none">${cartItem.productID}</p>
                                        </td>
                                        <td class="column-2">${cartItem.productName}</td>
                                        <td class="column-3 js-product-price">£ ${cartItem.productPrice}</td>
                                        <td class="column-4">
                                            <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>

                                                <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="${cartItem.quantity}">

                                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="column-5 js-product-total"> </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                            <div class="flex-w flex-m m-r-20 m-tb-5">
                                <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">

                                <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                    Apply coupon
                                </div>
                            </div>

                            <div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                                Update Cart
                            </div>
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
								<span class="mtext-110 cl2 js-sub-total">

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
								<span class="mtext-110 cl2 js-sub-total">

								</span>
                            </div>
                        </div>

                        <a id="checkout-link" href="<%=request.getContextPath()%>/checkout?id=${customer.customerID}&sid=${sessionID}" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            Proceed to Checkout
                        </a>
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
        $('.table_row').each(function () {
            var price = parseFloat($(this).find('.js-product-price').text().replace('£', ''));
            var quantity = parseInt($(this).find('.num-product').val());
            var total = price * quantity;
            $(this).find('.js-product-total').text('£' + total.toFixed(2));

            updateSubtotal();
        });
    });

    $(document).on('input', '.num-product', function () {
        var price = parseFloat($(this).closest('.table_row').find('.js-product-price').text().replace('£', ''));
        var productID = $(this).closest('.table_row').find('.js-product-id').text();
        var customerID = $('.userID').text().trim();
        var sessionID = $('.session-id').text();
        var quantity = parseInt($(this).val());
        var total = price * quantity;
        $(this).closest('.table_row').find('.js-product-total').text('£' + total.toFixed(2));

        updateSubtotal();

        cartUpdate(productID, customerID, sessionID, quantity);
    });

    $(document).on('click', '.btn-num-product-up', function () {
        var $row = $(this).closest('.table_row');
        var price = parseFloat($row.find('.js-product-price').text().replace('£', ''));
        var productID = $row.find('.js-product-id').text();
        var customerID = $('.userID').text().trim();
        var sessionID = $('.session-id').text();
        var $quantityInput = $row.find('.num-product');
        var currentQuantity = parseInt($quantityInput.val());
        var total = price * currentQuantity;
        console.log(currentQuantity);
        console.log(price);
        /*$quantityInput.val(currentQuantity + 1).trigger('input');*/
        $(this).closest('.table_row').find('.js-product-total').text('£' + total.toFixed(2));

        updateSubtotal();

        cartUpdate(productID, customerID, sessionID, currentQuantity);
    });

    $(document).on('click', '.btn-num-product-down', function () {
        var $row = $(this).closest('.table_row');
        var price = parseFloat($row.find('.js-product-price').text().replace('£', ''));
        var productID = $row.find('.js-product-id').text();
        var customerID = $('.userID').text().trim();
        var sessionID = $('.session-id').text();
        var $quantityInput = $row.find('.num-product');
        var currentQuantity = parseInt($quantityInput.val());
        console.log(currentQuantity);
        console.log(price);
        if (currentQuantity >= 1) {
            var total = price * currentQuantity;
            $(this).closest('.table_row').find('.js-product-total').text('£' + total.toFixed(2));

            updateSubtotal();

            cartUpdate(productID, customerID, sessionID, currentQuantity);
        }
    });

    $(document).ready(function () {
        $('.wrap-table-shopping-cart').on('click', '.how-itemcart1', function () {
            var $row = $(this).closest('.table_row'); // Get the parent row
            var productID = $row.find('.js-product-id').text().trim();
            var customerID = $('.userID').text().trim();
            var sessionID = $('.session-id').text();
            var initialNotifyValue = parseInt($('.icon-header-noti.js-show-cart').attr('data-notify'));
            var newNotifyValue = initialNotifyValue - 1;

            $.ajax({
                type: 'POST',
                url: '/remove_cart_item',
                data: {
                    productID: productID,
                    customerID: customerID,
                    sessionID: sessionID
                }
            })
                .done(function (response) {
                    $row.remove(); // Remove the row

                    updateSubtotal();
                    $('.icon-header-noti.js-show-cart').attr('data-notify', newNotifyValue);

                })
                .fail(function () {
                    // Error handling if needed
                });
        });
    });


</script>

</body>
</html>
