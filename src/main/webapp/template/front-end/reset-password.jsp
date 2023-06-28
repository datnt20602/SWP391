<%--
  Created by IntelliJ IDEA.
  User: jiggnguyen
  Date: 6/5/2023
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Change Password</title>

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


                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="header-nav">

                </div>
            </div>
        </div>
    </div></div>
</header>
<!-- Header End -->

<!-- mobile fix menu start -->
<div class="mobile-menu d-md-none d-block mobile-cart">
    <ul>
        <li class="active">
            <a href="home">
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
            <a href="wishlist.jsp" class="notifi-wishlist">
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
                    <h2>Thay đổi mật khẩu</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="home">
                                    <i class="fa-solid fa-house"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active">Thay đổi mật khẩu</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- log in section start -->
<section class="log-in-section section-b-space">
    <div class="container-fluid-lg w-100">
        <div class="row">
            <div class="col-xxl-6 col-xl-5 col-lg-6 d-lg-block d-none ms-auto">
                <div class="image-contain">
                    <img src="${pageContext.request.contextPath}/template/assets/images/inner-page/sign-up.png" class="img-fluid" alt="">
                </div>
            </div>

            <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                <div class="log-in-box">
                    <div class="log-in-title">
                        <h3>Chào mừng tới cofPhe</h3>
                        <h4>Thay đổi mật khẩu</h4>
                    </div>

                    <div class="input-box">
                        <form class="row g-4" action="resetpassword" method="post">

                            <div class="col-12">
                                <div class="form-floating theme-form-floating">
                                    <input type="password" class="form-control" id="newpassword"
                                           placeholder="New Password" name = "newpass" required>
                                    <label for="newpassword">Mật khẩu mới</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating theme-form-floating">
                                    <input type="password" class="form-control" id="renewpassword"
                                           placeholder="Re-New Password" name = "renewpass" required>
                                    <label for="renewpassword">Nhập lại mật khẩu mới</label>
                                </div>
                                <h4>${mess}</h4>
                            </div>



                            <div class="col-12">
                                <button class="btn btn-animation w-100" type="submit">Đặt lại mật khẩu</button>
                            </div>
                        </form>
                    </div>

                    <div class="sign-up-box">
                        <h4>Về Đăng nhập.</h4>
                        <a href="login">Đăng nhập</a>
                    </div>
                </div>
            </div>

            <div class="col-xxl-7 col-xl-6 col-lg-6"></div>

        </div>
    </div>
</section>
<!-- log in section end -->
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
                                <a href="/ODShop/template/front-end/wishlist.html" class="text-content"> Wishlist</a>
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
</body>

</html>