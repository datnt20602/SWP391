<%--
  Created by IntelliJ IDEA.
  User: jiggnguyen
  Date: 6/5/2023
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fastkart">
    <meta name="keywords" content="Fastkart">
    <meta name="author" content="Fastkart">
    <link rel="icon" href="${pageContext.request.contextPath}/template/assets/images/favicon/1.png" type="image/x-icon">
    <title>Xác thực OTP</title>

    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/bootstrap.css">

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/font-awesome.css">

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/feather-icon.css">

    <!-- slick css -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/slick/slick.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/slick/slick-theme.css">

    <!-- Iconly css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/bulk-style.css">

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/style.css">
    <style>
        #reSendButton {
            opacity: 0.3;
            cursor: none;
        }
        .button-active {
            opacity: 1;
            cursor: pointer;
        }
    </style>
</head>

<body>

<!-- Loader Start -->
<div class="fullpage-loader">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>
<!-- Loader End -->

<!-- Header Start -->
<header class="pb-md-4 pb-0">


    <div class="top-nav top-header sticky-header">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="navbar-top">
                        <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
                                data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                        </button>
                        <a href="" class="web-logo nav-logo">
                            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"
                                 class="img-fluid blur-up lazyload" alt="">
                        </a>

                        <div class="middle-box">
                            <div class="location-box">
                                <button class="btn location-button" data-bs-toggle=""
                                        data-bs-target="#locationModal">

                                    <span class="locat-name">Chúc bạn ngày mới tốt lành.</span>

                                </button>
                            </div>

                            <div class="search-box">
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="Tìm kiếm..."
                                           aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <button class="btn" type="button" id="button-addon2">
                                        <i data-feather="search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="rightside-box">
                            <div class="search-full">
                                <div class="input-group">
                                        <span class="input-group-text">
                                            <i data-feather="search" class="font-light"></i>
                                        </span>
                                    <input type="text" class="form-control search-type" placeholder="Search here..">
                                    <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                        </span>
                                </div>
                            </div>
<%--                            <ul class="right-side-menu">--%>
<%--                                <li class="right-side">--%>
<%--                                    <div class="delivery-login-box">--%>
<%--                                        <div class="delivery-icon">--%>
<%--                                            <div class="search-box">--%>
<%--                                                <i data-feather="search"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="right-side">--%>
<%--                                    <a href="contact-us.html" class="delivery-login-box">--%>
<%--                                        <div class="delivery-icon">--%>
<%--                                            <i data-feather="phone-call"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="delivery-detail">--%>
<%--                                            <h6>24/7 Delivery</h6>--%>
<%--                                            <h5>+91 888 104 2340</h5>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="right-side">--%>
<%--                                    <a href="wishlist" class="btn p-0 position-relative header-wishlist">--%>
<%--                                        <i data-feather="heart"></i>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="right-side">--%>
<%--                                    <div class="">--%>
<%--&lt;%&ndash;                                        onhover-dropdown header-badge&ndash;%&gt;--%>
<%--                                        <button type="button" class="btn p-0 position-relative header-wishlist">--%>
<%--                                            <i data-feather="shopping-cart"></i>--%>
<%--&lt;%&ndash;                                            <span class="position-absolute top-0 start-100 translate-middle badge">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <span class="visually-hidden">unread messages</span>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </span>&ndash;%&gt;--%>
<%--                                        </button>--%>

<%--&lt;%&ndash;                                        <div class="onhover-div">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <ul class="cart-list">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <li class="product-box-contain">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="drop-cart">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="product-detail.jsp" class="drop-image">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/1.png"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                 class="blur-up lazyload" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </a>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                                        <div class="drop-contain">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <a href="product-detail.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <h5>Fantasy Crunchy Choco Chip Cookies</h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <h6><span>1 x</span> $80.58</h6>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <button class="close-button close_button">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <i class="fa-solid fa-xmark"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                                <li class="product-box-contain">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="drop-cart">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="product-detail.jsp" class="drop-image">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/2.png"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                 class="blur-up lazyload" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </a>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                                        <div class="drop-contain">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <a href="product-detail.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <h5>Peanut Butter Bite Premium Butter Cookies 600 g&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                </h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <h6><span>1 x</span> $25.68</h6>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <button class="close-button close_button">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <i class="fa-solid fa-xmark"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </ul>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                            <div class="price-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h5>Total :</h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="theme-color fw-bold">$106.58</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                            <div class="button-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="cart" class="btn btn-sm cart-button">Giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <a href="checkout.html" class="btn btn-sm cart-button theme-bg-color&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    text-white">Thanh toán</a>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li class="right-side onhover-dropdown">--%>
<%--                                    <div class="delivery-login-box">--%>
<%--                                        <div class="delivery-icon">--%>
<%--                                            <i data-feather="user"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="delivery-detail">--%>
<%--                                            <h6>Hello,</h6>--%>
<%--                                            <h5>My Account</h5>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="onhover-div onhover-div-login">--%>
<%--                                        <ul class="user-box-name">--%>
<%--                                            <c:if test="${acc == null}">--%>
<%--                                                <li class="product-box-contain">--%>
<%--                                                    <i></i>--%>
<%--                                                    <a href="login">Đăng nhập</a>--%>
<%--                                                </li>--%>

