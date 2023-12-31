
(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div class="loader05"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: [ 'animation-duration', '-webkit-animation-duration'],
        overlay : false,
        overlayClass : 'animsition-overlay-slide',
        overlayParentElement : 'html',
        transition: function(url){ window.location.href = url; }
    });

    /*[ Back to top ]
    ===========================================================*/
    var windowH = $(window).height()/2;

    $(window).on('scroll',function(){
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display','flex');
        } else {
            $("#myBtn").css('display','none');
        }
    });

    $('#myBtn').on("click", function(){
        $('html, body').animate({scrollTop: 0}, 300);
    });


    /*==================================================================
    [ Fixed Header ]*/
    var headerDesktop = $('.container-menu-desktop');
    var wrapMenu = $('.wrap-menu-desktop');

    if($('.top-bar').length > 0) {
        var posWrapHeader = $('.top-bar').height();
    }
    else {
        var posWrapHeader = 0;
    }


    if($(window).scrollTop() > posWrapHeader) {
        $(headerDesktop).addClass('fix-menu-desktop');
        $(wrapMenu).css('top',0);
    }
    else {
        $(headerDesktop).removeClass('fix-menu-desktop');
        $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop());
    }

    $(window).on('scroll',function(){
        if($(this).scrollTop() > posWrapHeader) {
            $(headerDesktop).addClass('fix-menu-desktop');
            $(wrapMenu).css('top',0);
        }
        else {
            $(headerDesktop).removeClass('fix-menu-desktop');
            $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop());
        }
    });


    /*==================================================================
    [ Menu mobile ]*/
    $('.btn-show-menu-mobile').on('click', function(){
        $(this).toggleClass('is-active');
        $('.menu-mobile').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu-m');

    for(var i=0; i<arrowMainMenu.length; i++){
        $(arrowMainMenu[i]).on('click', function(){
            $(this).parent().find('.sub-menu-m').slideToggle();
            $(this).toggleClass('turn-arrow-main-menu-m');
        })
    }

    $(window).resize(function(){
        if($(window).width() >= 992){
            if($('.menu-mobile').css('display') == 'block') {
                $('.menu-mobile').css('display','none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }

            $('.sub-menu-m').each(function(){
                if($(this).css('display') == 'block') { console.log('hello');
                    $(this).css('display','none');
                    $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                }
            });

        }
    });


    /*==================================================================
    [ Show / hide modal search ]*/
    $('.js-show-modal-search').on('click', function(){
        $('.modal-search-header').addClass('show-modal-search');
        $(this).css('opacity','0');
    });

    $('.js-hide-modal-search').on('click', function(){
        $('.modal-search-header').removeClass('show-modal-search');
        $('.js-show-modal-search').css('opacity','1');
    });

    $('.container-search-header').on('click', function(e){
        e.stopPropagation();
    });


    /*==================================================================
    [ Isotope ]*/
    var $topeContainer = $('.isotope-grid');
    var $filter = $('.filter-tope-group');

    // filter items on button click
    $filter.each(function () {
        $filter.on('click', 'button', function () {
            var filterValue = $(this).attr('data-filter');
            $topeContainer.isotope({filter: filterValue});
        });

    });

    // init Isotope
    $(window).on('load', function () {
        var $grid = $topeContainer.each(function () {
            $(this).isotope({
                itemSelector: '.isotope-item',
                layoutMode: 'fitRows',
                percentPosition: true,
                animationEngine : 'best-available',
                masonry: {
                    columnWidth: '.isotope-item'
                }
            });
        });
    });

    var isotopeButton = $('.filter-tope-group button');

    $(isotopeButton).each(function(){
        $(this).on('click', function(){
            for(var i=0; i<isotopeButton.length; i++) {
                $(isotopeButton[i]).removeClass('how-active1');
            }

            $(this).addClass('how-active1');
        });
    });

    /*==================================================================
    [ Filter / Search product ]*/
    $('.js-show-filter').on('click',function(){
        $(this).toggleClass('show-filter');
        $('.panel-filter').slideToggle(400);

        if($('.js-show-search').hasClass('show-search')) {
            $('.js-show-search').removeClass('show-search');
            $('.panel-search').slideUp(400);
        }
    });

    $('.js-show-search').on('click',function(){
        $(this).toggleClass('show-search');
        $('.panel-search').slideToggle(400);

        if($('.js-show-filter').hasClass('show-filter')) {
            $('.js-show-filter').removeClass('show-filter');
            $('.panel-filter').slideUp(400);
        }
    });


    /*==================================================================
    [ Wishlist ]*/
    $('.js-show-wishlist').on('click',function(){
        $('.js-panel-account').removeClass('show-header-account');
        $('.js-panel-wishlist').addClass('show-header-wishlist');


        var customerID = $('.userID').text().trim();
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
    });

    $('.js-hide-wishlist').on('click',function(){
        $('.js-panel-wishlist').removeClass('show-header-wishlist');
    });

    /*==================================================================
    [ Wishlist ]*/
    $('.js-show-wishlist').on('click',function(){
        $('.js-account').removeClass('show-account');
        $('.js-wishlist').addClass('show-sidebars');
    });

    $('.js-hide-wishlist').on('click',function(){
        $('.js-wishlist').removeClass('show-sidebars');
    });

    /*==================================================================
    [ Cart ]*/
    $('.js-show-cart').on('click',function(){
        $('.js-panel-cart').addClass('show-header-cart');

        var customerID = $('.userID').text().trim();
        var sessionID = $('.session-id').text();
        // Update cart items in modal
        $.ajax({
            type: 'POST',
            url: '/get_cart_items',
            data: {
                customerID: customerID,
                sessionID: sessionID
            }
        })
            .done(function(items) {
                updateCart(items);
                $('.icon-header-noti.js-show-cart').attr('data-notify', items.length);
            })
            .fail(function() {
                console.log('Error getting cart items');
            });

    });

    $('.js-hide-cart').on('click',function(){
        $('.js-panel-cart').removeClass('show-header-cart');
    });

    /*==================================================================
    [ Cart ]*/
    $('.js-show-sidebar').on('click',function(){
        $('.js-sidebar').addClass('show-sidebar');
    });

    $('.js-hide-sidebar').on('click',function(){
        $('.js-sidebar').removeClass('show-sidebar');
    });

    /*==================================================================
    [ Account ]*/
    $('.js-show-account').on('click',function(){
        event.preventDefault();
        $('.js-panel-account').addClass('show-header-account');
        $('.js-panel-register').removeClass('show-header-account');
    });

    $('.js-hide-account').on('click',function(){
        $('.js-panel-account').removeClass('show-header-account');
    });

    /*==================================================================
    [ Account ]*/
    $('.js-show-account').on('click',function(){
        $('.js-account').addClass('show-account');
    });

    $('.js-hide-sidebar').on('click',function(){
        $('.js-account').removeClass('show-account');
    });

    /*==================================================================
    [ Register ]*/
    $('.js-show-register').on('click',function(){
        event.preventDefault();
        $('.js-panel-register').addClass('show-header-account');
        $('.js-panel-account').removeClass('show-header-account');
    });

    $('.js-hide-register').on('click',function(){
        $('.js-panel-register').removeClass('show-header-account');
    });

    /*==================================================================
    [ Register ]*/
    $('.js-show-register').on('click',function(){
        $('.js-account').addClass('show-account');
    });

    $('.js-hide-sidebar').on('click',function(){
        $('.js-account').removeClass('show-account');
    });

    /*==================================================================
    [ View Account ]*/
    $('.js-show-view-account').on('click',function(){
        event.preventDefault();
        $('.js-panel-view-account').addClass('show-header-account');
        $('.js-panel-account').removeClass('show-header-account');
    });

    $('.js-hide-view-account').on('click',function(){
        $('.js-panel-view-account').removeClass('show-header-account');
    });

    /*==================================================================
    [ View Account ]*/
    $('.js-show-view-account').on('click',function(){
        $('.js-account').addClass('show-account');
    });

    $('.js-hide-sidebar').on('click',function(){
        $('.js-account').removeClass('show-account');
    });


    /*==================================================================
    [ +/- num product ]*/
    $('.btn-num-product-down').on('click', function(){
        var numProduct = Number($(this).next().val());
        if(numProduct > 1) $(this).next().val(numProduct - 1);
    });

    $('.btn-num-product-up').on('click', function(){
        var numProduct = Number($(this).prev().val());
        $(this).prev().val(numProduct + 1);
    });

    /*==================================================================
    [ Rating ]*/
    $('.wrap-rating').each(function(){
        var item = $(this).find('.item-rating');
        var rated = -1;
        var input = $(this).find('input');
        $(input).val(0);

        $(item).on('mouseenter', function(){
            var index = item.index(this);
            var i = 0;
            for(i=0; i<=index; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for(var j=i; j<item.length; j++) {
                $(item[j]).addClass('zmdi-star-outline');
                $(item[j]).removeClass('zmdi-star');
            }
        });

        $(item).on('click', function(){
            var index = item.index(this);
            rated = index;
            $(input).val(index+1);
        });

        $(this).on('mouseleave', function(){
            var i = 0;
            for(i=0; i<=rated; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for(var j=i; j<item.length; j++) {
                $(item[j]).addClass('zmdi-star-outline');
                $(item[j]).removeClass('zmdi-star');
            }
        });
    });

    /*==================================================================
    [ Show Product Details modal1 ]*/
    $('.js-show-modal1').on('click',function(e){
        e.preventDefault();

        // Get the product details from the clicked button's data attributes
        var productID = $(this).attr('data-product-id');
        var productName = $(this).attr('data-product-name');
        var productPrice = $(this).attr('data-product-price');
        var productDescription = $(this).attr('data-product-description');
        var productMaterial = $(this).attr('data-product-material');
        var productCategory = $(this).attr('data-product-category');
        var path = "assets/img/products/";
        var productImages = [
            $(this).attr('data-product-image'),
            $(this).attr('data-product-image1'),
            $(this).attr('data-product-image2')
        ];
        var showImageClass = '.js-show-images'

        productPrice = "£" + productPrice;

        productImages = productImages.filter(function (image) {
            return image !== "0";
        });

        // Set the product details in the modal
        $('.js-name-id').text(productID);
        $('.js-name-detail').text(productName);
        $('.js-price-detail').text(productPrice);
        $('.js-description-detail').text(productDescription);

        setupGallery(productImages,path,productMaterial, productCategory, productName, showImageClass);

        $('.js-modal1').addClass('show-modal1');

    });

    $('.js-hide-modal1').on('click',function(){
        $('.js-modal1').removeClass('show-modal1');

        // Destroy Slick carousel instances
        $('.slick3').slick('unslick');
    });

})(jQuery);