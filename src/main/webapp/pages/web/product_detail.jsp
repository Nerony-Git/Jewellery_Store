<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 13/08/2023
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Product Detail</title>
    <jsp:include page="../../assets/head/head.jsp"></jsp:include>
</head>

<body class="animsition">

<!-- ===== Header ===== -->
<jsp:include page="../../assets/header/header.jsp"></jsp:include>
<!-- ===== End Header ===== -->

<jsp:include page="../../assets/utils/sidebar.jsp"></jsp:include>

<!-- ===== Main Body ===== -->
<main id="main">
    <!-- Product Details -->
    <section class="sec-product-detail bg0 p-t-85 p-b-60">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-7 p-b-30">
                    <div class="p-l-25 p-r-30 p-lr-0-lg">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="wrap-slick3-dots"></div>
                            <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                            <p class="image" style="display: none"
                               data-product-id="<c:out value="${productDetail.productID}"/>"
                               data-product-name="<c:out value="${productDetail.productName}"/>"
                               data-product-price="<c:out value="${productDetail.productPrice}"/>"
                               data-product-material="<c:out value="${productDetail.productMaterial}"/>"
                               data-product-category="<c:out value="${productDetail.productCategory}"/>"
                               data-product-description="<c:out value="${productDetail.productDescription}"/>"
                               data-product-image="<c:out value="${productDetail.productImagePath}"/>"
                               data-product-image1="<c:out value="${productDetail.productImagePath1}"/>"
                               data-product-image2="<c:out value="${productDetail.productImagePath2}"/>"></p>
                            <div class="slick3 gallery-lb js-show-image">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5 p-b-30">
                    <div class="p-r-50 p-t-5 p-lr-0-lg js-product-details">
                        <p class="mtext-105 cl2 js-name-id p-b-14" style="display: none"> ${productDetail.productID} </p>
                        <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                            ${productDetail.productName}
                        </h4>

                        <span class="mtext-106 cl2">
							£${productDetail.productPrice}
						</span>

                        <p class="stext-102 cl3 p-t-23">
                            ${productDetail.productDescription}
                        </p>

                        <!--  -->
                        <div class="p-t-33">
                            <div class="flex-w flex-r-m p-b-10">
                                <div class="size-204 flex-w flex-m respon6-next">
                                    <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                        <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-minus"></i>
                                        </div>

                                        <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" placeholder="0" required>

                                        <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                        </div>
                                    </div>

                                    <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                        Add to cart
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!--  -->
                        <div class="flex-w flex-m p-l-100 p-t-40 respon7">
                            <div class="flex-m bor9 p-r-10 m-r-11">
                                <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-details tooltip100" data-tooltip="Add to Wishlist">
                                    <i class="zmdi zmdi-favorite"></i>
                                </a>
                            </div>

                            <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>

                            <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bor10 m-t-50 p-t-43 p-b-40">
                <!-- Tab01 -->
                <div class="tab01">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item p-b-10" role="presentation">
                            <a class="nav-link active" data-bs-toggle="tab" href="#description" role="tab">Description</a>
                        </li>

                        <li class="nav-item p-b-10">
                            <a class="nav-link" data-bs-toggle="tab" href="#information" role="tab">Additional information</a>
                        </li>

                        <li class="nav-item p-b-10">
                            <a class="nav-link" data-bs-toggle="tab" href="#reviews" role="tab">Reviews (1)</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content p-t-43">
                        <!-- - -->
                        <div class="tab-pane fade show active" id="description" role="tabpanel">
                            <div class="how-pos2 p-lr-15-md">
                                <p class="stext-102 cl6">
                                    ${productDetail.productDescription}
                                </p>
                            </div>
                        </div>

                        <!-- - -->
                        <div class="tab-pane fade" id="information" role="tabpanel">
                            <div class="row">
                                <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                                    <ul class="p-lr-28 p-lr-15-sm">
                                        <li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Brand
											</span>

                                            <span class="stext-102 cl6 size-206">
                                                ${productDetail.productBrand}
                                            </span>
                                        </li>

                                        <li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Category
											</span>

                                            <span class="stext-102 cl6 size-206">
												${productDetail.productCategory}
											</span>
                                        </li>

                                        <li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Dimensions
											</span>

                                            <span class="stext-102 cl6 size-206">
												${productDetail.productSize}
											</span>
                                        </li>

                                        <li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Materials
											</span>

                                            <span class="stext-102 cl6 size-206">
												${productDetail.productMaterial}
											</span>
                                        </li>

                                        <li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Gender
											</span>

                                            <span class="stext-102 cl6 size-206">
												${productDetail.productGender}
											</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- - -->
                        <div class="tab-pane fade" id="reviews" role="tabpanel">
                            <div class="row">
                                <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                                    <div class="p-b-30 m-lr-15-sm">
                                        <!-- Review -->
                                        <div class="flex-w flex-t p-b-68">
                                            <div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
                                                <img src="assets/images/avatar-01.jpg" alt="AVATAR">
                                            </div>

                                            <div class="size-207">
                                                <div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														Ariana Grande
													</span>

                                                    <span class="fs-18 cl11">
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star-half"></i>
													</span>
                                                </div>

                                                <p class="stext-102 cl6">
                                                    Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
                                                </p>
                                            </div>
                                        </div>

                                        <!-- Add review -->
                                        <form class="w-full">
                                            <h5 class="mtext-108 cl2 p-b-7">
                                                Add a review
                                            </h5>

                                            <p class="stext-102 cl6">
                                                Your email address will not be published. Required fields are marked *
                                            </p>

                                            <div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

                                                <span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
                                            </div>

                                            <div class="row p-b-25">
                                                <div class="col-12 p-b-5">
                                                    <label class="stext-102 cl3" for="review">Your review</label>
                                                    <textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
                                                </div>

                                                <div class="col-sm-6 p-b-5">
                                                    <label class="stext-102 cl3" for="name">Name</label>
                                                    <input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
                                                </div>

                                                <div class="col-sm-6 p-b-5">
                                                    <label class="stext-102 cl3" for="email">Email</label>
                                                    <input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
                                                </div>
                                            </div>

                                            <button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
                                                Submit
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				SKU: ${productDetail.productID}
			</span>

            <span class="stext-107 cl6 p-lr-25">
				Categories: ${productDetail.productCategory}, ${productDetail.productGender}
			</span>
        </div>
    </section>
    <!-- End Product Details -->

    <!-- Related Products -->
    <section class="sec-relate-product bg0 p-t-45 p-b-105">
        <div class="container">
            <div class="p-b-45">
                <h3 class="ltext-106 cl5 txt-center">
                    Related Products
                </h3>
            </div>

            <!-- Slide2 -->
            <div class="wrap-slick2">
                <div class="slick2">
                    <c:forEach var="product" items="${allProducts}">
                        <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                            <!-- Block2 -->
                            <div class="block2">
                                <div class="block2-pic hov-img0">
                                    <img src="assets/img/products/<c:out value="${product.productMaterial}"/>/<c:out value="${product.productCategory}"/>/<c:out value="${product.productImagePath}"/>.jpg" alt="<c:out value="${product.productName}"/>">

                                    <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"
                                       data-product-id="<c:out value="${product.productID}"/>"
                                       data-product-name="<c:out value="${product.productName}"/>"
                                       data-product-price="<c:out value="${product.productPrice}"/>"
                                       data-product-material="<c:out value="${product.productMaterial}"/>"
                                       data-product-category="<c:out value="${product.productCategory}"/>"
                                       data-product-description="<c:out value="${product.productDescription}"/>"
                                       data-product-image="<c:out value="${product.productImagePath}"/>"
                                       data-product-image1="<c:out value="${product.productImagePath1}"/>"
                                       data-product-image2="<c:out value="${product.productImagePath2}"/>">
                                        Quick View
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <p class="js-productID-b2" style="display: none"><c:out value="${product.productID}"/></p>
                                        <a href="<%=request.getContextPath()%>/product_detail?id=${product.productID}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            <c:out value="${product.productName}"/>
                                        </a>

                                        <span class="stext-105 cl3">
                                        £<c:out value="${product.productPrice}"/>
                                    </span>
                                    </div>

                                    <div class="block2-txt-child2 flex-r p-t-3">
                                        <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                            <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                    <%--<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-02.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Herschel supply
                                    </a>

                                    <span class="stext-105 cl3">
										$35.31
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-03.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Only Check Trouser
                                    </a>

                                    <span class="stext-105 cl3">
										$25.50
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-04.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Classic Trench Coat
                                    </a>

                                    <span class="stext-105 cl3">
										$75.00
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-05.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Front Pocket Jumper
                                    </a>

                                    <span class="stext-105 cl3">
										$34.75
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-06.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Vintage Inspired Classic
                                    </a>

                                    <span class="stext-105 cl3">
										$93.20
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-07.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Shirt in Stretch Cotton
                                    </a>

                                    <span class="stext-105 cl3">
										$52.66
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15 slick-related-slide">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-pic hov-img0">
                                <img src="assets/images/product-08.jpg" alt="IMG-PRODUCT">

                                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                    Quick View
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                        Pieces Metallic Printed
                                    </a>

                                    <span class="stext-105 cl3">
										$18.96
									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04" src="assets/images/icons/icon-heart-01.png" alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l" src="assets/images/icons/icon-heart-02.png" alt="ICON">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </section>
    <!-- End Related Products -->
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
    document.addEventListener("DOMContentLoaded", function() {
        // Find the <p> tag with the class "image"
        var imageTag = document.querySelector(".image");

        // Get the product details from the clicked button's data attributes
        var productName = imageTag.getAttribute('data-product-name');
        var productMaterial = imageTag.getAttribute('data-product-material');
        var productCategory = imageTag.getAttribute('data-product-category');
        var path = "assets/img/products/";
        var productImages = [
            imageTag.getAttribute('data-product-image'),
            imageTag.getAttribute('data-product-image1'),
            imageTag.getAttribute('data-product-image2')
        ];
        var showImageClass = '.js-show-image';

        productImages = productImages.filter(function (image) {
            return image !== "0";
        });

        // Call the setupGallery function with the extracted values
        setupGallery(productImages, path, productMaterial, productCategory, productName, showImageClass);

    });
</script>

</body>
</html>