<%--                                                <li class="product-box-contain">--%>
<%--                                                    <a href="signup">Đăng kí</a>--%>
<%--                                                </li>--%>



<%--                                                <li class="product-box-contain">--%>
<%--                                                    <a href="forgotpass">Quên mật khẩu</a>--%>
<%--                                                </li>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${acc != null}">--%>
<%--                                                <li class="product-box-contain">--%>
<%--                                                    <a href="changepass">Đổi mật khẩu</a>--%>
<%--                                                </li>--%>

<%--                                                <li class="product-box-contain">--%>
<%--                                                    <a href="logout">Đăng xuất</a>--%>
<%--                                                </li>--%>
<%--                                            </c:if>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="header-nav">


                    <div class="header-nav-middle">
                        <div class="main-nav navbar navbar-expand-xl navbar-light navbar-sticky">
                            <div class="offcanvas offcanvas-collapse order-xl-2" id="primaryMenu">
                                <div class="offcanvas-header navbar-shadow">
                                    <h5>Menu</h5>
                                    <button class="btn-close lead" type="button" data-bs-dismiss="offcanvas"
                                            aria-label="Close"></button>
                                </div>
                                <div class="offcanvas-body">
                                    <ul class="navbar-nav">


                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="header-nav-right">
                        <button class="btn deal-button" data-bs-toggle="modal" data-bs-target="#deal-box">
                            <i data-feather="zap"></i>
                            <span>Giảm giá hôm nay</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->

<!-- mobile fix menu start -->
<div class="mobile-menu d-md-none d-block mobile-cart">
    <ul>
        <li class="active">
            <a href="">
                <i class="iconly-Home icli"></i>
                <span>Home</span>
            </a>
        </li>

        <li class="mobile-category">
            <a href="javascript:void(0)">
                <i class="iconly-Category icli js-link"></i>
                <span>Category</span>
            </a>
        </li>

        <li>
            <a href="search.html" class="search-box">
                <i class="iconly-Search icli"></i>
                <span>Search</span>
            </a>
        </li>

        <li>
            <a href="/ODShop/template/front-end//ODShop/template/front-end/wishlist.html" class="notifi-wishlist">
                <i class="iconly-Heart icli"></i>
                <span>My Wish</span>
            </a>
        </li>

        <li>
            <a href="cart.jsp">
                <i class="iconly-Bag-2 icli fly-cate"></i>
                <span>Cart</span>
            </a>
        </li>
    </ul>
</div>
<!-- mobile fix menu end -->

<!-- Breadcrumb Section Start -->
<section class="breadscrumb-section pt-0">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="breadscrumb-contain">
                    <h2 class="mb-2">Nhập mã OTP</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="">
                                    <i class="fa-solid fa-house"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active">Trang chủ</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- log in section start -->
<section class="log-in-section background-image-2 section-b-space">
    <div class="container-fluid-lg w-100">
        <div class="row">
            <div class="col-xxl-6 col-xl-5 col-lg-6 d-lg-block d-none ms-auto">
                <div class="image-contain">
                    <img src="${pageContext.request.contextPath}/template/assets/images/inner-page/log-in.png"
                         class="img-fluid" alt="">
                </div>
            </div>

            <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                <div class="log-in-box">
                    <div class="log-in-title">
                        <h3>Chào mừng tới cofPhe</h3>
                        <h4>Nhập mã OTP của bạn</h4>
                    </div>

                    <div class="input-box">
                        <form class="row g-4" action="validateOTP" method="post">
                            <div class="col-12">
                                <div class="form-floating theme-form-floating log-in-form">
                                    <input type="email" class="form-control" id="email" placeholder="Email Address"
                                           name="email" readonly value="${customer.getEmail()}${admin.getEmail()}${staff.getEmail()}">
                                    <label for="email">Địa chỉ email</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating theme-form-floating log-in-form">
                                    <input type="text" class="form-control" id="opt"
                                           placeholder="Opt" name="opt" maxlength="6">
                                    <label for="opt">OTP</label>
                                    <h3>${mess}</h3>

                                </div>

                            </div>

                            <div class="col-12">
                                <button class="btn btn-animation w-100 justify-content-center" name="option" value="enter" type="submit">Nhập OTP
                                </button>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-animation w-100 justify-content-center" id="reSendButton" name="option" value="sendAgain" type="submit">Gửi lại mã OTP
                                </button>
                            </div>
                        </form>
                    </div>


                    <div class="other-log-in">
                        <h6></h6>
                    </div>


                </div>
            </div>
        </div>
    </div>
</section>
<!-- log in section end -->

