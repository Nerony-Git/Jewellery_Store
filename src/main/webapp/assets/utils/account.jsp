<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 13/08/2023
  Time: 09:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ===== Account ===== -->

<div class="wrap-header-account js-panel-account">
  <div class="s-full js-hide-account"></div>

  <div class="header-account flex-col-l p-l-65 p-r-25">
    <div class="header-account-title flex-w flex-sb-m p-b-8">

      <!-- Check if Customer is Login -->
      <c:if test="${empty customer}">
        <span class="mtext-103 cl2"> Login </span>
      </c:if>

      <c:if test = "${not empty customer}">
        <span class="mtext-103 cl2"> My Account </span>
      </c:if>
      <!-- End Check if Customer is Login -->

      <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-account">
        <i class="zmdi zmdi-close"></i>
      </div>
    </div>

    <!-- Check if Customer is Login -->
    <c:if test = "${not empty customer}">
      <div class="header-account-content flex-w js-pscroll">
        <ul class="sidebar-link w-full">
          <li class="p-b-13">
            <a href="<%=request.getContextPath()%>/order_history?id=${customer.customerID}" class="stext-102 cl2 hov-cl1 trans-04">
              My Order
            </a>
          </li>

          <li class="p-b-13">
            <a href="#" class="stext-102 cl2 hov-cl1 trans-04 js-show-wishlist">
              My Wishlist
            </a>
          </li>

          <li class="p-b-13">
            <a href="#" class="stext-102 cl2 hov-cl1 trans-04 js-show-view-account">
              My Account
            </a>
          </li>

          <li class="p-b-13">
            <a href="<%=request.getContextPath()%>/cart?id=${customer.customerID}&sid=${sessionID}" class="stext-102 cl2 hov-cl1 trans-04">
              View Cart
            </a>
          </li>

          <li class="p-b-13">
            <a href="<%=request.getContextPath()%>/logout" class="stext-102 cl2 hov-cl1 trans-04">
              Logout
            </a>
          </li>
        </ul>
      </div>
    </c:if>

    <!-- Success Message -->
    <c:if test="${not empty successMsg}">
      <p class="text-center text-success fs-5">${successMsg}</p>
      <c:remove var="successMsg" scope="session" />
    </c:if>
    <!-- End Success Message -->

    <!-- Error Message -->
    <c:if test="${not empty errorMsg}">
      <p class="text-center text-danger fs-5">${errorMsg}</p>
      <c:remove var="errorMsg" scope="session" />
    </c:if>
    <!-- End Error Message -->

    <c:if test="${empty customer}">
      <div class="header-account-content flex-w js-pscroll">
        <!-- Login Form -->
        <form action="<%=request.getContextPath()%>/login" method="post">
          <label class="form-label" for="uName">Username</label>
          <div class="input-group mb-3">
            <span class="input-group-text" id="uName"><i class="fa fa-tags"></i> </span>
            <input type="text" name="username" class="form-control" placeholder="Enter Username" aria-label="Username" aria-describedby="uName" required>
          </div>

          <label class="form-label" for="pass">Password</label>
          <div class="input-group mb-3">
            <span class="input-group-text" id="pass"><i class="fa-solid fa-lock"></i> </span>
            <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" aria-label="Password" aria-describedby="pass" required>
            <i class="view_password input-group-text bi bi-eye-slash" id="togglePassword" onclick="showPassword('password', 'togglePassword')"></i>
          </div>

          <br />

          <div class="input-group justify" style="justify-content: center">
            <button type="submit" class="btn bor2 bg3 hov-btn3 cl0"> &nbsp;<i class="fa-solid fa-right-to-bracket"></i>&nbsp; Login &nbsp;</button>
          </div>
        </form>
        <!-- End Login Form -->

        <br />
        <p>Not registered yet? <a href="" class="text-decoration-none js-show-register"> Register </a> </p>
      </div>
    </c:if>
    <!-- End Check if Customer is Login -->

  </div>
</div>

<!-- ===== End Account ===== -->
