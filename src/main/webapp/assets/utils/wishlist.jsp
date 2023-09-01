<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 10/08/2023
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== Wishlist ===== -->
<div class="wrap-header-wishlist js-panel-wishlist">
    <div class="s-full js-hide-wishlist"></div>

    <div class="header-wishlist flex-col-l p-l-65 p-r-25">
        <div class="header-wishlist-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Wishlist
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-wishlist">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-wishlist-content flex-w js-pscroll">
            <ul class="header-wishlist-wrapitem w-full">

            </ul>

            <div class="w-full">
                <div class="header-wishlist-buttons flex-w w-full" style="justify-content: center">
                    <a href="<%=request.getContextPath()%>/cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        View Cart
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ===== End Wishlist ===== -->
