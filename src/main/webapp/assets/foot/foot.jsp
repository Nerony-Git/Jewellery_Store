<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 15/08/2023
  Time: 08:08
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="assets/js/main.js"></script>
<script type="text/javascript" src="assets/js/view_password.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
        integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="assets/js/slick_custom.js"></script>
<script type="text/javascript" src="assets/js/parallax.js"></script>
<%--<script type="text/javascript">

    /* Register - Login */
    <c:if test="${not empty registrationSuccess}">
        // Check for successful registration attribute
        const registrationSuccess = ${sessionScope.registrationSuccess};

        // Show Login Sidebar if registration was successful
        if (registrationSuccess === true) {
            $('.js-panel-account').addClass('show-header-account');
            $('.js-panel-register').removeClass('show-header-account');
        } else if (registrationSuccess === false){
            $('.js-panel-register').addClass('show-header-account');
        }
    </c:if>


    <c:if test="${not empty loginStatus}">
        const loginStatus = ${sessionScope.loginStatus};
        //Show customer's account if login was successful
        if (loginStatus === true ) {
            $('.js-panel-account').addClass('show-header-account');
        } else if (loginStatus === false) {
            $('.js-panel-account').addClass('show-header-account');
        }
    </c:if>

</script>--%>
<script type="text/javascript">
  /* Register - Login - Logout */
  <c:if test="${not empty registrationSuccess}">
  const registrationSuccess = ${sessionScope.registrationSuccess};
  console.log("registrationSuccess:", registrationSuccess);

  if (registrationSuccess === true) {
    $('.js-panel-account').addClass('show-header-account');
    $('.js-panel-register').removeClass('show-header-account');
      // Automatically hide success message after 5 seconds
      setTimeout(function() {
          $('.text-success').fadeOut();
      }, 5000);
  } else if (registrationSuccess === false){
    $('.js-panel-register').addClass('show-header-account');
      // Automatically hide failure message after 5 seconds
      setTimeout(function() {
          $('.text-danger').fadeOut();
      }, 5000);
  }

  // Destroy registrationSuccess after showing the success message
  setTimeout(function() {
      <% session.removeAttribute("registrationSuccess"); %>
  }, 5000);
  </c:if>

  <c:if test="${not empty loginStatus}">
  const loginStatus = ${sessionScope.loginStatus};
  console.log("loginStatus:", loginStatus);

  if (loginStatus === true) {
    $('.js-panel-account').addClass('show-header-account');
      // Automatically hide success message after 5 seconds
      setTimeout(function() {
          $('.text-success').fadeOut();
      }, 5000);
  } else if (loginStatus === false) {
    $('.js-panel-account').addClass('show-header-account');
      // Automatically hide failure message after 5 seconds
      setTimeout(function() {
          $('.text-danger').fadeOut();
      }, 5000);
  }
  // Destroy loginStatus after showing the success message
  setTimeout(function() {
      <% session.removeAttribute("loginStatus"); %>
  }, 5000);

  </c:if>

  <c:if test="${not empty logoutStatus}">
  const logoutStatus = ${sessionScope.logoutStatus};
  console.log("logoutStatus:", logoutStatus);

  if (logoutStatus === true) {
      $('.js-panel-account').addClass('show-header-account');
      // Automatically hide success message after 5 seconds
      setTimeout(function() {
          $('.text-success').fadeOut();
      }, 5000);
  }
  // Destroy loginStatus after showing the success message
  setTimeout(function() {
      <% session.removeAttribute("logoutStatus"); %>
  }, 5000);

  </c:if>

  <c:if test="${not empty updateSuccess}">
  const updateSuccess = ${sessionScope.updateSuccess};
  console.log("updateSuccess:", updateSuccess);

  if (updateSuccess === true) {
      $('.js-panel-account').removeClass('show-header-account');
      $('.js-panel-account').addClass('show-header-account');
      // Automatically hide success message after 5 seconds
      setTimeout(function() {
          $('.text-success').fadeOut();
      }, 5000);
  } else if (updateSuccess === false) {
      $('.js-panel-account').addClass('show-header-account');
      // Automatically hide failure message after 5 seconds
      setTimeout(function() {
          $('.text-danger').fadeOut();
      }, 5000);
  }
  // Destroy updateSuccess after showing the success message
  setTimeout(function() {
      <% session.removeAttribute("updateSuccess"); %>
  }, 5000);

  </c:if>
</script>
