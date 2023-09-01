<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 13/08/2023
  Time: 08:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
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
      <div class="flex-w flex-tr">
        <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
          <form>
            <h4 class="mtext-105 cl2 txt-center p-b-30">
              Send Us A Message
            </h4>

            <div class="bor8 m-b-20 how-pos4-parent">
              <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="Your Email Address">
              <img class="how-pos4 pointer-none" src="assets/images/icons/icon-email.png" alt="Email Icon">
            </div>

            <div class="bor8 m-b-30">
              <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="How Can We Help?"></textarea>
            </div>

            <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
              Submit
            </button>
          </form>
        </div>

        <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
          <div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

            <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Address
							</span>

              <p class="stext-115 cl6 size-213 p-t-18">
                Roberts Way, Hatfield, Hertfordshire, AL109AB
              </p>
            </div>
          </div>

          <div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

            <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Lets Talk
							</span>

              <p class="stext-115 cl1 size-213 p-t-18">
                +440706157895
              </p>
            </div>
          </div>

          <div class="flex-w w-full">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

            <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Sale Support
							</span>

              <p class="stext-115 cl1 size-213 p-t-18">
                contact@example.com
              </p>
            </div>
          </div>
        </div>
      </div>
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
