<%--
  Created by IntelliJ IDEA.
  User: Minh1511
  Date: 7/7/2023
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Vector" %>
<%@ page import="Model.Order_item" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Address" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>Giỏ hàng</title>

  <!-- Google font -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
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
                              <a href="productdetail" class="drop-image">
                                <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/1.png"
                                     class="blur-up lazyload" alt="">
                              </a>

                              <div class="drop-contain">
                                <a href="productdetail">
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
                              <a href="productdetail" class="drop-image">
                                <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/2.png"
                                     class="blur-up lazyload" alt="">
                              </a>

                              <div class="drop-contain">
                                <a href="productdetail">
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
                          <a href="cart" class="btn btn-sm cart-button">Giỏ hàng</a>
                          <a href="checkout.html" class="btn btn-sm cart-button theme-bg-color
                                                      text-white">Thanh toán</a>
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
        <a href="home">
          <i class="iconly-Home icli"></i>
          <span>Trang chủ</span>
        </a>
      </li>



      <li>
        <a href="wishlist" class="notifi-wishlist">
          <i class="iconly-Heart icli"></i>
          <span>Wishlist</span>
        </a>
      </li>

      <li>
        <a href="cart">
          <i class="iconly-Bag-2 icli fly-cate"></i>
          <span>Giỏ hàng</span>
        </a>
      </li>
    </ul>
  </div>
  <!-- mobile fix menu end -->

  <!-- Breadcrumb Section Start -->
  <!-- Breadcrumb Section End -->

  <!-- Breadcrumb Section Start -->
  <section class="breadscrumb-section pt-0">
    <div class="container-fluid-lg">
      <div class="row">
        <div class="col-12">
          <div class="breadscrumb-contain">
            <h2>User Dashboard</h2>
            <nav>
              <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                  <a href="index.html">
                    <i class="fa-solid fa-house"></i>
                  </a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">User Dashboard</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Breadcrumb Section End -->

  <!-- User Dashboard Section Start -->

  <section class="user-dashboard-section section-b-space">
    <div class="container-fluid-lg">
      <div class="row">
        <div class="col-xxl-3 col-lg-4">
          <div class="dashboard-left-sidebar">
            <div class="close-button d-flex d-lg-none">
              <button class="close-sidebar">
                <i class="fa-solid fa-xmark"></i>
              </button>
            </div>
            <div class="profile-box">
              <div class="cover-image">
                <img src="../assets/images/inner-page/cover-img.jpg" class="img-fluid blur-up lazyload"
                     alt="">
              </div>

              <div class="profile-contain">
                <div class="profile-image">
                  <div class="position-relative">
                    <img src="../assets/images/inner-page/user/1.jpg"
                         class="blur-up lazyload update_img" alt="">
                    <div class="cover-icon">
                      <i class="fa-solid fa-pen">
                        <input type="file" onchange="readURL(this,0)">
                      </i>
                    </div>
                  </div>
                </div>
              <%
                Customer customer = (Customer) session.getAttribute("customer");
              %>
                <div class="profile-name">
                  <h3><%=customer.getName()%></h3>
                  <h6 class="text-content"><%=customer.getEmail()%></h6>
                </div>
              </div>
            </div>

            <ul class="nav nav-pills user-nav-pills" id="pills-tab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-dashboard-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-dashboard" type="button" role="tab"
                        aria-controls="pills-dashboard" aria-selected="true"><i data-feather="home"></i>
                  DashBoard</button>
              </li>

              <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-order-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-order" type="button" role="tab" aria-controls="pills-order"
                        aria-selected="false"><i data-feather="shopping-bag"></i>Order</button>
              </li>

              <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-wishlist-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-wishlist" type="button" role="tab"
                        aria-controls="pills-wishlist" aria-selected="false"><i data-feather="heart"></i>
                  Wishlist</button>
              </li>

              <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-address-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-address" type="button" role="tab"
                        aria-controls="pills-address" aria-selected="false"><i data-feather="map-pin"></i>
                  Address</button>
              </li>

              <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-profile" type="button" role="tab"
                        aria-controls="pills-profile" aria-selected="false"><i data-feather="user"></i>
                  Profile</button>
              </li>

              <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-security-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-security" type="button" role="tab"
                        aria-controls="pills-security" aria-selected="false"><i data-feather="shield"></i>
                  Privacy</button>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-xxl-9 col-lg-8">
          <button class="btn left-dashboard-show btn-animation btn-md fw-bold d-block mb-4 d-lg-none">Show
            Menu</button>
          <div class="dashboard-right-sidebar">
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-dashboard" role="tabpanel"
                   aria-labelledby="pills-dashboard-tab">
                <div class="dashboard-home">
                  <div class="title">
                    <h2>My Dashboard</h2>
                    <span class="title-leaf">
                                              <svg class="icon-width bg-gray">
                                                  <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                              </svg>
                                          </span>
                  </div>

                  <div class="dashboard-user-name">
                    <h6 class="text-content">Hello, <b class="text-title"><%=customer.getName()%></b></h6>
                  </div>

                  <div class="total-box">
                    <div class="row g-sm-4 g-3">
                      <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                        <div class="totle-contain">
                          <img src="../assets/images/svg/order.svg"
                               class="img-1 blur-up lazyload" alt="">
                          <img src="../assets/images/svg/order.svg" class="blur-up lazyload"
                               alt="">
                          <div class="totle-detail">
                            <h5>Total Order</h5>
                            <h3>3658</h3>
                          </div>
                        </div>
                      </div>

                      <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                        <div class="totle-contain">
                          <img src="../assets/images/svg/pending.svg"
                               class="img-1 blur-up lazyload" alt="">
                          <img src="../assets/images/svg/pending.svg" class="blur-up lazyload"
                               alt="">
                          <div class="totle-detail">
                            <h5>Total Pending Order</h5>
                            <h3>254</h3>
                          </div>
                        </div>
                      </div>

                      <div class="col-xxl-4 col-lg-6 col-md-4 col-sm-6">
                        <div class="totle-contain">
                          <img src="../assets/images/svg/wishlist.svg"
                               class="img-1 blur-up lazyload" alt="">
                          <img src="../assets/images/svg/wishlist.svg"
                               class="blur-up lazyload" alt="">
                          <div class="totle-detail">
                            <h5>Total Wishlist</h5>
                            <h3></h3>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="dashboard-title">
                    <h3>Account Information</h3>
                  </div>

                  <div class="row g-4">
                    <div class="col-xxl-6">
                      <div class="dashboard-contant-title">
                        <h4>Contact Information</h4>
                      </div>
                      <div class="dashboard-detail">
                        <h6 class="text-content"><%=customer.getName()%></h6>
                        <h6 class="text-content"><%=customer.getEmail()%></h6>
                        <a href="changepass" style="color: lawngreen">Change Password</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="tab-pane fade show" id="pills-wishlist" role="tabpanel"
                   aria-labelledby="pills-wishlist-tab">
                <div class="dashboard-wishlist">

                  <div class="title">
                    <h2>My Wishlist History</h2>
                    <span class="title-leaf title-leaf-gray">
                                              <svg class="icon-width bg-gray">
                                                  <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                              </svg>
                                          </span>
                  </div>

                  <div class="row g-sm-4 g-3">
                    <%
                      Vector<Product> vector = (Vector<Product>) request.getAttribute("wishlist");
                      for(Product item : vector){
                    %>
                    <div class="col-xxl-3 col-lg-6 col-md-4 col-sm-6">
                      <div class="product-box-3 theme-bg-white h-100">
                        <div class="product-header">
                          <div class="product-image">
                            <a href="product-left-thumbnail.html">
                              <img src="<%=item.getImage()%>"
                                   class="img-fluid blur-up lazyload" alt="">
                            </a>
                          </div>
                        </div>

                        <div class="product-footer">
                          <div class="product-detail">
                            <span class="span-name"><%=item.getCategory_name()%></span>
                            <a href="product-left-thumbnail.html">
                              <h5 class="name"><%=item.getProduct_name()%></h5>
                            </a>
                            <p class="text-content mt-1 mb-2 product-content"><%=item.getDescribe()%></p>
                            <h6 class="unit mt-1"><%=item.getVolume()%></h6>
                            <h5 class="price">
                              <span class="theme-color"><%=item.getPrice()%></span>
                              <del>$15.15</del>
                            </h5>
                            <div class="add-to-cart-box bg-white">
                              <button onclick="location.href = 'cart?service=addToCart&pro_id=<%=item.getProduct_id()%>';"
                                      class="btn btn-add-cart addcart-button">Add
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <%}%>
                  </div>

                </div>
              </div>



              <div class="tab-pane fade show" id="pills-order" role="tabpanel"
                   aria-labelledby="pills-order-tab">
                <div class="dashboard-order">
                  <div class="title">
                    <h2>My Orders History</h2>
                    <span class="title-leaf title-leaf-gray">
                                              <svg class="icon-width bg-gray">
                                                  <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                              </svg>
                                          </span>
                  </div>

                  <div class="order-contain">
                    <div class="order-box dashboard-bg-box">
                      <div class="order-container">
                        <div class="order-icon">
                          <i data-feather="box"></i>
                        </div>

                        <div class="order-detail">
                          <h4>Delivere <span>Panding</span></h4>
                          <h6 class="text-content">Gouda parmesan caerphilly mozzarella
                            cottage cheese cauliflower cheese taleggio gouda.</h6>
                        </div>
                      </div>

                      <div class="product-order-detail">
                        <a href="product-left-thumbnail.html" class="order-image">
                          <img src="../assets/images/vegetable/product/1.png"
                               class="blur-up lazyload" alt="">
                        </a>

                        <div class="order-wrap">
                          <a href="product-left-thumbnail.html">
                            <h3>Fantasy Crunchy Choco Chip Cookies</h3>
                          </a>
                          <p class="text-content">Cheddar dolcelatte gouda. Macaroni cheese
                            cheese strings feta halloumi cottage cheese jarlsberg cheese
                            triangles say cheese.</p>
                          <ul class="product-size">
                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Price : </h6>
                                <h5>$20.68</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Rate : </h6>
                                <div class="product-rating ms-2">
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
                                </div>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Sold By : </h6>
                                <h5>Fresho</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Quantity : </h6>
                                <h5>250 G</h5>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="order-box dashboard-bg-box">
                      <div class="order-container">
                        <div class="order-icon">
                          <i data-feather="box"></i>
                        </div>

                        <div class="order-detail">
                          <h4>Delivered <span class="success-bg">Success</span></h4>
                          <h6 class="text-content">Cheese on toast cheesy grin cheesy grin
                            cottage cheese caerphilly everyone loves cottage cheese the big
                            cheese.</h6>
                        </div>
                      </div>

                      <div class="product-order-detail">
                        <a href="product-left-thumbnail.html" class="order-image">
                          <img src="../assets/images/vegetable/product/2.png" alt=""
                               class="blur-up lazyload">
                        </a>

                        <div class="order-wrap">
                          <a href="product-left-thumbnail.html">
                            <h3>Cold Brew Coffee Instant Coffee 50 g</h3>
                          </a>
                          <p class="text-content">Pecorino paneer port-salut when the cheese
                            comes out everybody's happy red leicester mascarpone blue
                            castello cauliflower cheese.</p>
                          <ul class="product-size">
                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Price : </h6>
                                <h5>$20.68</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Rate : </h6>
                                <div class="product-rating ms-2">
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
                                </div>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Sold By : </h6>
                                <h5>Fresho</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Quantity : </h6>
                                <h5>250 G</h5>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="order-box dashboard-bg-box">
                      <div class="order-container">
                        <div class="order-icon">
                          <i data-feather="box"></i>
                        </div>

                        <div class="order-detail">
                          <h4>Delivere <span>Panding</span></h4>
                          <h6 class="text-content">Cheesy grin boursin cheesy grin cheesecake
                            blue castello cream cheese lancashire melted cheese.</h6>
                        </div>
                      </div>

                      <div class="product-order-detail">
                        <a href="product-left-thumbnail.html" class="order-image">
                          <img src="../assets/images/vegetable/product/3.png" alt=""
                               class="blur-up lazyload">
                        </a>

                        <div class="order-wrap">
                          <a href="product-left-thumbnail.html">
                            <h3>Peanut Butter Bite Premium Butter Cookies 600 g</h3>
                          </a>
                          <p class="text-content">Cow bavarian bergkase mascarpone paneer
                            squirty cheese fromage frais cheese slices when the cheese comes
                            out everybody's happy.</p>
                          <ul class="product-size">
                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Price : </h6>
                                <h5>$20.68</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Rate : </h6>
                                <div class="product-rating ms-2">
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
                                </div>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Sold By : </h6>
                                <h5>Fresho</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Quantity : </h6>
                                <h5>250 G</h5>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="order-box dashboard-bg-box">
                      <div class="order-container">
                        <div class="order-icon">
                          <i data-feather="box"></i>
                        </div>

                        <div class="order-detail">
                          <h4>Delivered <span class="success-bg">Success</span></h4>
                          <h6 class="text-content">Caerphilly port-salut parmesan pecorino
                            croque monsieur dolcelatte melted cheese cheese and wine.</h6>
                        </div>
                      </div>

                      <div class="product-order-detail">
                        <a href="product-left-thumbnail.html" class="order-image">
                          <img src="../assets/images/vegetable/product/4.png"
                               class="blur-up lazyload" alt="">
                        </a>

                        <div class="order-wrap">
                          <a href="product-left-thumbnail.html">
                            <h3>SnackAmor Combo Pack of Jowar Stick and Jowar Chips</h3>
                          </a>
                          <p class="text-content">The big cheese cream cheese pepper jack
                            cheese slices danish fontina everyone loves cheese on toast
                            bavarian bergkase.</p>
                          <ul class="product-size">
                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Price : </h6>
                                <h5>$20.68</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Rate : </h6>
                                <div class="product-rating ms-2">
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
                                </div>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Sold By : </h6>
                                <h5>Fresho</h5>
                              </div>
                            </li>

                            <li>
                              <div class="size-box">
                                <h6 class="text-content">Quantity : </h6>
                                <h5>250 G</h5>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="tab-pane fade show" id="pills-address" role="tabpanel"
                   aria-labelledby="pills-address-tab">
                <div class="dashboard-address">
                  <div class="title title-flex">
                    <div>
                      <h2>My Address Book</h2>
                      <span class="title-leaf">
                        <svg class="icon-width bg-gray">
                            <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                        </svg>
                      </span>
                    </div>

                    <button class="btn theme-bg-color text-white btn-sm fw-bold mt-lg-0 mt-3"
                            data-bs-toggle="modal" data-bs-target="#add-address"><i data-feather="plus"
                                                                                    class="me-2"></i> Add New Address</button>
                  </div>

                  <div class="row g-sm-4 g-3">
                <%
                  Vector<Address> addressVector = (Vector<Address>) request.getAttribute("address");
                  if(addressVector != null){
                    for(Address item : addressVector){
                %>
                    <div class="col-xxl-4 col-xl-6 col-lg-12 col-md-6">
                      <div class="address-box">
                        <div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="jack"
                                   id="flexRadioDefault2" checked>
                          </div>

                          <div class="label">
                            <label><%=item.getTen_goi_nho()%></label>
                          </div>

                          <div class="table-responsive address-table">
                            <table class="table">
                              <tbody>
                              <tr>
                                <td colspan="2"><%=item.getName()%></td>
                              </tr>

                              <tr>
                                <td>Address :</td>
                                <td>
                                  <p><%=item.getAddress_name()%>
                                  </p>
                                </td>
                              </tr>

                              <tr>
                                <td>Email :</td>
                                <td><%=item.getEmail()%></td>
                              </tr>

                              <tr>
                                <td>Phone :</td>
                                <td><%=item.getPhone()%></td>
                              </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>

                        <div class="button-group">
                          <button class="btn btn-sm add-button w-100" data-bs-toggle="modal"
                                  data-bs-target="#editProfile"><i data-feather="edit"></i>
                            Edit</button>
                          <button class="btn btn-sm add-button w-100" data-bs-toggle="modal"
                                  data-bs-target="#removeProfile"><i data-feather="trash-2"></i>
                            Remove</button>
                        </div>
                      </div>
                    </div>
                  <%
                      }
                    }
                  %>
                  </div>

                </div>
              </div>
              <div class="tab-pane fade show" id="pills-profile" role="tabpanel"
                   aria-labelledby="pills-profile-tab">
                <div class="dashboard-profile">
                  <div class="title">
                    <h2>My Profile</h2>
                    <span class="title-leaf">
                                              <svg class="icon-width bg-gray">
                                                  <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                              </svg>
                                          </span>
                  </div>

                  <div class="profile-detail dashboard-bg-box">
                    <div class="dashboard-title">
                      <h3>Profile Name</h3>
                    </div>
                    <div class="profile-name-detail">
                      <div class="d-sm-flex align-items-center d-block">
                        <h3></h3>
                        <div class="product-rating profile-rating">
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
                              <i data-feather="star"></i>
                            </li>
                            <li>
                              <i data-feather="star"></i>
                            </li>
                          </ul>
                        </div>
                      </div>

                      <a href="javascript:void(0)" data-bs-toggle="modal"
                         data-bs-target="#editProfile">Edit</a>
                    </div>

                    <div class="location-profile">
                      <ul>
                        <li>
                          <div class="location-box">
                            <i data-feather="map-pin"></i>
                            <h6>Downers Grove, IL</h6>
                          </div>
                        </li>

                        <li>
                          <div class="location-box">
                            <i data-feather="mail"></i>
                            <h6>vicki.pope@gmail.com</h6>
                          </div>
                        </li>

                        <li>
                          <div class="location-box">
                            <i data-feather="check-square"></i>
                            <h6>Licensed for 2 years</h6>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div class="profile-description">
                      <p>Residences can be classified by and how they are connected to
                        neighbouring residences and land. Different types of housing tenure can
                        be used for the same physical type.</p>
                    </div>
                  </div>

                  <div class="profile-about dashboard-bg-box">
                    <div class="row">
                      <div class="col-xxl-7">
                        <div class="dashboard-title mb-3">
                          <h3>Profile About</h3>
                        </div>

                        <div class="table-responsive">
                          <table class="table">
                            <tbody>
                            <tr>
                              <td>Gender :</td>
                              <td>Female</td>
                            </tr>
                            <tr>
                              <td>Birthday :</td>
                              <td>21/05/1997</td>
                            </tr>
                            <tr>
                              <td>Phone Number :</td>
                              <td>
                                <a href="javascript:void(0)"> +91 846 - 547 -
                                  210</a>
                              </td>
                            </tr>
                            <tr>
                              <td>Address :</td>
                              <td>549 Sulphur Springs Road, Downers, IL</td>
                            </tr>
                            </tbody>
                          </table>
                        </div>

                        <div class="dashboard-title mb-3">
                          <h3>Login Details</h3>
                        </div>

                        <div class="table-responsive">
                          <table class="table">
                            <tbody>
                            <tr>
                              <td>Email :</td>
                              <td>
                                <a href="javascript:void(0)">vicki.pope@gmail.com
                                  <span data-bs-toggle="modal"
                                        data-bs-target="#editProfile">Edit</span></a>
                              </td>
                            </tr>
                            <tr>
                              <td>Password :</td>
                              <td>
                                <a href="javascript:void(0)">●●●●●●
                                  <span data-bs-toggle="modal"
                                        data-bs-target="#editProfile">Edit</span></a>
                              </td>
                            </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>

                      <div class="col-xxl-5">
                        <div class="profile-image">
                          <img src="../assets/images/inner-page/dashboard-profile.png"
                               class="img-fluid blur-up lazyload" alt="">
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>

              <div class="tab-pane fade show" id="pills-security" role="tabpanel"
                   aria-labelledby="pills-security-tab">
                <div class="dashboard-privacy">
                  <div class="dashboard-bg-box">
                    <div class="dashboard-title mb-4">
                      <h3>Privacy</h3>
                    </div>

                    <div class="privacy-box">
                      <div class="d-flex align-items-start">
                        <h6>Allows others to see my profile</h6>
                        <div class="form-check form-switch switch-radio ms-auto">
                          <input class="form-check-input" type="checkbox" role="switch"
                                 id="redio" aria-checked="false">
                          <label class="form-check-label" for="redio"></label>
                        </div>
                      </div>

                      <p class="text-content">all peoples will be able to see my profile</p>
                    </div>

                    <div class="privacy-box">
                      <div class="d-flex align-items-start">
                        <h6>who has save this profile only that people see my profile</h6>
                        <div class="form-check form-switch switch-radio ms-auto">
                          <input class="form-check-input" type="checkbox" role="switch"
                                 id="redio2" aria-checked="false">
                          <label class="form-check-label" for="redio2"></label>
                        </div>
                      </div>

                      <p class="text-content">all peoples will not be able to see my profile</p>
                    </div>

                    <button class="btn theme-bg-color btn-md fw-bold mt-4 text-white">Save
                      Changes</button>
                  </div>

                  <div class="dashboard-bg-box mt-4">
                    <div class="dashboard-title mb-4">
                      <h3>Account settings</h3>
                    </div>

                    <div class="privacy-box">
                      <div class="d-flex align-items-start">
                        <h6>Deleting Your Account Will Permanently</h6>
                        <div class="form-check form-switch switch-radio ms-auto">
                          <input class="form-check-input" type="checkbox" role="switch"
                                 id="redio3" aria-checked="false">
                          <label class="form-check-label" for="redio3"></label>
                        </div>
                      </div>
                      <p class="text-content">Once your account is deleted, you will be logged out
                        and will be unable to log in back.</p>
                    </div>

                    <div class="privacy-box">
                      <div class="d-flex align-items-start">
                        <h6>Deleting Your Account Will Temporary</h6>
                        <div class="form-check form-switch switch-radio ms-auto">
                          <input class="form-check-input" type="checkbox" role="switch"
                                 id="redio4" aria-checked="false">
                          <label class="form-check-label" for="redio4"></label>
                        </div>
                      </div>

                      <p class="text-content">Once your account is deleted, you will be logged out
                        and you will be create new account</p>
                    </div>

                    <button class="btn theme-bg-color btn-md fw-bold mt-4 text-white">Delete My
                      Account</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

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
  <!-- Footer Section End -->

  <!-- Deal Box Modal Start -->
  <div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <div>
            <h5 class="modal-title w-100" id="deal_today">Deal Today</h5>
            <p class="mt-1 text-content">Recommended deals for you.</p>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="deal-offer-box">
            <ul class="deal-offer-list">
              <li class="list-1">
                <div class="deal-offer-contain">
                  <a href="shop-left-sidebar.html" class="deal-image">
                    <img src="../assets/images/vegetable/product/10.png" class="blur-up lazyload"
                         alt="">
                  </a>

                  <a href="shop-left-sidebar.html" class="deal-contain">
                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                  </a>
                </div>
              </li>

              <li class="list-2">
                <div class="deal-offer-contain">
                  <a href="shop-left-sidebar.html" class="deal-image">
                    <img src="../assets/images/vegetable/product/11.png" class="blur-up lazyload"
                         alt="">
                  </a>

                  <a href="shop-left-sidebar.html" class="deal-contain">
                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                  </a>
                </div>
              </li>

              <li class="list-3">
                <div class="deal-offer-contain">
                  <a href="shop-left-sidebar.html" class="deal-image">
                    <img src="../assets/images/vegetable/product/12.png" class="blur-up lazyload"
                         alt="">
                  </a>

                  <a href="shop-left-sidebar.html" class="deal-contain">
                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                  </a>
                </div>
              </li>

              <li class="list-1">
                <div class="deal-offer-contain">
                  <a href="shop-left-sidebar.html" class="deal-image">
                    <img src="../assets/images/vegetable/product/13.png" class="blur-up lazyload"
                         alt="">
                  </a>

                  <a href="shop-left-sidebar.html" class="deal-contain">
                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
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

  <!-- Add address modal box start -->
  <div class="modal fade theme-modal" id="add-address" tabindex="-1" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add a new address</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
          <form action="address" method="post">
            <div class="modal-body">
              <div class="form-floating mb-4 theme-form-floating">
                <input type="text" class="form-control" name="name" id="fname" placeholder="Nhập tên người nhận" value="<%=customer.getName()%>">
                <label for="fname">Tên người nhận </label>
              </div>

              <div class="form-floating mb-4 theme-form-floating">
                <input type="email" class="form-control"name="email" id="email" placeholder="Nhập Email" value="<%=customer.getEmail()%>">
                <label for="email">Email </label>
              </div>

              <div class="form-floating mb-4 theme-form-floating">
                <input type="text" class="form-control" name="phone" id="phone" placeholder="Số điện thoại " value="<%=customer.getPhone()%>">
                <label for="phone">Số điện thoại</label>
              </div>

              <div class="form-floating mb-4 theme-form-floating">
                <input type="text" class="form-control" name="address" id="address" placeholder="Nhập địa chỉ">
                <label for="address">Địa chỉ</label>
              </div>

              <div class="form-floating mb-4 theme-form-floating">
                <input type="text" class="form-control" name="ten_nho" id="name" placeholder="Nhập Tên Gợi">
                <label for="name">Tên Gợi Nhớ</label>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn theme-bg-color btn-md text-white" data-bs-dismiss="modal">Thêm địa chỉ</button>
            </div>
          </form>
      </div>
    </div>
  </div>
  <!-- Add address modal box end -->

  <!-- Location Modal Start -->
  <div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
       aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel1">Choose your Delivery Location</h5>
          <p class="mt-1 text-content">Enter your address and we will specify the offer for your area.</p>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="location-list">
            <div class="search-input">
              <input type="search" class="form-control" placeholder="Search Your Area">
              <i class="fa-solid fa-magnifying-glass"></i>
            </div>

            <div class="disabled-box">
              <h6>Select a Location</h6>
            </div>

            <ul class="location-select custom-height">
              <li>
                <a href="javascript:void(0)">
                  <h6>Alabama</h6>
                  <span>Min: $130</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Arizona</h6>
                  <span>Min: $150</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>California</h6>
                  <span>Min: $110</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Colorado</h6>
                  <span>Min: $140</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Florida</h6>
                  <span>Min: $160</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Georgia</h6>
                  <span>Min: $120</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Kansas</h6>
                  <span>Min: $170</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Minnesota</h6>
                  <span>Min: $120</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>New York</h6>
                  <span>Min: $110</span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)">
                  <h6>Washington</h6>
                  <span>Min: $130</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Location Modal End -->

  <!-- Edit Profile Start -->
  <div class="modal fade theme-modal" id="editProfile" tabindex="-1" aria-labelledby="exampleModalLabel2"
       aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel2">Edit Profile</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="row g-4">
            <div class="col-xxl-12">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="pname" value="Jack Jennas">
                  <label for="pname">Full Name</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-6">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="email" class="form-control" id="email1" value="vicki.pope@gmail.com">
                  <label for="email1">Email address</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-6">
              <form>
                <div class="form-floating theme-form-floating">
                  <input class="form-control" type="tel" value="4567891234" name="mobile" id="mobile"
                         maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value =
                                              this.value.slice(0, this.maxLength);">
                  <label for="mobile">Email address</label>
                </div>
              </form>
            </div>

            <div class="col-12">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="address1"
                         value="8424 James Lane South San Francisco">
                  <label for="address1">Add Address</label>
                </div>
              </form>
            </div>

            <div class="col-12">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="address2" value="CA 94080">
                  <label for="address2">Add Address 2</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-4">
              <form>
                <div class="form-floating theme-form-floating">
                  <select class="form-select" id="floatingSelect1"
                          aria-label="Floating label select example">
                    <option selected>Choose Your Country</option>
                    <option value="kindom">United Kingdom</option>
                    <option value="states">United States</option>
                    <option value="fra">France</option>
                    <option value="china">China</option>
                    <option value="spain">Spain</option>
                    <option value="italy">Italy</option>
                    <option value="turkey">Turkey</option>
                    <option value="germany">Germany</option>
                    <option value="russian">Russian Federation</option>
                    <option value="malay">Malaysia</option>
                    <option value="mexico">Mexico</option>
                    <option value="austria">Austria</option>
                    <option value="hong">Hong Kong SAR, China</option>
                    <option value="ukraine">Ukraine</option>
                    <option value="thailand">Thailand</option>
                    <option value="saudi">Saudi Arabia</option>
                    <option value="canada">Canada</option>
                    <option value="singa">Singapore</option>
                  </select>
                  <label for="floatingSelect">Country</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-4">
              <form>
                <div class="form-floating theme-form-floating">
                  <select class="form-select" id="floatingSelect">
                    <option selected>Choose Your City</option>
                    <option value="kindom">India</option>
                    <option value="states">Canada</option>
                    <option value="fra">Dubai</option>
                    <option value="china">Los Angeles</option>
                    <option value="spain">Thailand</option>
                  </select>
                  <label for="floatingSelect">City</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-4">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="address3" value="94080">
                  <label for="address3">Pin Code</label>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-animation btn-md fw-bold"
                  data-bs-dismiss="modal">Close</button>
          <button type="button" data-bs-dismiss="modal"
                  class="btn theme-bg-color btn-md fw-bold text-light">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Edit Profile End -->

  <!-- Edit Card Start -->
  <div class="modal fade theme-modal" id="editCard" tabindex="-1" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel8">Edit Card</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="row g-4">
            <div class="col-xxl-6">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="finame" value="Mark">
                  <label for="finame">First Name</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-6">
              <form>
                <div class="form-floating theme-form-floating">
                  <input type="text" class="form-control" id="laname" value="Jecno">
                  <label for="laname">Last Name</label>
                </div>
              </form>
            </div>

            <div class="col-xxl-4">
              <form>
                <div class="form-floating theme-form-floating">
                  <select class="form-select" id="floatingSelect12"
                          aria-label="Floating label select example">
                    <option selected>Card Type</option>
                    <option value="kindom">Visa Card</option>
                    <option value="states">MasterCard Card</option>
                    <option value="fra">RuPay Card</option>
                    <option value="china">Contactless Card</option>
                    <option value="spain">Maestro Card</option>
                  </select>
                  <label for="floatingSelect12">Card Type</label>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-animation btn-md fw-bold"
                  data-bs-dismiss="modal">Cancel</button>
          <button type="button" class="btn theme-bg-color btn-md fw-bold text-light">Update Card</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Edit Card End -->

  <!-- Remove Profile Modal Start -->
  <div class="modal fade theme-modal remove-profile" id="removeProfile" tabindex="-1"
       aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header d-block text-center">
          <h5 class="modal-title w-100" id="exampleModalLabel22">Are You Sure ?</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="remove-box">
            <p>The permission for the use/group, preview is inherited from the object, object will create a
              new permission for this object</p>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-dismiss="modal">No</button>
          <button type="button" class="btn theme-bg-color btn-md fw-bold text-light"
                  data-bs-target="#removeAddress" data-bs-toggle="modal">Yes</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade theme-modal remove-profile" id="removeAddress" tabindex="-1"
       aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-center" id="exampleModalLabel12">Done!</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <div class="remove-box text-center">
            <h4 class="text-content">It's Removed.</h4>
          </div>
        </div>
        <div class="modal-footer pt-0">
          <button type="button" class="btn theme-bg-color btn-md fw-bold text-light"
                  data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Remove Profile Modal End -->

  <!-- Bg overlay Start -->
  <div class="bg-overlay"></div>
  <!-- Bg overlay End -->

  <!-- latest jquery-->
  <script src="${pageContext.request.contextPath}/template/assets/js/jquery-3.6.0.min.js"></script>

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

  <!-- Wizard js -->
  <script src="${pageContext.request.contextPath}/template/assets/js/wizard.js"></script>

  <!-- Slick js-->
  <script src="${pageContext.request.contextPath}/template/assets/js/slick/slick.js"></script>
  <script src="${pageContext.request.contextPath}/template/assets/js/slick/custom_slick.js"></script>

  <!-- Quantity js -->
  <script src="${pageContext.request.contextPath}/template/assets/js/quantity-2.js"></script>

  <!-- Nav & tab upside js -->
  <script src="${pageContext.request.contextPath}/template/assets/js/nav-tab.js"></script>

  <!-- script js -->
  <script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script></body>
</body>
</html>