<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 10/08/2023
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== Shopping Cart ===== -->
<div class="wrap-header-cart js-panel-cart">
  <div class="s-full js-hide-cart"></div>

  <div class="header-cart flex-col-l p-l-65 p-r-25">
    <div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

      <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
        <i class="zmdi zmdi-close"></i>
      </div>
    </div>

    <div class="header-cart-content flex-w js-pscroll">
      <ul class="header-cart-wrapitem w-full">

      </ul>

      <div class="w-full">
        <div class="header-cart-total w-full p-tb-40">

        </div>

        <div class="header-cart-buttons flex-w w-full">
          <a href="<%=request.getContextPath()%>/cart?id=${customer.customerID}&sid=${sessionID}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
            View Cart
          </a>

          <a id="checkoutLink" href="<%=request.getContextPath()%>/checkout?id=${customer.customerID}&sid=${sessionID}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
            Check Out
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ===== End Shopping Cart ===== -->
