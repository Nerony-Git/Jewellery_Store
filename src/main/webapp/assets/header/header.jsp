<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 04/07/2023
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <div class="logo">
            <h1 class="text-light">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/">
                    <img src="assets/img/web/logo.png" alt="logo">
                </a>
            </h1>
        </div>

        <nav id="navbar" class="navbar navi">
            <ul>
                <li id="home"><a class="nav-link" href="<%=request.getContextPath()%>/"><i class="fa-solid fa-gauge-high"></i> &nbsp; Home</a> </li>
                <li id="about"><a class="nav-link" href="<%=request.getContextPath()%>/about_us"><i class="fa-solid fa-address-card"></i> &nbsp; About Us</a> </li>
                <li id="contact"><a class="nav-link" href="<%=request.getContextPath()%>/contact_us"><i class="fa-solid fa-phone-volume"></i> &nbsp; Contact Us</a> </li>
                &lt;%&ndash;<li><a class="nav-link" href=""><i class="fas fa-sign-in-alt"></i> &nbsp; Login </a> </li>&ndash;%&gt;
                <li class="dropdown" id="signup"><a href="#"><i class="fas fa-address-book"></i> <span> &nbsp; Signup</span> <i class="bi bi-chevron-down"></i> </a>
                    <ul>
                        <li><a class="nav-link" href="<%=request.getContextPath()%>/user_register"><i class="fas fa-user-plus"></i> &nbsp; Donor Signup </a> </li>
                        &lt;%&ndash;<li><a class="nav-link" href="<%=request.getContextPath()%>/doctor_login"><i class="fas fa-sign-in-alt"></i> &nbsp; Doctor Login </a> </li>&ndash;%&gt;
                        <li><a class="nav-link" href="<%=request.getContextPath()%>/admin_register"><i class="fas fa-user-gear"></i> &nbsp; Admin Signup </a> </li>
                    </ul>
                </li>
                <li class="dropdown" id="login"><a href="#"><i class="fas fa-sign-in-alt"></i> <span> &nbsp; Logins</span> <i class="bi bi-chevron-down"></i> </a>
                    <ul>
                        <li><a class="nav-link" href="<%=request.getContextPath()%>/user_login"><i class="fas fa-sign-in-alt"></i> &nbsp; Donor Login </a> </li>
                        &lt;%&ndash;<li><a class="nav-link" href="<%=request.getContextPath()%>/doctor_login"><i class="fas fa-sign-in-alt"></i> &nbsp; Doctor Login </a> </li>&ndash;%&gt;
                        <li><a class="nav-link" href="<%=request.getContextPath()%>/admin_login"><i class="fas fa-sign-in-alt"></i> &nbsp; Admin Login </a> </li>
                    </ul>
                </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
    </div>
</header>--%>

<!-- ===== Header ===== -->
<header>
    <!-- Desktop Header -->
    <div class="container-menu-desktop">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="top-bar-content flex-sb-m h-full container">
                <div class="left-top-bar">
                    Free Shipping for orders over £50
                </div>

                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m trans-04 p-lr-25"> FAQs </a>
                    <a href="<%=request.getContextPath()%>/contact_us" class="flex-c-m trans-04 p-lr-25"> Contact </a>
                    <a href="#" class="flex-c-m trans-04 p-lr-25"> Login </a>

                </div>
            </div>
        </div>
        <!-- End Top Bar -->

        <!-- Navigation Bar -->
        <div class="wrap-menu-desktop">
            <nav class="container limiter-menu-desktop">
                <!-- Logo -->
                <a href="#" class="logo">
                    <img src="assets/img/web/logo.png" alt="KC Jewellery logo">
                </a>
                <!-- End Logo -->

                <!-- Desktop Menu -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li class="active-menu"><a href="<%=request.getContextPath()%>/">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/shops">Shop</a> </li>
                        <li><a href="<%=request.getContextPath()%>/about_us">About</a> </li>
                        <li><a href="<%=request.getContextPath()%>/contact_us">Contact</a> </li>
                    </ul>
                </div>
                <!-- End Desktop Menu -->

                <!-- Icon Menu -->
                <div class="wrap-icon-header flex-w flex-r-m">
                    <div class="icon-header-item hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                        <i class="zmdi zmdi-search"></i>
                    </div>
                    <p class="userID" style="display: none">${customer.customerID}</p>

                    <div class="icon-header-item hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${customer.cartCount}">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <div class="icon-header-item hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-wishlist" data-notify="${customer.wishlistCount}">
                        <i class="zmdi zmdi-favorite-outline"></i>
                    </div>

                    <div class="icon-header-item hov-cl1 trans-04 p-l-22 p-r-11 js-show-account">
                        <i class="zmdi zmdi-account"></i>
                    </div>

                </div>
                <!-- End Icon Menu -->

            </nav>
        </div>
        <!-- End Navigation Bar -->

    </div>
    <!-- End Desktop Header -->

    <!-- Mobile Header -->
    <div class="wrap-header-mobile">
        <!-- Logo -->
        <a href="#" class="logo">
            <img src="assets/img/web/logo.png" alt="KC Jewellery logo">
        </a>
        <!-- End Logo -->

        <!-- Icon Menu -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
            </div>

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>
        </div>
        <!-- End Icon Menu -->

        <!-- Menu Toggle -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
        <!-- End Menu Toggle -->

    </div>

    <!-- Mobile Menu -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar">
                    Free Shipping for orders over £50
                </div>
            </li>
            <li>
                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m trans-04 p-lr-10"> FAQs </a>
                    <a href="#" class="flex-c-m trans-04 p-lr-10"> Contact </a>
                    <a href="#" class="flex-c-m trans-04 p-lr-10"> Login </a>

                </div>
            </li>
        </ul>
        <ul class="main-menu-m">
            <li class="active-menu"><a href="#">Home</a></li>
            <li><a href="#">Shop</a> </li>
            <li><a href="#">About</a> </li>
            <li><a href="#">Contact</a> </li>
        </ul>
    </div>
    <!-- End Mobile Menu -->

    <!-- Mobile Header -->

    <jsp:include page="../utils/search.jsp"></jsp:include>

</header>
