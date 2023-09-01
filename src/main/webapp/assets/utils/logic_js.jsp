<%--
  Created with IntelliJ IDEA.
  Author: George Amuzu
  User: gnamu
  Date: 12/08/2023
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
  $(".js-select2").each(function(){
    $(this).select2({
      minimumResultsForSearch: 20,
      dropdownParent: $(this).next('.dropDownSelect2')
    });
  });


  $('.parallax100').parallax100();


  $('.gallery-lb').each(function() { // the containers for all your galleries
    $(this).magnificPopup({
      delegate: 'a', // the selector for gallery item
      type: 'image',
      gallery: {
        enabled:true
      },
      mainClass: 'mfp-fade'
    });
  });


  $('.js-addwish-b2').on('click', function(e){
    e.preventDefault();
  });

  $('.js-addwish-b2').each(function(){
      $(this).on('click', function (){
          //Check if the customer session attribute is set
          if (<%= session.getAttribute("customer") != null%>) {
              var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
              var productID = $(this).parent().parent().find('.js-productID-b2').html();
              var customerID = $('.userID').text().trim();

              addToWishlist(productID, nameProduct, customerID);
              $(this).addClass('js-addedwish-b2');
              $(this).off('click');

          } else {
              //trigger the click event of the js-show-account button
              $('.js-show-account').trigger('click');
          }
      });

  });

  $('.js-addwish-detail').each(function(){
    var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

    $(this).on('click', function(){

        //Check if the customer session attribute is set
        if (<%= session.getAttribute("customer") != null%>) {
            var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
            var productID = $('.js-name-id').text().trim();
            var customerID = $('.userID').text().trim();

            addToWishlist(productID, nameProduct, customerID);
            $(this).addClass('js-addedwish-detail');
            $(this).off('click');

        } else {
            $('.js-hide-modal1').trigger('click');
            $('.js-show-account').trigger('click');
        }

    });
  });

  $('.js-addwish-details').each(function(){
      var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

      $(this).on('click', function(){

          //Check if the customer session attribute is set
          if (<%= session.getAttribute("customer") != null%>) {
              var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
              var productID = $('.js-name-id').text().trim();
              var customerID = $('.userID').text().trim();

              addToWishlist(productID, nameProduct, customerID);
              $(this).addClass('js-addedwish-detail');
              $(this).off('click');

          } else {
              $('.js-show-account').trigger('click');
          }

      });
  });

  /*---------------------------------------------*/

  $('.js-addcart-detail').each(function() {
      var $productContainer = $(this).closest('.js-product-details');
      var customerID = $('.userID').text().trim();
      var sessionID = $('.session-id').text();

      $(this).on('click', function() {

          var quantity = $productContainer.find('.num-product').val();
          var nameProduct = $productContainer.find('.js-name-detail').html();
          var productID = $productContainer.find('.js-name-id').html().trim();

          addToCart(productID, customerID, sessionID, nameProduct, quantity);
      });
  });



  $('.js-pscroll').each(function(){
    $(this).css('position','relative');
    $(this).css('overflow','hidden');
    var ps = new PerfectScrollbar(this, {
      wheelSpeed: 1,
      scrollingThreshold: 1000,
      wheelPropagation: false,
    });

    $(window).on('resize', function(){
      ps.update();
    })
  });

  $(document).ready(function () {
      var customerID = $('.userID').text().trim();
      var sessionID = $('.session-id').text();

      $.ajax({
          type: 'GET',
          url: '/get_wishlist_count',
          data: {customerID: customerID}
      })
          .done(function (response) {
              $(".js-show-wishlist").attr("data-notify", response.count);
          });

      $.ajax({
          type: 'GET',
          url: '/get_cart_count',
          data: {
              customerID: customerID,
              sessionID: sessionID
          }
      })
          .done(function (response) {
              $(".js-show-cart").attr("data-notify", response.count);
          });
  });

  // Event handler for removing wishlist items
  $('.header-wishlist-wrapitem').on('click', '.header-wishlist-item', function() {
      var $item = $(this); // The clicked <li> element
      var productID = $item.find('.header-wishlist-item-id').html();
      var customerID = $('.userID').text().trim();

      // Perform AJAX request to remove item from wishlist
      $.ajax({
          type: 'POST',
          url: '/remove_wishlist_item',
          data: {
              customerID: customerID,
              productID: productID
          }
      })
          .done(function(response) {
              // Success: Item removed from wishlist
              $item.remove(); // Remove the item from the DOM

              // Trigger the click event of the js-show-wishlist button
              $('.js-hide-wishlist').trigger('click');
              $('.js-show-wishlist').trigger('click');

              // Update the wishlist count in the header
              /*var newCount = parseInt($('.icon-header-noti.js-show-wishlist').attr('data-notify')) - 1;
              $('.icon-header-noti.js-show-wishlist').attr('data-notify', newCount);*/
          })
          .fail(function() {
              // Error handling if needed
          });
  });

  // Event handler for removing cart items
  $('.header-cart-wrapitem').on('click', '.header-cart-item', function () {
      var $item = $(this);
      var productID = $item.find('.header-cart-item-id').html();
      var customerID = $('.userID').text().trim();
      var sessionID = $('.session-id').text();

      $.ajax({
          type: 'POST',
          url: '/remove_cart_item',
          data: {
              productID: productID,
              customerID: customerID,
              sessionID: sessionID
          }
      })
          .done(function (response) {
              $item.remove();

              $('.js-hide-cart').trigger('click');
              $('.js-show-cart').trigger('click');

              /*var newCartCount = parseInt($('.icon-header-noti.js-show-cart').attr('data-notify')) - 1;
              $('.icon-header-noti.js-show-cart').attr('data-notify', newCartCount);*/
          })
          .fail(function () {

          });
  });


  function updateWishlist(items) {
      // Clear existing items
      $('.header-wishlist-wrapitem').empty();

      // Add new items
      $.each(items, function(index, item) {
          var wishlistItem = '<li class="header-wishlist-item flex-w flex-t m-b-12">' +
              '<div class="header-wishlist-item-img">' +
              '<p class="header-wishlist-item-id" style="display: none">' + item.productID + '</p>' +
              '<img src="' + item.productImagePath + '" alt="' + item.productName + '">' +
              '</div>' +
              '<div class="header-wishlist-item-txt p-t-8">' +
              '<a href="#" class="header-wishlist-item-name m-b-18 hov-cl1 trans-04">' +
              item.productName +
              '</a>' +
              '<span class="header-wishlist-item-info">' +
              '£' + item.productPrice.toFixed(2) +
              '</span>' +
              '</div>' +
              '</li>';
          $('.header-wishlist-wrapitem').append(wishlistItem);
      });
  }

  function updateCart(items) {
      // Clear existing items
      $('.header-cart-wrapitem').empty();

      // Initialize total value
      var total = 0;

      //Add new items
      $.each(items, function (index, item){
          var cartlistItem = '<li class="header-cart-item flex-w flex-t m-b-12" xmlns="http://www.w3.org/1999/html">' +
              '<div class="header-cart-item-img">' +
              '<p class="header-cart-item-id" style="display: none">' + item.productID + '</p>' +
              '<img src="' + item.productImagePath + '" alt="' + item.productName + '">' +
              '</div>' +
              '<div class="header-cart-item-txt p-t-8">' +
              '<a href="<%=request.getContextPath()%>/product_detail?id=' + item.productID + '" class="header-cart-item-name m-b-18 hov-cl1 trans-04">' +
                  item.productName +
              '</a>' +
              '<span class="header-cart-item-info">' +
              item.quantity + '&nbsp; &nbsp; x &nbsp; &nbsp; £ ' + item.productPrice.toFixed(2) +
              '</span>' +
              '</div>' +
              '</li>';
          $('.header-cart-wrapitem').append(cartlistItem);

          // Update total by adding productPrice * quantity
          total += item.productPrice * item.quantity;

      });

      // Format the total with a thousand separator and update the "header-cart-total" div
      var formattedTotal = total.toLocaleString(undefined, { maximumFractionDigits: 2 });
      $('.header-cart-total').html('Total: £' + formattedTotal);
      /*$('.header-cart-total').html('Total: £' + total.toFixed(2));*/
  }

  function addToWishlist(productID, nameProduct, customerID) {
      $.ajax({
          type: 'POST',
          url: '/add_wishlist',
          data: {
              id: productID,
              customerID: customerID
          }
      })
          .done(function (response) {
              // Success: Product added to wishlist
              swal(nameProduct, "has been added to your wishlist!", "success");

              // Update wishlist count in header
              /*var wishlistCount = parseInt($('.icon-header-noti.js-show-wishlist').attr('data-notify')) + 1;
              $('.icon-header-noti.js-show-wishlist').attr('data-notify', wishlistCount);*/

              // Update wishlist items in modal
              $.ajax({
                  type: 'POST',
                  url: '/get_wishlist_items',
                  data: {
                      customerID: customerID
                  }
              })
                  .done(function(items) {
                      updateWishlist(items);
                      $('.icon-header-noti.js-show-wishlist').attr('data-notify', items.length);
                  })
                  .fail(function() {
                      console.log('Error getting wishlist items');
                  });
          })
          .fail(function () {
              swal(nameProduct, "already in your wishlist!", "error");
          })
  }

  function addToCart(productID, customerID, sessionID, nameProduct, quantity) {
      $.ajax({
          type: 'POST',
          url: '/add_to_cart',
          data: {
              productID: productID,
              customerID: customerID,
              sessionID: sessionID,
              quantity: quantity
          }
      })
          .done(function (response) {
              //Success Product added to Cart
              swal(nameProduct, "Added to cart!", "success");

              //Update cart count in header
              /*var cartCount = parseInt($('.icon-header-noti.js-show-cart').attr('data-notify')) + 1;
              $('.icon-header-noti.js-show-cart').attr('data-notify', cartCount);*/

              //Update cart items in modal
              $.ajax({
                  type: 'POST',
                  url: '/get_cart_items',
                  data: {
                      customerID: customerID,
                      sessionID: sessionID
                  }
              })
                  .done(function (items) {
                      updateCart(items);
                      $('.icon-header-noti.js-show-cart').attr('data-notify', items.length);
                  })
                  .fail(function () {
                      console.log('Error getting cart items');
                  });
          })
          .fail(function () {
              swal(nameProduct, "Failed to add item to cart!", "error");
          })
  }

  function cartUpdate(productID, customerID, sessionID, quantity) {
      $.ajax({
          type: 'POST',
          url: '/update_cart',
          data: {
              productID: productID,
              customerID: customerID,
              sessionID: sessionID,
              quantity: quantity
          }
      })
          .done(function (response) {
              //Update cart count in header
              /*var cartCount = parseInt($('.icon-header-noti.js-show-cart').attr('data-notify')) + 1;
              $('.icon-header-noti.js-show-cart').attr('data-notify', cartCount);*/

              //Update cart items in modal
              $.ajax({
                  type: 'POST',
                  url: '/get_cart_items',
                  data: {
                      customerID: customerID,
                      sessionID: sessionID
                  }
              })
                  .done(function (items) {
                      updateCart(items);
                      $('.icon-header-noti.js-show-cart').attr('data-notify', items.length);
                  })
                  .fail(function () {
                      console.log('Error getting cart items');
                  });
          })
          .fail(function () {

          })
  }

  function setupGallery(productImages, path, productMaterial, productCategory, productName, showImagesClass) {
      // Set up the gallery slider with thumbnails and images
      var galleryHtml = '';
      for (var i = 0; i < productImages.length; i++) {
          if (productImages[i]){
              galleryHtml += '<div class="item-slick3" data-thumb="' + path + productMaterial + '/' + productCategory + '/' + productImages[i] + '.jpg">\n' +
                  '                  <div class="wrap-pic-w pos-relative">\n' +
                  '                    <img src="' + path + productMaterial + '/' + productCategory + '/' + productImages[i] + '.jpg" alt="' + productName + '">\n' +
                  '\n' +
                  '                    <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="' + path + productMaterial + '/' + productCategory + '/' + productImages[i] + '.jpg">\n' +
                  '                      <i class="fa fa-expand"></i>\n' +
                  '                    </a>\n' +
                  '                  </div>\n' +
                  '                </div>\n';
          }
      }

      $(showImagesClass).html(galleryHtml);

      // Initialize the carousel after dynamically adding the content
      $('.wrap-slick3').each(function() {
          $(this).find('.slick3').slick({
              slidesToShow: 1,
              slidesToScroll: 1,
              fade: true,
              infinite: true,
              autoplay: false,
              autoplaySpeed: 6000,

              arrows: true,
              appendArrows: $(this).find('.wrap-slick3-arrows'),
              prevArrow: '<button class="arrow-slick3 prev-slick3"><i class="fa fa-angle-left" aria-hidden="true"></i></button>',
              nextArrow: '<button class="arrow-slick3 next-slick3"><i class="fa fa-angle-right" aria-hidden="true"></i></button>',

              dots: true,
              appendDots: $(this).find('.wrap-slick3-dots'),
              dotsClass: 'slick3-dots',
              customPaging: function(slick, index) {
                  var portrait = $(slick.$slides[index]).data('thumb');
                  return '<img src="' + portrait + '"/><div class="slick3-dot-overlay"></div>';
              },
          });
      });
  }

  function updateSubtotal() {
      var subtotal = 0;
      $('.table_row').each(function () {
          var total = parseFloat($(this).find('.js-product-total').text().replace('£', ''));
          subtotal += total;
      });

      var totalAmountInput = $('.js-cart-totals');
      totalAmountInput.val(subtotal.toFixed(2));
      $('.js-sub-total').text('£' + subtotal.toFixed(2));
  }

  $(document).ready(function () {
      $('#checkoutLink').click(function (event) {
          event.preventDefault();

          // Get the customer object from the session
          var customerID = $('.userID').text().trim();

          // Check if the session attribute "customer" is set
          if (customerID) {
              window.location.href = $(this).attr('href');
          } else {
              $('.js-show-account').trigger('click');
          }
      });

      $('#checkout-link').click(function (event) {
          event.preventDefault();

          // Get the customer object from the session
          var customerID = $('.userID').text().trim();

          // Check if the session attribute "customer" is set
          if (customerID) {
              window.location.href = $(this).attr('href');
          } else {
              $('.js-show-account').trigger('click');
          }
      });
  });


</script>

