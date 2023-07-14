<%@ page import="Model.Product" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Product Detail</title>

    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/bootstrap.css">

    <!-- wow css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/animate.min.css"/>

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
                            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"
                                 class="img-fluid blur-up lazyload" alt="">
                        </a>

                        <div class="middle-box">
                            <div class="location-box">
                                <button class="btn location-button" data-bs-toggle="modal"
                                        data-bs-target="#locationModal">
                                        <span class="location-arrow">
                                            <i data-feather="map-pin"></i>
                                        </span>
                                    <span class="locat-name">Vị trí của bạn</span>
                                    <i class="fa-solid fa-angle-down"></i>
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
                                    <a href="wishlist" class="btn p-0 position-relative header-wishlist">
                                        <i data-feather="heart"></i>
                                    </a>
                                </li>
                                <li class="right-side">
                                    <div class="onhover-dropdown header-badge">
                                        <button type="button" class="btn p-0 position-relative header-wishlist">
                                            <i data-feather="shopping-cart"></i>
                                            <span class="position-absolute top-0 start-100 translate-middle badge">2
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>
                                        </button>

                                        <div class="onhover-div">
                                            <ul class="cart-list">
                                                <li class="product-box-contain">
                                                    <div class="drop-cart">
                                                        <a href="product-detail.jsp" class="drop-image">
                                                            <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/1.png"
                                                                 class="blur-up lazyload" alt="">
                                                        </a>

                                                        <div class="drop-contain">
                                                            <a href="product-detail.jsp">
                                                                <h5>Fantasy Crunchy Choco Chip Cookies</h5>
                                                            </a>
                                                            <h6><span>1 x</span> $80.58</h6>
                                                            <button class="close-button close_button">
                                                                <i class="fa-solid fa-xmark"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="product-box-contain">
                                                    <div class="drop-cart">
                                                        <a href="product-detail.jsp" class="drop-image">
                                                            <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/2.png"
                                                                 class="blur-up lazyload" alt="">
                                                        </a>

                                                        <div class="drop-contain">
                                                            <a href="product-detail.jsp">
                                                                <h5>Peanut Butter Bite Premium Butter Cookies 600 g
                                                                </h5>
                                                            </a>
                                                            <h6><span>1 x</span> $25.68</h6>
                                                            <button class="close-button close_button">
                                                                <i class="fa-solid fa-xmark"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>

                                            <div class="price-box">
                                                <h5>Total :</h5>
                                                <h4 class="theme-color fw-bold">$106.58</h4>
                                            </div>

                                            <div class="button-group">
                                                <a href="cart.jsp" class="btn btn-sm cart-button">View Cart</a>
                                                <a href="checkout.html" class="btn btn-sm cart-button theme-bg-color
                                                    text-white">Checkout</a>
                                            </div>
                                        </div>
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
                                            <c:if test="${acc == null}">
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
                                            </c:if>
                                            <c:if test="${acc != null}">
                                                <li class="product-box-contain">
                                                    <a href="changepass">Đổi mật khẩu</a>
                                                </li>

                                                <li class="product-box-contain">
                                                    <a href="logout">Đăng xuất</a>
                                                </li>
                                            </c:if>
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

    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="header-nav">


                    <div class="header-nav-middle">

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
            <a href="admin-home.jsp">
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
<%
    Product product = (Product) request.getAttribute("product");
