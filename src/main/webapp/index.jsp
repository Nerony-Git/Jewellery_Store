<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>KC - Jewellery Store</title>
    <jsp:include page="assets/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/main.css">

</head>
<body>
<!-- ===== Header ===== -->
<jsp:include page="assets/header/header.jsp"></jsp:include>
<!-- ===== End Header ===== -->

<!-- ===== Main Body ===== -->
<main id="main">
    <%--<section id="contentWrapper">
        <div id="container" class="indexWrapper">

        </div>
    </section>--%>

    <!-- Slider Section -->
    <section class="slider section-head">
        <div class="container">
            <div class="row">
                <div class="flexslider" style="direction: rtl">
                    <div class="ribbon ribbon-top-left"><span>ribbon</span></div>
                    <ul class="slides">
                        <li><img src="assets/img/slides/slider1.jpg"></li>
                        <li><img src="assets/img/slides/slider2.jpg"></li>
                        <%--<li><img src="assets/img/slides/slider3.jpg"></li>
                        <li><img src="assets/img/slides/slider4.jpg"></li>
                        <li><img src="assets/img/slides/slider5.jpg"></li>
                        <li><img src="assets/img/slides/slider6.jpg"></li>
                        <li><img src="assets/img/slides/slider7.jpg"></li>
                        <li><img src="assets/img/slides/slider8.jpg"></li>
                        <li><img src="assets/img/slides/slider9.jpg"></li>
                        <li><img src="assets/img/slides/slider10.jpg"></li>
                        <li><img src="assets/img/slides/slider11.jpg"></li>
                        <li><img src="assets/img/slides/slider12.jpg"></li>
                        <li><img src="assets/img/slides/slider13.jpg"></li>
                        <li><img src="assets/img/slides/slider14.jpg"></li>
                        <li><img src="assets/img/slides/slider15.jpg"></li>--%>
                    </ul>
                    <div class="ribbon ribbon-bottom-right"><span>ribbon</span></div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Slider Section -->

    <!-- Featured Product -->
    <section id="featured">
        <div class="section_divider">
            <span> Featured Products </span>
            <div class="container">
                <div class="content">
                    <h2 style="text-align: center"> Featured Jewelleries - Refresh to view more items.</h2>
                    <div class="row row-cols-1 row-cols-md-6 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/1.jpg" class="card-img-top" alt="Product 1">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 1</small>
                                    <small class="product_price">£120</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text" id="quantity"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity" aria-label="Quantity" aria-describedby="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/2.jpg" class="card-img-top" alt="Product 2">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 2</small>
                                    <small class="product_price">£110</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/3.jpg" class="card-img-top" alt="Product 3">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 3</small>
                                    <small class="product_price">£150</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/4.jpg" class="card-img-top" alt="Product 4">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 4</small>
                                    <small class="product_price">£90</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/5.jpg" class="card-img-top" alt="Product 5">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 5</small>
                                    <small class="product_price">£250</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/6.jpg" class="card-img-top" alt="Product 6">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <small class="product_name">Product 6</small>
                                    <small class="product_price">£70</small>
                                </div>
                                <div class="card-footer">
                                    <form action="" method="post">
                                        <input type="hidden" name="productID" value="Product1">
                                        <div class="input-group">
                                            <span class="input-group-text"><small>Qty</small></span>
                                            <input type="number" class="form-control" name="quantity">
                                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%--
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/7.jpg" class="card-img-top" alt="Product 7">
                                <div class="card-body">
                                    <h5 class="card-title">Product 7</h5>
                                </div>
                                <div class="card-footer">
                                    <small class="text-body-secondary">£12.00</small>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/8.jpg" class="card-img-top" alt="Product 8">
                                <div class="card-body">
                                    <h5 class="card-title">Product 8</h5>
                                </div>
                                <div class="card-footer">
                                    <small class="text-body-secondary">£12.00</small>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="assets/img/products/toe_ring/9.jpg" class="card-img-top" alt="Product 9">
                                <div class="card-body">
                                    <h5 class="card-title">Product 9</h5>
                                </div>
                                <div class="card-footer">
                                    <small class="text-body-secondary">£12.00</small>
                                </div>
                            </div>
                        </div>
                        --%>

                    </div>
                </div>
            </div>
        </div>
        <%--<div class="box-heading-1">
            <span> Random Featured </span>
            <div class="box-content-1">
                <div class="box-product-1">
                    <h2 style="text-align: center"> Random Jewelleries - Refresh to view more items.</h2>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/1.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 1</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/2.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 2</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/3.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 3</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/4.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 4</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/5.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 5</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/6.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 6</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/7.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 7</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/8.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 8</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="image">
                            <a href=""><img src="assets/img/products/toe_ring/9.jpg" width="150px" height="150px" alt="..."></a>
                            <div class="proName">
                                <div class="name">
                                    <a href="">Product 9</a>
                                </div>
                                <div class="price">
                                    £12.00
                                </div>
                                <div class="cart">
                                    <label class="btn"></label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>--%>
    </section>
    <!-- End Featured Product -->

    <!-- Special Promo Banner -->
    <section id="promotion">
        <div class="section_divider">
            <span> PROMOTIONS </span>
            <div class="container"></div>
        </div>
    </section>
    <!-- End Special Promo Banner -->
</main>
<!-- ===== End Main Body ===== -->

<!-- ===== Footer ===== -->
<jsp:include page="assets/footer/footer.jsp"></jsp:include>
<!-- ===== End Footer ===== -->

<!-- ===== Scripts ===== -->
<script type="text/javascript" src="assets/js/main.js"></script>
<!-- ===== End Scripts ===== -->

</body>
</html>