<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 22/08/2023
  Time: 08:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Your Orders</title>
  <jsp:include page="../../assets/head/head.jsp"></jsp:include>
</head>
<body class="animsition">

<!-- ===== Header ===== -->
<jsp:include page="../../assets/header/header.jsp"></jsp:include>
<!-- ===== End Header ===== -->

<jsp:include page="../../assets/utils/sidebar.jsp"></jsp:include>

<!-- ===== Main Body ===== -->
<main id="main">
  <!-- Title -->
  <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('assets/img/banners/titleBanner1.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
      Contact Us
    </h2>
  </section>
  <!-- End Title -->

  <!-- Contact Us -->
  <section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <c:forEach var="order" items="${orderHistory}">
          <div class="row mb-3">
              <div class="card">
                <div class="card-header">
                  <div class="row">
                    <div class="col-md-4">
                      <p><small><strong>ORDER PLACED:</strong> ${order.orderDate}</small></p>
                    </div>
                    <div class="col-md-4">
                      <p><small><strong>TOTAL:</strong> ${order.totalAmount}</small></p>
                    </div>
                    <div class="col-md-4">
                      <p><small><strong>ORDER No.:</strong> ${order.orderID}</small></p>
                    </div>
                  </div>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4" style="padding: 10px">
                  <c:forEach var="orderItem" items="${order.orderItems}">
                    <div class="col">
                      <div class="card">
                        <div class="row g-0">
                          <div class="col-md-4 d-flex align-items-center">
                            <img src="assets/img/products/${orderItem.productMaterial}/${orderItem.productCategory}/${orderItem.productImagePath}.jpg" class="img-fluid rounded-start" alt="${orderItem.productName}">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <p class="card-title"><small><strong>${orderItem.productName}</strong></small></p> <br>
                              <p class="card-text"><small><strong>Quantity:</strong> ${orderItem.quantity}</small></p>
                              <p class="card-text"><small><strong>Price:</strong> £${orderItem.productPrice}</small></p>
                              <p class="card-text"><small><strong>Total:</strong> £${orderItem.totalPrice}</small></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
                <div class="card-footer text-muted">
                  <p class="text-muted"><small>2 days ago</small></p>
                </div>
              </div>
          </div>
        </c:forEach>
    </div>
  </section>
  <!-- End Contact Us -->

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
</body>
</html>