%>
<section class="breadscrumb-section pt-0">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="breadscrumb-contain">
                    <h2><%=product.getProduct_name()%>
                    </h2>
                    <nav>
                        <!-- Breadcrumb Section Start -->
                        <section class="breadscrumb-section pt-0">
                            <div class="container-fluid-lg">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="breadscrumb-contain">
                                            <h2><%=product.getProduct_name()%>
                                            </h2>
                                            <nav>

                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Breadcrumb Section End -->

                        <!-- Product Left Sidebar Start -->
                        <section class="product-section">
                            <div class="container-fluid-lg">
                                <div class="row">
                                    <div class="col-xxl-9 col-xl-8 col-lg-7 wow fadeInUp">
                                        <div class="row g-4">
                                            <div class="col-xl-6 wow fadeInUp">
                                                <div class="product-left-box">
                                                    <div class="row g-2">
                                                        <div class="col-xxl-10 col-lg-12 col-md-10 order-xxl-2 order-lg-1 order-md-2">
                                                            <div class="product-main-2 no-arrow">
                                                                <div>
                                                                    <div class="slider-image">
                                                                        <img src="<%= product.getImage()%>" id=""
                                                                             alt="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                                                <div class="right-box-contain">
                                                    <h6 class="offer-top">30% Off</h6>
                                                    <h2 class="name"><%= product.getProduct_name()%>
                                                    </h2>
                                                    <div class="price-rating">
                                                        <h3 class="theme-color price">$49.50
                                                            <del class="text-content"><%=product.getPrice()%>
                                                            </del>
                                                            <span
                                                                    class="offer theme-color">(8% off)</span></h3>
                                                        <div class="product-rating custom-rate">
                                                            <ul class="rating">
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star" class="fill"></i>
                                                                </li>
                                                                <li>
                                                                    <i data-feather="star"></i>
                                                                </li>
                                                            </ul>
                                                            <span class="review">? đánh giá</span>
                                                        </div>
                                                    </div>
                                                    <!-- Product Left Sidebar Start -->
                                                    <section class="product-section">
                                                        <div class="container-fluid-lg">
                                                            <div class="row">
                                                                <div class="col-xxl-9 col-xl-8 col-lg-7 wow fadeInUp">
                                                                    <div class="row g-4">
                                                                        <div class="col-xl-6 wow fadeInUp">
                                                                            <div class="product-left-box">
                                                                                <div class="row g-2">
                                                                                    <div class="col-xxl-10 col-lg-12 col-md-10 order-xxl-2 order-lg-1 order-md-2">
                                                                                        <div class="product-main-2 no-arrow">
                                                                                            <div>
                                                                                                <div class="slider-image">
                                                                                                    <img src="<%= product.getImage()%>"
                                                                                                         id="img-1"
                                                                                                         alt=""
                                                                                                         width="514"
                                                                                                         height="600">
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xl-6 wow fadeInUp"
                                                                             data-wow-delay="0.1s">
                                                                            <div class="right-box-contain">
                                                                                <h6 class="offer-top">30% Off</h6>
                                                                                <h2 class="name"><%= product.getProduct_name()%>
                                                                                </h2>
                                                                                <div class="price-rating">
                                                                                    <h3 class="theme-color price">$49.50
                                                                                        <del class="text-content"><%=product.getPrice()%>
                                                                                        </del>
                                                                                        <span
                                                                                                class="offer theme-color">(8% off)</span>
                                                                                    </h3>
                                                                                    <div class="product-rating custom-rate">
                                                                                        <ul class="rating">
                                                                                            <li>
                                                                                                <i data-feather="star"
                                                                                                   class="fill"></i>
                                                                                            </li>
                                                                                            <li>
                                                                                                <i data-feather="star"
                                                                                                   class="fill"></i>
                                                                                            </li>
                                                                                            <li>
                                                                                                <i data-feather="star"
                                                                                                   class="fill"></i>
                                                                                            </li>
                                                                                            <li>
                                                                                                <i data-feather="star"
                                                                                                   class="fill"></i>
                                                                                            </li>
                                                                                            <li>
                                                                                                <i data-feather="star"></i>
                                                                                            </li>
                                                                                        </ul>
                                                                                        <span class="review">? đánh giá</span>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="procuct-contain">
                                                                                    <p>
                                                                                        <%=product.getDescribe()%>>
                                                                                    </p>
                                                                                </div>
                                                                                <div class="time deal-timer product-deal-timer mx-md-0 mx-auto"
                                                                                     id="clockdiv-1"
                                                                                     data-hours="1" data-minutes="2"
                                                                                     data-seconds="3">
                                                                                    <div class="product-title">
                                                                                        <h4>Hurry up! Sales Ends In</h4>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <div class="counter d-block">
                                                                                                <div class="days d-block">
                                                                                                    <h5></h5>
                                                                                                </div>
                                                                                                <h6>Days</h6>
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="counter d-block">
                                                                                                <div class="hours d-block">
                                                                                                    <h5></h5>
                                                                                                </div>
                                                                                                <h6>Hours</h6>
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="counter d-block">
                                                                                                <div class="minutes d-block">
                                                                                                    <h5></h5>
                                                                                                </div>
                                                                                                <h6>Min</h6>
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="counter d-block">
                                                                                                <div class="seconds d-block">
                                                                                                    <h5></h5>
                                                                                                </div>
                                                                                                <h6>Sec</h6>
                                                                                            </div>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                                <form>

                                                                                    <div class="note-box product-packege">
                                                                                        <div class="cart_qty qty-box product-qty">
                                                                                            <div class="input-group">
                                                                                                <button type="button"
                                                                                                        class="qty-right-plus"
                                                                                                        data-type="plus"
                                                                                                        data-field="">
                                                                                                    <i class="fa fa-plus"
                                                                                                       aria-hidden="true"></i>
                                                                                                </button>
                                                                                                <input class="form-control input-number qty-input"
                                                                                                       type="text"
                                                                                                       name="quantity"
                                                                                                       value="0">
                                                                                                <button type="button"
                                                                                                        class="qty-left-minus"
                                                                                                        data-type="minus"
                                                                                                        data-field="">
                                                                                                    <i class="fa fa-minus"
                                                                                                       aria-hidden="true"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>

                                                                                        <button onclick="location.href = 'cart';"
                                                                                                class="btn btn-md bg-dark cart-button text-white w-100">
                                                                                            Thêm vào giỏ hàng
                                                                                        </button>
                                                                                    </div>
                                                                                </form>

                                                                                    <div class="buy-box">
                                                                                        <a href="wishlist">
                                                                                            <i data-feather="heart"></i>
                                                                                            <span>Thêm vào wishlist</span>
                                                                                        </a>
                                                                                    </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-12">
                                                                            <div class="product-section-box">
                                                                                <ul class="nav nav-tabs custom-nav"
                                                                                    id="myTab" role="tablist">
                                                                                    <li class="nav-item"
                                                                                        role="presentation">
                                                                                        <button class="nav-link active"
                                                                                                id="description-tab"
                                                                                                data-bs-toggle="tab"
                                                                                                data-bs-target="#description"
                                                                                                type="button" role="tab"
                                                                                                aria-controls="description"
                                                                                                aria-selected="true">Mô
                                                                                            tả
                                                                                        </button>
                                                                                    </li>


                                                                                    <li class="nav-item"
                                                                                        role="presentation">
                                                                                        <button class="nav-link"
                                                                                                id="review-tab"
                                                                                                data-bs-toggle="tab"
                                                                                                data-bs-target="#review"
                                                                                                type="button" role="tab"
                                                                                                aria-controls="review"
                                                                                                aria-selected="false">
                                                                                            Feedback của khách hàng
                                                                                        </button>
                                                                                    </li>
                                                                                </ul>

                                                                                <div class="tab-content custom-tab"
                                                                                     id="myTabContent">
                                                                                    <div class="tab-pane fade show active"
                                                                                         id="description"
                                                                                         role="tabpanel"
                                                                                         aria-labelledby="description-tab">
                                                                                        <div class="product-description">
                                                                                            <div class="nav-desh">
                                                                                                <p>
                                                                                                    Phần này sẽ được
                                                                                                    thêm vào sau
                                                                                                </p>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="tab-pane fade" id="info"
                                                                                         role="tabpanel"
                                                                                         aria-labelledby="info-tab">
                                                                                        <div class="table-responsive">
                                                                                            <table class="table info-table">
                                                                                                <tbody>
                                                                                                <tr>
                                                                                                    <td>Specialty</td>
                                                                                                    <td>Vegetarian</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Ingredient
                                                                                                        Type
                                                                                                    </td>
                                                                                                    <td>Vegetarian</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Brand</td>
                                                                                                    <td>Lavian
                                                                                                        Exotique
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Form</td>
                                                                                                    <td>Bar Brownie</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Package
                                                                                                        Information
                                                                                                    </td>
                                                                                                    <td>Box</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Manufacturer
                                                                                                    </td>
                                                                                                    <td>Prayagh Nutri
                                                                                                        Product Pvt Ltd
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Item part
                                                                                                        number
                                                                                                    </td>
                                                                                                    <td>LE 014 - 20pcs
                                                                                                        Crème Bakes
                                                                                                        (Pack of 2)
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Net Quantity
                                                                                                    </td>
                                                                                                    <td>40.00 count</td>
                                                                                                </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="tab-pane fade" id="care"
                                                                                         role="tabpanel"
                                                                                         aria-labelledby="care-tab">
                                                                                        <div class="information-box">
                                                                                            <ul>
                                                                                                <li>Store cream cakes in
                                                                                                    a refrigerator.
                                                                                                    Fondant cakes should
                                                                                                    be
                                                                                                    stored in an air
                                                                                                    conditioned
                                                                                                    environment.
                                                                                                </li>

                                                                                                <li>Slice and serve the
                                                                                                    cake at room
                                                                                                    temperature and make
                                                                                                    sure
                                                                                                    it is not exposed to
                                                                                                    heat.
                                                                                                </li>

                                                                                                <li>Use a serrated knife
                                                                                                    to cut a fondant
                                                                                                    cake.
                                                                                                </li>

                                                                                                <li>Sculptural elements
                                                                                                    and figurines may
                                                                                                    contain wire
                                                                                                    supports
                                                                                                    or toothpicks or
                                                                                                    wooden skewers for
                                                                                                    support.
                                                                                                </li>

                                                                                                <li>Please check the
                                                                                                    placement of these
                                                                                                    items before serving
                                                                                                    to
                                                                                                    small children.
                                                                                                </li>

                                                                                                <li>The cake should be
                                                                                                    consumed within 24
                                                                                                    hours.
                                                                                                </li>

                                                                                                <li>Enjoy your cake!
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="tab-pane fade"
                                                                                         id="review" role="tabpanel"
                                                                                         aria-labelledby="review-tab">
                                                                                        <div class="review-box">
                                                                                            <div class="row g-4">
                                                                                                <div class="col-xl-6">
                                                                                                    <div class="review-title">
                                                                                                        <h4 class="fw-500">
                                                                                                            Đánh
                                                                                                            giá</h4>
                                                                                                    </div>

                                                                                                    <div class="d-flex">
                                                                                                        <div class="product-rating">
                                                                                                            <ul class="rating">
                                                                                                                <li>
                                                                                                                    <i data-feather="star"
                                                                                                                       class="fill"></i>
                                                                                                                </li>
                                                                                                                <li>
                                                                                                                    <i data-feather="star"
                                                                                                                       class="fill"></i>
                                                                                                                </li>
                                                                                                                <li>
                                                                                                                    <i data-feather="star"
                                                                                                                       class="fill"></i>
                                                                                                                </li>
                                                                                                                <li>
                                                                                                                    <i data-feather="star"></i>
                                                                                                                </li>
                                                                                                                <li>
                                                                                                                    <i data-feather="star"></i>
                                                                                                                </li>
                                                                                                            </ul>
                                                                                                        </div>
                                                                                                        <h6 class="ms-3">
                                                                                                            4.2/5</h6>
                                                                                                    </div>

                                                                                                    <div class="rating-box">
                                                                                                        <ul>
                                                                                                            <li>
                                                                                                                <div class="rating-list">
                                                                                                                    <h5>
                                                                                                                        5
                                                                                                                        Sao</h5>
                                                                                                                    <div class="progress">
                                                                                                                        <div class="progress-bar"
                                                                                                                             role="progressbar"
                                                                                                                             style="width: 68%"
                                                                                                                             aria-valuenow="100"
                                                                                                                             aria-valuemin="0"
                                                                                                                             aria-valuemax="100">
                                                                                                                            68%
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>

                                                                                                            <li>
                                                                                                                <div class="rating-list">
                                                                                                                    <h5>
                                                                                                                        4
                                                                                                                        Sao</h5>
                                                                                                                    <div class="progress">
                                                                                                                        <div class="progress-bar"
                                                                                                                             role="progressbar"
                                                                                                                             style="width: 67%"
                                                                                                                             aria-valuenow="100"
                                                                                                                             aria-valuemin="0"
                                                                                                                             aria-valuemax="100">
                                                                                                                            67%
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>

                                                                                                            <li>
                                                                                                                <div class="rating-list">
                                                                                                                    <h5>
                                                                                                                        3
                                                                                                                        Star</h5>
                                                                                                                    <div class="progress">
                                                                                                                        <div class="progress-bar"
                                                                                                                             role="progressbar"
                                                                                                                             style="width: 42%"
                                                                                                                             aria-valuenow="100"
                                                                                                                             aria-valuemin="0"
                                                                                                                             aria-valuemax="100">
                                                                                                                            42%
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>

                                                                                                            <li>
                                                                                                                <div class="rating-list">
                                                                                                                    <h5>
                                                                                                                        2
                                                                                                                        Sao</h5>
                                                                                                                    <div class="progress">
                                                                                                                        <div class="progress-bar"
                                                                                                                             role="progressbar"
                                                                                                                             style="width: 30%"
                                                                                                                             aria-valuenow="100"
                                                                                                                             aria-valuemin="0"
                                                                                                                             aria-valuemax="100">
                                                                                                                            30%
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>

                                                                                                            <li>
                                                                                                                <div class="rating-list">
                                                                                                                    <h5>
                                                                                                                        1
                                                                                                                        Sao</h5>
                                                                                                                    <div class="progress">
                                                                                                                        <div class="progress-bar"
                                                                                                                             role="progressbar"
                                                                                                                             style="width: 24%"
                                                                                                                             aria-valuenow="100"
                                                                                                                             aria-valuemin="0"
                                                                                                                             aria-valuemax="100">
                                                                                                                            24%
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>
                                                                                                        </ul>
                                                                                                    </div>
                                                                                                </div>


                                                                                                <div class="col-xl-6">
                                                                                                    <form>
                                                                                                        <div class="review-title">
                                                                                                            <h4 class="fw-500">
                                                                                                                Thêm
                                                                                                                đánh
                                                                                                                giá</h4>
                                                                                                        </div>

                                                                                                        <div class="row g-4">
                                                                                                            <div class="col-md-6">
                                                                                                                <div class="form-floating theme-form-floating">
                                                                                                                    <input type="text"
                                                                                                                           class="form-control"
                                                                                                                           id="name"
                                                                                                                           placeholder="Tên">
                                                                                                                    <label for="name">Tên</label>
                                                                                                                </div>
                                                                                                            </div>

                                                                                                            <div class="col-md-6">
                                                                                                                <div class="form-floating theme-form-floating">
                                                                                                                    <input type="email"
                                                                                                                           class="form-control"
                                                                                                                           id="email"
                                                                                                                           placeholder="Email">
                                                                                                                    <label for="email">Địa
                                                                                                                        chỉ
                                                                                                                        email</label>
                                                                                                                </div>
                                                                                                            </div>

                                                                                                            <div class="col-12">
                                                                                                                <div class="form-floating theme-form-floating">
                                                                <textarea class="form-control"
                                                                          placeholder="Nhận xét của bạn"
                                                                          id="floatingTextarea2"
                                                                          style="height: 150px"></textarea>
                                                                                                                    <label for="floatingTextarea2">Nhận
                                                                                                                        xét
                                                                                                                        của
                                                                                                                        bạn</label>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <input style="margin: 5px"
                                                                                                               type="submit"
                                                                                                               name="submit"
                                                                                                               value="Đăng">
                                                                                                    </form>
                                                                                                </div>


                                                                                                <div class="col-12">
                                                                                                    <div class="review-title">
                                                                                                        <h4 class="fw-500">
                                                                                                            Các đánh
                                                                                                            giá</h4>
                                                                                                    </div>

                                                                                                    <div class="review-people">
                                                                                                        <ul class="review-list">
                                                                                                            <li>
                                                                                                                <div class="people-box">
                                                                                                                    <div>
                                                                                                                        <div class="people-image">
                                                                                                                            <img src="${pageContext.request.contextPath}/template/assets/images/review/1.jpg"
                                                                                                                                 class="img-fluid blur-up lazyload"
                                                                                                                                 alt="">
                                                                                                                        </div>
                                                                                                                    </div>

                                                                                                                    <div class="people-comment">
                                                                                                                        <a class="name"
                                                                                                                           href="javascript:void(0)">Tracey</a>
                                                                                                                        <div class="date-time">
                                                                                                                            <h6 class="text-content">
                                                                                                                                14/2/2022
                                                                                                                                -
                                                                                                                                12.58
                                                                                                                                AM</h6>

                                                                                                                            <div class="product-rating">
                                                                                                                                <ul class="rating">
                                                                                                                                    <li>
                                                                                                                                        <i data-feather="star"
                                                                                                                                           class="fill"></i>
                                                                                                                                    </li>
                                                                                                                                    <li>
                                                                                                                                        <i data-feather="star"
                                                                                                                                           class="fill"></i>
                                                                                                                                    </li>
                                                                                                                                    <li>
                                                                                                                                        <i data-feather="star"
                                                                                                                                           class="fill"></i>
                                                                                                                                    </li>
                                                                                                                                    <li>
                                                                                                                                        <i data-feather="star"></i>
                                                                                                                                    </li>
                                                                                                                                    <li>
                                                                                                                                        <i data-feather="star"></i>
                                                                                                                                    </li>
                                                                                                                                </ul>
                                                                                                                            </div>
                                                                                                                        </div>

                                                                                                                        <div class="reply">
                                                                                                                            <p>
                                                                                                                                Bình
                                                                                                                                luận
                                                                                                                                mẫu

                                                                                                                                <%--                                                                                <a--%>
                                                                                                                                <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                                                                                                                            </p>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </li>

                                                                                                            <%--                                                            <li>--%>
                                                                                                            <%--                                                                <div class="people-box">--%>
                                                                                                            <%--                                                                    <div>--%>
                                                                                                            <%--                                                                        <div class="people-image">--%>
                                                                                                            <%--                                                                            <img src="${pageContext.request.contextPath}/template/assets/images/review/2.jpg"--%>
                                                                                                            <%--                                                                                class="img-fluid blur-up lazyload"--%>
                                                                                                            <%--                                                                                alt="">--%>
                                                                                                            <%--                                                                        </div>--%>
                                                                                                            <%--                                                                    </div>--%>

                                                                                                            <%--                                                                    <div class="people-comment">--%>
                                                                                                            <%--                                                                        <a class="name"--%>
                                                                                                            <%--                                                                            href="javascript:void(0)">Olivia</a>--%>
                                                                                                            <%--                                                                        <div class="date-time">--%>
                                                                                                            <%--                                                                            <h6 class="text-content">01 May, 2022 at--%>
                                                                                                            <%--                                                                                08.31 AM</h6>--%>
                                                                                                            <%--                                                                            <div class="product-rating">--%>
                                                                                                            <%--                                                                                <ul class="rating">--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                </ul>--%>
                                                                                                            <%--                                                                            </div>--%>
                                                                                                            <%--                                                                        </div>--%>

                                                                                                            <%--                                                                        <div class="reply">--%>
                                                                                                            <%--                                                                            <p>Tootsie roll cake danish halvah powder--%>
                                                                                                            <%--                                                                                Tootsie roll candy marshmallow cookie--%>
                                                                                                            <%--                                                                                brownie apple pie pudding brownie--%>
                                                                                                            <%--                                                                                chocolate bar. Jujubes gummi bears I--%>
                                                                                                            <%--                                                                                love powder danish oat cake tart--%>
                                                                                                            <%--                                                                                croissant.<a--%>
                                                                                                            <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                                                                                                            <%--                                                                            </p>--%>
                                                                                                            <%--                                                                        </div>--%>
                                                                                                            <%--                                                                    </div>--%>
                                                                                                            <%--                                                                </div>--%>
                                                                                                            <%--                                                            </li>--%>

                                                                                                            <%--                                                            <li>--%>
                                                                                                            <%--                                                                <div class="people-box">--%>
                                                                                                            <%--                                                                    <div>--%>
                                                                                                            <%--                                                                        <div class="people-image">--%>
                                                                                                            <%--                                                                            <img src="${pageContext.request.contextPath}/template/assets/images/review/3.jpg"--%>
                                                                                                            <%--                                                                                class="img-fluid blur-up lazyload"--%>
                                                                                                            <%--                                                                                alt="">--%>
                                                                                                            <%--                                                                        </div>--%>
                                                                                                            <%--                                                                    </div>--%>

                                                                                                            <%--                                                                    <div class="people-comment">--%>
                                                                                                            <%--                                                                        <a class="name"--%>
                                                                                                            <%--                                                                            href="javascript:void(0)">Gabrielle</a>--%>
                                                                                                            <%--                                                                        <div class="date-time">--%>
                                                                                                            <%--                                                                            <h6 class="text-content">21 May, 2022 at--%>
                                                                                                            <%--                                                                                05.52 PM</h6>--%>

                                                                                                            <%--                                                                            <div class="product-rating">--%>
                                                                                                            <%--                                                                                <ul class="rating">--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"--%>
                                                                                                            <%--                                                                                            class="fill"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                    <li>--%>
                                                                                                            <%--                                                                                        <i data-feather="star"></i>--%>
                                                                                                            <%--                                                                                    </li>--%>
                                                                                                            <%--                                                                                </ul>--%>
                                                                                                            <%--                                                                            </div>--%>
                                                                                                            <%--                                                                        </div>--%>

                                                                                                            <%--                                                                        <div class="reply">--%>
                                                                                                            <%--                                                                            <p>Biscuit chupa chups gummies powder I love--%>
                                                                                                            <%--                                                                                sweet pudding jelly beans. Lemon drops--%>
                                                                                                            <%--                                                                                marzipan apple pie gingerbread macaroon--%>
                                                                                                            <%--                                                                                croissant cotton candy pastry wafer.--%>
                                                                                                            <%--                                                                                Carrot cake halvah I love tart caramels--%>
                                                                                                            <%--                                                                                pudding icing chocolate gummi bears.--%>
                                                                                                            <%--                                                                                Gummi bears danish cotton candy muffin--%>
                                                                                                            <%--                                                                                marzipan caramels awesome feel. <a--%>
                                                                                                            <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                                                                                                            <%--                                                                            </p>--%>
                                                                                                            <%--                                                                        </div>--%>
                                                                                                            <%--                                                                    </div>--%>
                                                                                                            <%--                                                                </div>--%>
                                                                                                            <%--                                                            </li>--%>
                                                                                                        </ul>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </section>
                                                    <!-- Product Left Sidebar End -->

                                                    <!-- Releted Product Section Start -->
                                                    <%--    <section class="product-list-section section-b-space">--%>
                                                    <%--        <div class="container-fluid-lg">--%>
                                                    <%--            <div class="title">--%>
                                                    <%--                <h2>Related Products</h2>--%>
                                                    <%--                <span class="title-leaf">--%>
                                                    <%--                    <svg class="icon-width">--%>
                                                    <%--                        <use xlink:href="${pageContext.request.contextPath}/template/assets/svg/leaf.svg#leaf"></use>--%>
                                                    <%--                    </svg>--%>
                                                    <%--                </span>--%>
                                                    <%--            </div>--%>
                                                    <%--            <div class="row">--%>
                                                    <%--                <div class="col-12">--%>
                                                    <%--                    <div class="slider-6_1 product-wrapper">--%>
                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-left.htm">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/11.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Cake</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Chocolate Chip Cookies 250 g</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(5.0)</span>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                        <h6 class="unit">500 G</h6>--%>
                                                    <%--                                        <h5 class="price"><span class="theme-color">$10.25</span> <del>$12.57</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.05s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/2.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Vegetable</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Fresh Bread and Pastry Flour 200 g</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(4.0)</span>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                        <h6 class="unit">250 ml</h6>--%>
                                                    <%--                                        <h5 class="price"><span class="theme-color">$08.02</span> <del>$15.15</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.1s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/3.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Vegetable</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Peanut Butter Bite Premium Butter Cookies 600 g</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(2.4)</span>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                        <h6 class="unit">350 G</h6>--%>
                                                    <%--                                        <h5 class="price"><span class="theme-color">$04.33</span> <del>$10.36</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.15s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/4.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Snacks</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">SnackAmor Combo Pack of Jowar Stick and Jowar Chips</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(5.0)</span>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                        <h6 class="unit">570 G</h6>--%>
                                                    <%--                                        <h5 class="price"><span class="theme-color">$12.52</span> <del>$13.62</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.2s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/5.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Snacks</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Yumitos Chilli Sprinkled Potato Chips 100 g</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(3.8)</span>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                        <h6 class="unit">100 G</h6>--%>
                                                    <%--                                        <h5 class="price"><span class="theme-color">$10.25</span> <del>$12.36</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.25s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/6.png"--%>
                                                    <%--                                                class="img-fluid blur-up lazyload" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Vegetable</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Fantasy Crunchy Choco Chip Cookies</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(4.0)</span>--%>
                                                    <%--                                        </div>--%>

                                                    <%--                                        <h6 class="unit">550 G</h6>--%>

                                                    <%--                                        <h5 class="price"><span class="theme-color">$14.25</span> <del>$16.57</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>

                                                    <%--                        <div>--%>
                                                    <%--                            <div class="product-box-3 wow fadeInUp" data-wow-delay="0.3s">--%>
                                                    <%--                                <div class="product-header">--%>
                                                    <%--                                    <div class="product-image">--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/product/7.png" class="img-fluid" alt="">--%>
                                                    <%--                                        </a>--%>

                                                    <%--                                        <ul class="product-option">--%>
                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">--%>
                                                    <%--                                                <a href="javascript:void(0)" data-bs-toggle="modal"--%>
                                                    <%--                                                    data-bs-target="#view">--%>
                                                    <%--                                                    <i data-feather="eye"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">--%>
                                                    <%--                                                <a href="compare.html">--%>
                                                    <%--                                                    <i data-feather="refresh-cw"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>

                                                    <%--                                            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">--%>
                                                    <%--                                                <a href="wishlist" class="notifi-wishlist">--%>
                                                    <%--                                                    <i data-feather="heart"></i>--%>
                                                    <%--                                                </a>--%>
                                                    <%--                                            </li>--%>
                                                    <%--                                        </ul>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>

                                                    <%--                                <div class="product-footer">--%>
                                                    <%--                                    <div class="product-detail">--%>
                                                    <%--                                        <span class="span-name">Vegetable</span>--%>
                                                    <%--                                        <a href="product-detail.jsp">--%>
                                                    <%--                                            <h5 class="name">Fresh Bread and Pastry Flour 200 g</h5>--%>
                                                    <%--                                        </a>--%>
                                                    <%--                                        <div class="product-rating mt-2">--%>
                                                    <%--                                            <ul class="rating">--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star" class="fill"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                                <li>--%>
                                                    <%--                                                    <i data-feather="star"></i>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </ul>--%>
                                                    <%--                                            <span>(3.8)</span>--%>
                                                    <%--                                        </div>--%>

                                                    <%--                                        <h6 class="unit">1 Kg</h6>--%>

                                                    <%--                                        <h5 class="price"><span class="theme-color">$12.68</span> <del>$14.69</del>--%>
                                                    <%--                                        </h5>--%>
                                                    <%--                                        <div class="add-to-cart-box bg-white">--%>
                                                    <%--                                            <button class="btn btn-add-cart addcart-button">Add--%>
                                                    <%--                                                <span class="add-icon bg-light-gray">--%>
                                                    <%--                                                    <i class="fa-solid fa-plus"></i>--%>
                                                    <%--                                                </span>--%>
                                                    <%--                                            </button>--%>
                                                    <%--                                            <div class="cart_qty qty-box">--%>
                                                    <%--                                                <div class="input-group bg-white">--%>
                                                    <%--                                                    <button type="button" class="qty-left-minus bg-gray"--%>
                                                    <%--                                                        data-type="minus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-minus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <input class="form-control input-number qty-input" type="text"--%>
                                                    <%--                                                        name="quantity" value="0">--%>
                                                    <%--                                                    <button type="button" class="qty-right-plus bg-gray"--%>
                                                    <%--                                                        data-type="plus" data-field="">--%>
                                                    <%--                                                        <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                            </div>--%>
                                                    <%--                                        </div>--%>
                                                    <%--                                    </div>--%>
                                                    <%--                                </div>--%>
                                                    <%--                            </div>--%>
                                                    <%--                        </div>--%>
                                                    <%--                    </div>--%>
                                                    <%--                </div>--%>
                                                    <%--            </div>--%>
                                                    <%--        </div>--%>
                                                    <%--    </section>--%>
                                                    <!-- Releted Product Section End -->

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
                                                                                         class="blur-up lazyload"
                                                                                         alt="">
                                                                                </div>

                                                                                <div class="service-detail">
                                                                                    <h5>Đồ uống chất lượng</h5>
                                                                                </div>
                                                                            </div>

                                                                            <div class="service-box">
                                                                                <div class="service-image">
                                                                                    <img src="${pageContext.request.contextPath}/template/assets/svg/delivery.svg"
                                                                                         class="blur-up lazyload"
                                                                                         alt="">
                                                                                </div>

                                                                                <div class="service-detail">
                                                                                    <h5>Miễn phí vận chuyển trong vòng
                                                                                        3km</h5>
                                                                                </div>
                                                                            </div>

                                                                            <div class="service-box">
                                                                                <div class="service-image">
                                                                                    <img src="${pageContext.request.contextPath}/template/assets/svg/discount.svg"
                                                                                         class="blur-up lazyload"
                                                                                         alt="">
                                                                                </div>

                                                                                <div class="service-detail">
                                                                                    <h5>Nhiều ưu đãi</h5>
                                                                                </div>
                                                                            </div>

                                                                            <div class="service-box">
                                                                                <div class="service-image">
                                                                                    <img src="${pageContext.request.contextPath}/template/assets/svg/market.svg"
                                                                                         class="blur-up lazyload"
                                                                                         alt="">
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
                                                                                         class="blur-up lazyload"
                                                                                         alt="">
                                                                                </a>
                                                                            </div>

                                                                            <div class="footer-logo-contain">
                                                                                <p>Chúng tôi là quán cà phê mà chắc chắn
                                                                                    bạn nên thử và trải nghiệm. Rất hân
                                                                                    hạnh được phục vụ.</p>

                                                                                <ul class="address">
                                                                                    <li>
                                                                                        <i data-feather="home"></i>
                                                                                        <a href="javascript:void(0)">Hòa
                                                                                            Lạc, Thạch Thất, Hà Nội</a>
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
                                                                                    <a href="home" class="text-content">Trang
                                                                                        chủ</a>
                                                                                </li>

                                                                                <li>
                                                                                    <a href="about-us.html"
                                                                                       class="text-content">Về chúng
                                                                                        tôi</a>
                                                                                </li>

                                                                                <li>
                                                                                    <a href="contact-us.html"
                                                                                       class="text-content">Liên lạc</a>
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
                                                                                    <a href="order-success.html"
                                                                                       class="text-content">Bạn đã
                                                                                        mua</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="user-dashboard.html"
                                                                                       class="text-content">Tài
                                                                                        khoản</a>
                                                                                </li>

                                                                                <li>
                                                                                    <a href="/ODShop/template/front-end/wishlist.html"
                                                                                       class="text-content">
                                                                                        Wishlist</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="faq.html"
                                                                                       class="text-content">FAQ</a>
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
                                                                                            <h6 class="text-content">
                                                                                                Hotline 24/7 :</h6>
                                                                                            <h5>+84 376597711</h5>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>

                                                                                <li>
                                                                                    <div class="footer-number">
                                                                                        <i data-feather="mail"></i>
                                                                                        <div class="contact-number">
                                                                                            <h6 class="text-content">Địa
                                                                                                chỉ email:</h6>
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

                                                    <!-- Quick View Modal Box Start -->
                                                    <div class="modal fade theme-modal view-modal" id="view"
                                                         tabindex="-1" aria-labelledby="exampleModalLabel"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-sm-down">
                                                            <div class="modal-content">
                                                                <div class="modal-header p-0">
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal" aria-label="Close">
                                                                        <i class="fa-solid fa-xmark"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="row g-sm-4 g-2">
                                                                        <div class="col-lg-6">
                                                                            <div class="slider-image">
                                                                                <img src="${pageContext.request.contextPath}/template/assets/images/product/category/1.jpg"
                                                                                     class="img-fluid blur-up lazyload"
                                                                                     alt="">
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-6">
                                                                            <div class="right-sidebar-modal">
                                                                                <h4 class="title-name">Peanut Butter
                                                                                    Bite Premium Butter Cookies 600
                                                                                    g</h4>
                                                                                <h4 class="price">$36.99</h4>
                                                                                <div class="product-rating">
                                                                                    <ul class="rating">
                                                                                        <li>
                                                                                            <i data-feather="star"
                                                                                               class="fill"></i>
                                                                                        </li>
                                                                                        <li>
                                                                                            <i data-feather="star"
                                                                                               class="fill"></i>
                                                                                        </li>
                                                                                        <li>
                                                                                            <i data-feather="star"
                                                                                               class="fill"></i>
                                                                                        </li>
                                                                                        <li>
                                                                                            <i data-feather="star"
                                                                                               class="fill"></i>
                                                                                        </li>
                                                                                        <li>
                                                                                            <i data-feather="star"></i>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <span class="ms-2">8 Reviews</span>
                                                                                    <span class="ms-2 text-danger">6 sold in last 16 hours</span>
                                                                                </div>

                                                                                <div class="product-detail">
                                                                                    <h4>Product Details :</h4>
                                                                                    <p>Candy canes sugar plum tart
                                                                                        cotton candy chupa chups sugar
                                                                                        plum chocolate I love.
                                                                                        Caramels marshmallow icing
                                                                                        dessert candy canes I love
                                                                                        soufflé I love toffee.
                                                                                        Marshmallow pie sweet sweet roll
                                                                                        sesame snaps tiramisu jelly bear
                                                                                        claw. Bonbon
                                                                                        muffin I love carrot cake sugar
                                                                                        plum dessert bonbon.</p>
                                                                                </div>

                                                                                <ul class="brand-list">
                                                                                    <li>
                                                                                        <div class="brand-box">
                                                                                            <h5>Brand Name:</h5>
                                                                                            <h6>Black Forest</h6>
                                                                                        </div>
                                                                                    </li>

                                                                                    <li>
                                                                                        <div class="brand-box">
                                                                                            <h5>Product Code:</h5>
                                                                                            <h6>W0690034</h6>
                                                                                        </div>
                                                                                    </li>

                                                                                    <li>
                                                                                        <div class="brand-box">
                                                                                            <h5>Product Type:</h5>
                                                                                            <h6>White Cream Cake</h6>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>

                                                                                <div class="select-size">
                                                                                    <h4>Cake Size :</h4>
                                                                                    <select class="form-select select-form-size">
                                                                                        <option selected>Select Size
                                                                                        </option>
                                                                                        <option value="1.2">1/2 KG
                                                                                        </option>
                                                                                        <option value="0">1 KG</option>
                                                                                        <option value="1.5">1/5 KG
                                                                                        </option>
                                                                                        <option value="red">Red Roses
                                                                                        </option>
                                                                                        <option value="pink">With Pink
                                                                                            Roses
                                                                                        </option>
                                                                                    </select>
                                                                                </div>

                                                                                <div class="modal-button">
                                                                                    <button onclick="location.href = 'cart.jsp';"
                                                                                            class="btn btn-md add-cart-button icon">
                                                                                        Add
                                                                                        To Cart
                                                                                    </button>
                                                                                    <button onclick="location.href = 'product-left.html';"
                                                                                            class="btn theme-bg-color view-button icon text-white fw-bold btn-md">
                                                                                        View More Details
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Quick View Modal Box End -->

                                                    <!-- Location Modal Start -->
                                                    <div class="modal location-modal fade theme-modal"
                                                         id="locationModal" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Chọn
                                                                        vị trí của bạn</h5>
                                                                    <p class="mt-1 text-content">Nhập vị trí để xem ưu
                                                                        đãi hấp dẫn</p>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal" aria-label="Close">
                                                                        <i class="fa-solid fa-xmark"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="location-list">
                                                                        <div class="search-input">
                                                                            <input type="search" class="form-control"
                                                                                   placeholder="Vị trí của bạn">
                                                                            <i class="fa-solid fa-magnifying-glass"></i>
                                                                        </div>

                                                                        <div class="disabled-box">
                                                                            <h6>Chọn vị trí của bạn</h6>
                                                                        </div>

                                                                        <ul class="location-select custom-height">
                                                                            <li>
                                                                                <a href="javascript:void(0)">
                                                                                    <h6>Hà Nội</h6>
                                                                                    <span>Min: 25 000 Vnđ</span>
                                                                                </a>
                                                                            </li>

                                                                            <li>
                                                                                <a href="javascript:void(0)">
                                                                                    <h6>TP Hồ Chí Minh</h6>
                                                                                    <span>Min: 30 000 Vnđ</span>
                                                                                </a>
                                                                            </li>


                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Location Modal End -->

                                                    <!-- Deal Box Modal Start -->
                                                    <div class="modal fade theme-modal deal-modal" id="deal-box"
                                                         tabindex="-1" aria-labelledby="exampleModalLabel"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <div>
                                                                        <h5 class="modal-title w-100" id="deal_today">
                                                                            Deal Today</h5>
                                                                        <p class="mt-1 text-content">Recommended deals
                                                                            for you.</p>
                                                                    </div>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal" aria-label="Close">
                                                                        <i class="fa-solid fa-xmark"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="deal-offer-box">
                                                                        <ul class="deal-offer-list">
                                                                            <li class="list-1">
                                                                                <div class="deal-offer-contain">
                                                                                    <a href="home" class="deal-image">
                                                                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/10.png"
                                                                                             class="blur-up lazyload"
                                                                                             alt="">
                                                                                    </a>

                                                                                    <a href="home" class="deal-contain">
                                                                                        <h5>Blended Instant Coffee 50 g
                                                                                            Buy 1 Get 1 Free</h5>
                                                                                        <h6>$52.57
                                                                                            <del>57.62</del>
                                                                                            <span>500 G</span></h6>
                                                                                    </a>
                                                                                </div>
                                                                            </li>

                                                                            <li class="list-2">
                                                                                <div class="deal-offer-contain">
                                                                                    <a href="home" class="deal-image">
                                                                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/11.png"
                                                                                             class="blur-up lazyload"
                                                                                             alt="">
                                                                                    </a>

                                                                                    <a href="home" class="deal-contain">
                                                                                        <h5>Blended Instant Coffee 50 g
                                                                                            Buy 1 Get 1 Free</h5>
                                                                                        <h6>$52.57
                                                                                            <del>57.62</del>
                                                                                            <span>500 G</span></h6>
                                                                                    </a>
                                                                                </div>
                                                                            </li>

                                                                            <li class="list-3">
                                                                                <div class="deal-offer-contain">
                                                                                    <a href="home" class="deal-image">
                                                                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/12.png"
                                                                                             class="blur-up lazyload"
                                                                                             alt="">
                                                                                    </a>

                                                                                    <a href="home" class="deal-contain">
                                                                                        <h5>Blended Instant Coffee 50 g
                                                                                            Buy 1 Get 1 Free</h5>
                                                                                        <h6>$52.57
                                                                                            <del>57.62</del>
                                                                                            <span>500 G</span></h6>
                                                                                    </a>
                                                                                </div>
                                                                            </li>

                                                                            <li class="list-1">
                                                                                <div class="deal-offer-contain">
                                                                                    <a href="home" class="deal-image">
                                                                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/13.png"
                                                                                             class="blur-up lazyload"
                                                                                             alt="">
                                                                                    </a>

                                                                                    <a href="home" class="deal-contain">
                                                                                        <h5>Blended Instant Coffee 50 g
                                                                                            Buy 1 Get 1 Free</h5>
                                                                                        <h6>$52.57
                                                                                            <del>57.62</del>
                                                                                            <span>500 G</span></h6>
                                                                                    </a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Deal Box Modal End -->

                                                    <!-- Add to cart Modal Start -->
                                                    <div class="add-cart-box">
                                                        <div class="add-iamge">
                                                            <img src="${pageContext.request.contextPath}/template/assets/images/cake/pro/1.jpg"
                                                                 class="img-fluid" alt="">
                                                        </div>

                                                        <div class="add-contain">
                                                            <h6>Added to Cart</h6>
                                                        </div>
                                                    </div>
                                                    <!-- Add to cart Modal End -->

                                                    <!-- Tap to top start -->
                                                    <div class="theme-option">
                                                        <div class="back-to-top">
                                                            <a id="back-to-top" href="#">
                                                                <i class="fas fa-chevron-up"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <!-- Tap to top end -->

                                                    <!-- Sticky Cart Box Start -->
                                                    <div class="sticky-bottom-cart">
                                                        <div class="container-fluid-lg">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="cart-content">
                                                                        <div class="product-image">
                                                                            <img src="${pageContext.request.contextPath}/template/assets/images/product/category/1.jpg"
                                                                                 class="img-fluid blur-up lazyload"
                                                                                 alt="">
                                                                            <div class="content">
                                                                                <h5><%= product.getProduct_name()%>
                                                                                </h5>
                                                                                <h6>$32.96
                                                                                    <del class="text-danger">$96.00
                                                                                    </del>
                                                                                    <span>55% off</span></h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="selection-section">
                                                                            <div class="form-group mb-0">

                                                                            </div>
                                                                            <div class="cart_qty qty-box product-qty m-0">
                                                                                <div class="input-group h-100">
                                                                                    <button type="button"
                                                                                            class="qty-left-minus"
                                                                                            data-type="minus"
                                                                                            data-field="">
                                                                                        <i class="fa fa-minus"
                                                                                           aria-hidden="true"></i>
                                                                                    </button>
                                                                                    <input class="form-control input-number qty-input"
                                                                                           type="text" name="quantity"
                                                                                           value="1">
                                                                                    <button type="button"
                                                                                            class="qty-right-plus"
                                                                                            data-type="plus"
                                                                                            data-field="">
                                                                                        <i class="fa fa-plus"
                                                                                           aria-hidden="true"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="add-btn">
                                                                            <a class="btn theme-bg-color text-white wishlist-btn"
                                                                               href="wishlist"><i
                                                                                    class="fa fa-bookmark"></i> Wishlist</a>
                                                                            <a class="btn theme-bg-color text-white"
                                                                               href="cart"><i
                                                                                    class="fas fa-shopping-cart"></i>
                                                                                Thêm vào giỏ hàng</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Sticky Cart Box End -->

                                                    <!-- Bg overlay Start -->
                                                    <div class="bg-overlay"></div>
                                                    <!-- Bg overlay End -->

                                                    <!-- latest jquery-->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/jquery-3.6.0.min.js"></script>

                                                    <!-- jquery ui-->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/jquery-ui.min.js"></script>

                                                    <!-- Bootstrap js-->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/bootstrap-notify.min.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/popper.min.js"></script>

                                                    <!-- feather icon js-->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/feather/feather.min.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/feather/feather-icon.js"></script>

                                                    <!-- Lazyload Js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/lazysizes.min.js"></script>

                                                    <!-- Slick js-->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/slick/slick.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/slick/slick-animation.min.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/custom-slick-animated.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/slick/custom_slick.js"></script>

                                                    <!-- Price Range Js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/ion.rangeSlider.min.js"></script>

                                                    <!-- sidebar open js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/filter-sidebar.js"></script>

                                                    <!-- Quantity js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/quantity-2.js"></script>

                                                    <!-- Zoom Js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/jquery.elevatezoom.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/zoom-filter.js"></script>

                                                    <!-- Timer Js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/timer1.js"></script>

                                                    <!-- Sticky-bar js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/sticky-cart-bottom.js"></script>

                                                    <!-- WOW js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/wow.min.js"></script>
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/custom-wow.js"></script>

                                                    <!-- script js -->
                                                    <script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script>


</body>

</html>