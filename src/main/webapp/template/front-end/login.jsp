<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <title>Đăng nhập</title>

    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/bootstrap.css">

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/font-awesome.css">

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/feather-icon.css">

    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/slick/slick-theme.css">

    <!-- Iconly css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/bulk-style.css">

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/style.css">
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
                            <a href="home" class="web-logo nav-logo">
                                <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png" class="img-fluid blur-up lazyload" alt="">
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
                                        <input type="text" class="form-control search-type" placeholder="Tìm kiếm">
                                        <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                        </span>
                                    </div>
                                </div>
                                <ul class="right-side-menu">
                                    <li class="right-side">
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <div class="search-box">
                                                    <i data-feather="search"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="right-side">
                                        <a href="contact-us.html" class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="phone-call"></i>
                                            </div>
                                            <div class="delivery-detail">
                                                <h6>24/7 Delivery</h6>
                                                <h5>+91 888 104 2340</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="right-side">
                                        <a href="" class="btn p-0 position-relative header-wishlist">
                                            <i data-feather="heart"></i>
                                        </a>
                                    </li>
                                    <li class="right-side">
                                        <div class="onhover-dropdown header-badge">
                                            <button type="button" class="btn p-0 position-relative header-wishlist">
                                                <i data-feather="shopping-cart"></i>
<%--                                                <span class="position-absolute top-0 start-100 translate-middle badge">2--%>
<%--                                                    <span class="visually-hidden">unread messages</span>--%>
<%--                                                </span>--%>
                                            </button>

<%--                                            <div class="onhover-div">--%>
<%--                                                <ul class="cart-list">--%>
<%--                                                    <li class="product-box-contain">--%>
<%--                                                        <div class="drop-cart">--%>
<%--                                                            <a href="product-detail.jsp" class="drop-image">--%>
<%--                                                                <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/1.png"--%>
<%--                                                                    class="blur-up lazyload" alt="">--%>
<%--                                                            </a>--%>

<%--                                                            <div class="drop-contain">--%>
<%--                                                                <a href="product-detail.jsp">--%>
<%--                                                                    <h5>Fantasy Crunchy Choco Chip Cookies</h5>--%>
<%--                                                                </a>--%>
<%--                                                                <h6><span>1 x</span> $80.58</h6>--%>
<%--                                                                <button class="close-button close_button">--%>
<%--                                                                    <i class="fa-solid fa-xmark"></i>--%>
<%--                                                                </button>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </li>--%>

<%--                                                    <li class="product-box-contain">--%>
<%--                                                        <div class="drop-cart">--%>
<%--                                                            <a href="product-detail.jsp" class="drop-image">--%>
<%--                                                                <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/2.png"--%>
<%--                                                                    class="blur-up lazyload" alt="">--%>
<%--                                                            </a>--%>

<%--                                                            <div class="drop-contain">--%>
<%--                                                                <a href="product-detail.jsp">--%>
<%--                                                                    <h5>Peanut Butter Bite Premium Butter Cookies 600 g--%>
<%--                                                                    </h5>--%>
<%--                                                                </a>--%>
<%--                                                                <h6><span>1 x</span> $25.68</h6>--%>
<%--                                                                <button class="close-button close_button">--%>
<%--                                                                    <i class="fa-solid fa-xmark"></i>--%>
<%--                                                                </button>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </li>--%>
<%--                                                </ul>--%>

<%--                                                <div class="price-box">--%>
<%--                                                    <h5>Tổng :</h5>--%>
<%--                                                    <h4 class="theme-color fw-bold">$106.58</h4>--%>
<%--                                                </div>--%>

<%--                                                <div class="button-group">--%>
<%--                                                    <a href="cart.jsp" class="btn btn-sm cart-button">Giỏ hàng</a>--%>
<%--&lt;%&ndash;                                                    <a href="checkout.html" class="btn btn-sm cart-button theme-bg-color&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    text-white">Thanh toán</a>&ndash;%&gt;--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </li>
                                    <li class="right-side onhover-dropdown">
                                        <div class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="user"></i>
                                            </div>
                                            <div class="delivery-detail">
                                                <h6>Hello,</h6>
                                                <h5>My Account</h5>
                                            </div>
                                        </div>

                                        <div class="onhover-div onhover-div-login">
                                            <ul class="user-box-name">
                                                <li class="product-box-contain">
                                                    <i></i>
                                                    <a href="login">Đăng nhập</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="signup">Đăng kí</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="forgotpass">Quên mật khẩu</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
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
                <a href="home.jsp">
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
                <a href="wishlist" class="notifi-wishlist">
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
                        <h2 class="mb-2">Đăng nhập</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="home">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active">Đăng nhập</li>
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
                        <img src="${pageContext.request.contextPath}/template/assets/images/inner-page/log-in.png" class="img-fluid" alt="">
                    </div>
                </div>

                <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                    <div class="log-in-box">
                        <div class="log-in-title">
                            <h3>Chào mừng tới cofPhe</h3>
                            <h4>Đăng nhập vào tài khoản của bạn</h4>
                            <h4>${resetmess}</h4>
                        </div>

                        <div class="input-box">
                            <form class="row g-4" action="login" method="post">
                                <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="email" class="form-control" id="email" placeholder="Địa chỉ email" name="Username">
                                        <label for="email">Địa chỉ email</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating theme-form-floating log-in-form">
                                        <input type="password" class="form-control" id="password"
                                            placeholder="Mật khẩu" name="Password">
                                        <label for="password">Mật khẩu</label>
                                        <h3>${mess}</h3>

                                    </div>

                                </div>

                                <div class="col-12">
                                    <div class="forgot-box">
                                        <div class="form-check ps-0 m-0 remember-box">
                                            <input class="checkbox_animated check-box" type="checkbox"
                                                id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">Ghi nhớ đăng nhập</label>
                                        </div>
                                        <a href="forgotpass" class="forgot-password">Quên mật khẩu ?</a>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <button class="btn btn-animation w-100 justify-content-center" type="submit">Đăng nhập
                                    </button>
                                </div>
                            </form>
                        </div>





                        <div class="other-log-in">
                            <h6></h6>
                        </div>

                        <div class="sign-up-box">
                            <h4>Không có tài khoản?</h4>
                            <a href="signup">Đăng kí</a>
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
                                    <a href="about-us.html" class="text-content">Về chúng tôi</a>
                                </li>

                                <li>
                                    <a href="contact-us.html" class="text-content">Liên lạc</a>
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
                                    <a href="order-success.html" class="text-content">Bạn đã mua</a>
                                </li>
                                <li>
                                    <a href="user-dashboard.html" class="text-content">Tài khoản</a>
                                </li>

                                <li>
                                    <a href="wishlist" class="text-content"> Wishlist</a>
                                </li>
                                <li>
                                    <a href="faq.html" class="text-content">FAQ</a>
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
<h1>${alertAccount}</h1>
<script>
    <c:if test="${alertAccount != null}">
        alert("${alertAccount}");
        <% session.removeAttribute("alertAccount"); %>
    </c:if>
</script>
</body>

</html>