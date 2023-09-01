<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 14/08/2023
  Time: 08:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== Register Account ===== -->
<div class="wrap-header-account js-panel-register">
    <div class="s-full js-hide-register"></div>

    <div class="header-account flex-col-l p-l-65 p-r-25">
        <div class="header-account-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Register Account
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-register">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-account-content flex-w js-pscroll">
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
            <form action="<%=request.getContextPath()%>/register" method="post">
                <label class="form-label" for="firstName">First Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="firstName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="firstName" class="form-control" aria-label="First Name" aria-describedby="firstName" required placeholder="Enter first name ...">
                </div>

                <label class="form-label" for="lastName">Last Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="lastName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="lastName" class="form-control" aria-label="Last Name" aria-describedby="lastName" required placeholder="Enter last name ...">
                </div>

                <label class="form-label" for="otherName">Other Name</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="otherName"><i class="fa-solid fa-user"></i> </span>
                    <input type="text" name="otherName" class="form-control" aria-label="Other Name" aria-describedby="otherName" placeholder="Enter Other name ...">
                </div>

                <label class="form-label" for="username">Username</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="username"><i class="fa-solid fa-user-tag"></i> </span>
                    <input type="text" name="username" class="form-control" aria-label="Username" aria-describedby="username" required placeholder="Enter prefered username ...">
                </div>

                <label class="form-label" for="dob">Date of Birth</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="dob"><i class="fa-solid fa-calendar"></i> </span>
                    <input type="date" name="dob" class="form-control" aria-label="Date of Birth" aria-describedby="dob" required>
                </div>

                <label class="form-label" for="gender">Gender</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="gender"><i class="fa-solid fa-venus-mars"></i> </span>
                    <select name="gender" class="form-select" aria-label="Gender" aria-describedby="gender" required>
                        <option selected="selected" disabled="disabled"> --- Select Gender --- </option>
                        <option value="F">F</option>
                        <option value="M">M</option>
                    </select>
                </div>

                <label class="form-label" for="address">Address</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="address"><i class="fa-solid fa-map-location-dot"></i> </span>
                    <input type="text" name="address" class="form-control" aria-label="Address" aria-describedby="address" required  placeholder="Enter address ...">
                </div>

                <label class="form-label" for="postalAddress">Postal Address</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="postalAddress"><i class="fa-solid fa-street-view"></i> </span>
                    <input type="text" name="postalAddress" class="form-control" aria-label="Postal Address" aria-describedby="postalAddress" required  placeholder="Enter postal address ...">
                </div>

                <label class="form-label" for="contact">Contact</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="contact"><i class="fa-solid fa-phone-volume"></i> </span>
                    <input type="text" name="contact" minlength="11" maxlength="11" class="form-control" aria-label="Contact" aria-describedby="contact" required  placeholder="Enter phone number ...">
                </div>

                <label class="form-label" for="email">Email</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="email"><i class="fa-solid fa-envelope"></i> </span>
                    <input type="text" name="email" class="form-control" aria-label="Email" aria-describedby="email" required placeholder="Enter email ...">
                </div>

                <label class="form-label" for="pass">Password</label>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="pass"><i class="fa-solid fa-lock"></i> </span>
                    <input type="password" name="password" id="password2" class="form-control" placeholder="Enter Password" aria-label="Password" aria-describedby="pass" required>
                    <i class="view_password input-group-text bi bi-eye-slash" id="togglePassword2" onclick="showPassword('password2', 'togglePassword2')"></i>
                </div>

                <br />

                <div class="input-group justify" style="justify-content: center">
                    <button type="submit" class="btn bor2 bg3 hov-btn3 cl0"> &nbsp;<i class="fa-solid fa-user-plus"></i>&nbsp; Register &nbsp;</button>
                </div>
            </form>
            <!-- End Register Form -->

            <br />

            <p class="mb-3">Already have an account? <a href="" class="text-decoration-none js-show-account"> Login </a> </p>
        </div>
    </div>
</div>

<!-- ===== End Register Account ===== -->
