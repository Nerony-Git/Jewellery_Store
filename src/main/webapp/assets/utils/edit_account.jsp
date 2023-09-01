<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 21/08/2023
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== Edit Account ===== -->
<div class="wrap-header-account js-panel-view-account">
    <div class="s-full js-hide-register"></div>

    <div class="header-account flex-col-l p-l-65 p-r-25">
        <div class="header-account-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					View / Edit Account
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-view-account">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-view-account-content flex-w js-pscroll">
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

            <!-- Register Form -->
            <form action="<%=request.getContextPath()%>/update" method="post">
                <label class="form-label" for="customerID">First Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="si"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="customerID" id="customerID" class="form-control" aria-label="First Name" aria-describedby="firstName" readonly value="${customer.customerID}">
                </div>

                <label class="form-label" for="firstName">First Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="firstName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="firstName" class="form-control" aria-label="First Name" aria-describedby="firstName" required value="${customer.firstName}">
                </div>

                <label class="form-label" for="lastName">Last Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="lastName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="lastName" class="form-control" aria-label="Last Name" aria-describedby="lastName" required value="${customer.lastName}">
                </div>

                <label class="form-label" for="otherName">Other Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="otherName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="otherName" class="form-control" aria-label="Other Name" aria-describedby="otherName" value="${customer.otherName}">
                </div>

                <label class="form-label" for="username">Username</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="username"><i class="fa-solid fa-user-tag"></i> </span>
                    <input type="text" name="username" class="form-control" aria-label="Username" aria-describedby="username" disabled value="${customer.username}">
                </div>

                <label class="form-label" for="dob">Date of Birth</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="dob"><i class="fa-solid fa-calendar"></i> </span>
                    <input type="date" name="dob" class="form-control" aria-label="Date of Birth" aria-describedby="dob" required value="${customer.dob}">
                </div>

                <label class="form-label" for="gender">Gender</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="gender"><i class="fa-solid fa-venus-mars"></i> </span>
                    <select name="gender" class="form-select" aria-label="Gender" aria-describedby="gender" required>
                        <option selected="selected"> ${customer.gender} </option>
                        <option value="F">F</option>
                        <option value="M">M</option>
                    </select>
                </div>

                <label class="form-label" for="address">Address</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="address"><i class="fa-solid fa-map-location-dot"></i> </span>
                    <input type="text" name="address" class="form-control" aria-label="Address" aria-describedby="address" required value="${customer.address}">
                </div>

                <label class="form-label" for="postalAddress">Postal Address</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="postalAddress"><i class="fa-solid fa-street-view"></i> </span>
                    <input type="text" name="postalAddress" class="form-control" aria-label="Postal Address" aria-describedby="postalAddress" required value="${customer.postalAddress}">
                </div>

                <label class="form-label" for="contact">Contact</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="contact"><i class="fa-solid fa-phone-volume"></i> </span>
                    <input type="text" name="contact" minlength="11" maxlength="11" class="form-control" aria-label="Contact" aria-describedby="contact" required value="${customer.contact}">
                </div>

                <label class="form-label" for="email">Email</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="email"><i class="fa-solid fa-envelope"></i> </span>
                    <input type="text" name="email" class="form-control" aria-label="Email" aria-describedby="email" required value="${customer.email}">
                </div>

                <br />

                <div class="input-group justify" style="justify-content: center">
                    <button type="submit" class="btn bor2 bg3 hov-btn3 cl0"> &nbsp;<i class="fa-solid fa-user-pen"></i>&nbsp; Update &nbsp;</button>
                </div>
            </form>
            <!-- End Register Form -->

            <br />

        </div>
    </div>
</div>

<!-- ===== End Edit Account ===== -->