<!-- Footer Section Start -->
<footer class="section-t-space">
    <div class="container-fluid-lg">
        <div class="service-section">
            <div class="row g-3">
                <div class="col-12">
                    <div class="service-contain">
                        <div class="service-box">
                            <div class="service-image">
                                <img src="${pageContext.request.contextPath}/template/assets/svg/product.svg"
                                     class="blur-up lazyload" alt="">
                            </div>

                            <div class="service-detail">
                                <h5>Đồ uống chất lượng</h5>
                            </div>
                        </div>

                        <div class="service-box">
                            <div class="service-image">
                                <img src="${pageContext.request.contextPath}/template/assets/svg/delivery.svg"
                                     class="blur-up lazyload" alt="">
                            </div>

                            <div class="service-detail">
                                <h5>Miễn phí vận chuyển trong vòng 3km</h5>
                            </div>
                        </div>

                        <div class="service-box">
                            <div class="service-image">
                                <img src="${pageContext.request.contextPath}/template/assets/svg/discount.svg"
                                     class="blur-up lazyload" alt="">
                            </div>

                            <div class="service-detail">
                                <h5>Nhiều ưu đãi</h5>
                            </div>
                        </div>

                        <div class="service-box">
                            <div class="service-image">
                                <img src="${pageContext.request.contextPath}/template/assets/svg/market.svg"
                                     class="blur-up lazyload" alt="">
                            </div>

                            <div class="service-detail">
                                <h5>Phù hợp với túi tiền</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-footer section-b-space section-t-space">
            <div class="row g-md-4 g-3">
                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <div class="footer-logo">
                        <div class="theme-logo">
                            <a href="home">
                                <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"
                                     class="blur-up lazyload" alt="">
                            </a>
                        </div>

                        <div class="footer-logo-contain">
                            <p>Chúng tôi là quán cà phê mà chắc chắn bạn nên thử và trải nghiệm. Rất hân hạnh được phục vụ.</p>

                            <ul class="address">
                                <li>
                                    <i data-feather="home"></i>
                                    <a href="javascript:void(0)">Hòa Lạc, Thạch Thất, Hà Nội</a>
                                </li>
                                <li>
                                    <i data-feather="mail"></i>
                                    <a href="javascript:void(0)">cofphe@gmail.com</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-xl col-lg-2 col-sm-3">
                    <div class="footer-title">
                        <h4>Đường dẫn hữu dụng</h4>
                    </div>

                    <div class="footer-contain">
                        <ul>
                            <li>
                                <a href="home" class="text-content">Trang chủ</a>
                            </li>

                            <li>
                                <a href="contactus" class="text-content">Liên lạc</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-xl-2 col-sm-3">
                    <div class="footer-title">
                        <h4>Xem thông tin</h4>
                    </div>

                    <div class="footer-contain">
                        <ul>
                            <li>
                                <a href="cart" class="text-content">Giỏ hàng</a>
                            </li>
                            <li>
                                <a href="user" class="text-content">Tài khoản</a>
                            </li>

                            <li>
                                <a href="wishlist" class="text-content"> Wishlist</a>
                            </li>

                        </ul>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <div class="footer-title">
                        <h4>Liên lạc với chúng tôi:</h4>
                    </div>

                    <div class="footer-contact">
                        <ul>
                            <li>
                                <div class="footer-number">
                                    <i data-feather="phone"></i>
                                    <div class="contact-number">
                                        <h6 class="text-content">Hotline 24/7 :</h6>
                                        <h5>+84 376597711</h5>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <div class="footer-number">
                                    <i data-feather="mail"></i>
                                    <div class="contact-number">
                                        <h6 class="text-content">Địa chỉ email:</h6>
                                        <h5>cofphe@gmail.com</h5>
                                    </div>
                                </div>
                            </li>


                        </ul>
                    </div>
                </div>
            </div>
        </div>


    </div>
</footer>
<!-- Footer Section End -->

<!-- Tap to top start -->
<div class="theme-option">
    <div class="back-to-top">
        <a id="back-to-top" href="#">
            <i class="fas fa-chevron-up"></i>
        </a>
    </div>
</div>
<!-- Tap to top end -->

<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->
<script>
    // 30s sau moi duoc gui mail lai
    var beforeDate = new Date().getTime();

    var x = setInterval(function () {
        var now = new Date().getTime();
        var distance = now - beforeDate;

        var timeAvailable = 1000 * 30;

        if (distance >= timeAvailable) {
            clearInterval(x);
            var reSendButton = document.getElementById("reSendButton");
            reSendButton.style.opacity = 1;
            reSendButton.style.cursor = "pointer";
            reSendButton.type = "submit";
        }
    })
</script>
<!-- latest jquery-->
<script src="${pageContext.request.contextPath}/template/assets/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap js-->
<script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/popper.min.js"></script>

<!-- feather icon js-->
<script src="${pageContext.request.contextPath}/template/assets/js/feather/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/feather/feather-icon.js"></script>

<!-- Slick js-->
<script src="${pageContext.request.contextPath}/template/assets/js/slick/slick.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/slick/slick-animation.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/slick/custom_slick.js"></script>

<!-- Lazyload Js -->
<script src="${pageContext.request.contextPath}/template/assets/js/lazysizes.min.js"></script>

<!-- script js -->
<script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script>
</body>

</html>

