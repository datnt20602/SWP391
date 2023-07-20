<%@ page import="Model.Product" %>
<%@ page import="Model.Order_item" %>
<%@ page import="java.util.Vector" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Feedback" %>
<%@ page import="java.util.ArrayList" %>
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
    <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/vendors/bootstrap.css">

    <!-- wow css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/animate.min.css" />

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
                                <button class="btn location-button" data-bs-toggle=""
                                        data-bs-target="#locationModal">

                                    <span class="locat-name">Chúc bạn ngày mới tốt lành.</span>

                                </button>
                            </div>

                            <div class="search-box">
                                <div class="input-group">
                                    <input onchange="searchByName(this)" type="text" class="form-control" placeholder="Tìm kiếm..."
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
                                    <a href="contactus" class="delivery-login-box">
                                        <div class="delivery-icon">
                                            <i data-feather="phone-call"></i>
                                        </div>
                                        <div class="delivery-detail">
                                            <h6>Giao hàng 24/7</h6>
                                            <h5>+84 373801816</h5>
                                        </div>
                                    </a>
                                </li>
                                <%
                                    Customer cus = (Customer) session.getAttribute("customer");
                                    int quantity;
                                    if(cus != null) {
                                        ArrayList<Integer> pro_list1 = (ArrayList<Integer>) session.getAttribute("quantityWishlist");

                                        if (pro_list1 == null) {
                                            quantity = 0;
                                        } else {
                                            quantity = pro_list1.size();
                                        }
                                    }else {
                                        quantity = 0;
                                    }

                                %>
                                <li class="right-side" >
                                    <a href="wishlist" class="btn p-0 position-relative header-wishlist" id="wishlist">
                                        <i data-feather="heart"></i>
                                        <span  class="position-absolute top-0 start-100 translate-middle badge"><%=quantity%>
                                                </span>
                                    </a>
                                </li >
                                <%
                                    Vector<Order_item> order_itemVector = (Vector<Order_item>) session.getAttribute("cart_list");
                                    int quantityOI = 0;
                                    if(order_itemVector != null )quantityOI = order_itemVector.size();
                                %>
                                <li class="right-side" >
                                    <div class="onhover-dropdown header-badge"  >
                                        <button type="button" class="btn p-0 position-relative header-wishlist">
                                            <i data-feather="shopping-cart"></i>
                                            <span class="position-absolute top-0 start-100 translate-middle badge" id = "quantityOI">
                                                <%=quantityOI%>
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>
                                        </button>

                                        <div class="onhover-div">
                                            <ul class="cart-list" id = "cart-list" >
                                                <%

                                                    if(order_itemVector != null){
                                                        int i = 0 ;
                                                        for(Order_item item : order_itemVector){
                                                            i++;
                                                            if(i <= 3){

                                                %>

                                                <li class="product-box-contain">
                                                    <div class="drop-cart">
                                                        <a href="productdetail" class="drop-image">
                                                            <img src="<%=item.getProduct().getImage()%>"
                                                                 class="blur-up lazyload" alt="">
                                                        </a>

                                                        <div class="drop-contain">
                                                            <a href="productdetail">
                                                                <h5><%=item.getProduct().getProduct_name()%></h5>
                                                            </a>
                                                            <h6><span><%=item.getQuantity()%> x</span> <%=item.getPrice()%>00 VND</h6>
                                                            <button class="close-button close_button">
                                                                <i class="fa-solid fa-xmark"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </li>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                            </ul>
                                            <div class="button-group">
                                                <a href="cart" class="btn btn-sm cart-button">Giỏ hàng</a>
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
                                            <%
                                                if(cus != null)
                                                {
                                            %>
                                            <h5><%=cus.getName()%></h5>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>

                                    <div class="onhover-div onhover-div-login">
                                        <ul class="user-box-name">
                                            <c:if test="${customer == null}">
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
                                            <c:if test="${customer != null}">
                                                <li class="product-box-contain">
                                                    <a href="customer">Thông tin cá nhân</a>
                                                </li>
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
<section class="breadscrumb-section pt-0" style="background-color:darkseagreen">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="breadscrumb-contain" >
                    <h2><%=product.getProduct_name()%></h2>

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
                                                <img src="<%= product.getImage()%>" id="img-1" alt="" width="410" height="500" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="right-box-contain">
                            <h2 class="name"><%= product.getProduct_name()%></h2>
                            <div class="price-rating">
                                <h3 class="price"><%= product.getPrice()%>

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

                            <div class="product-contain">
                                <p>
                                <h4  class="desription"><%=product.getDescribe()%> </h4>
                                </p>
                            </div>
                            <div class="time deal-timer product-deal-timer mx-md-0 mx-auto" id="clockdiv-1"
                                 data-hours="1" data-minutes="2" data-seconds="3">
                                <div class="product-title">
                                    <h4>Hurry up! Sales Ends In</h4>
                                </div>

                            </div>
                            <form action="cart" method="get">
                                <input type="hidden" name="service" value="addToCart">
                                <input type="hidden" name="pro_id" value="<%=product.getProduct_id()%>">
                                <input type="hidden" name="redirect" value="dfjhdfjhg">
                                <div class="note-box product-packege">
                                    <div class="cart_qty qty-box product-qty">
                                        <div class="input-group">
                                            <button type="button" class="btn qty-left-minus"
                                                    data-type="minus" data-field="">
                                                <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                            </button>
                                            <input class="form-control input-number qty-input" type="text"
                                                   name="quantity" value="1">
                                            <button type="button" class="btn qty-right-plus"
                                                    data-type="plus" data-field="">
                                                <i class="fa fa-plus ms-0" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <button type="submit"
                                            class="btn btn-md bg-dark cart-button text-white w-100">Thêm vào giỏ hàng</button>
                                </div>
                            </form>
                            <div class="buy-box">
                                <a href="wishlist">
                                    <i data-feather="heart"></i>
                                    <span>Thêm vào wishlist </span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="product-section-box">
                            <ul class="nav nav-tabs custom-nav" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="description-tab" data-bs-toggle="tab"
                                            data-bs-target="#description" type="button" role="tab"
                                            aria-controls="description" aria-selected="true">Mô tả

                                    </button>

                                </li>



                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="review-tab" data-bs-toggle="tab"
                                            data-bs-target="#review" type="button" role="tab" aria-controls="review"
                                            aria-selected="false">Feedback của khách hàng</button>
                                </li>

                            </ul>

                            <div class="tab-content custom-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="description" role="tabpanel"
                                     aria-labelledby="description-tab">
                                    <div class="product-description">
                                        <div class="nav-desh">
                                            <p>
                                            <div class ="right-box-contain">
                                                <h4 class ="offer-top" > <%=product.getDescribe()%> </h4>
                                            </div>
                                            </p>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                                    <div class="review-box">
                                        <div class="row g-4">

                                            <div class="col-xl-6">
                                                <form action="productdetail" method="post">
                                                    <input type="hidden" name="pro_id" value="<%=product.getProduct_id()%>">
                                                    <div class="review-title">
                                                        <h4 class="fw-500">Thêm đánh giá</h4>
                                                    </div>

                                                    <div class="row g-4">
                                                        <%
                                                            if(cus != null){
                                                        %>
                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="text" class="form-control"
                                                                       placeholder="Tên" value="<%= cus.getName()%>" readonly="readonly">
                                                                <label >Tên</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="email" class="form-control"
                                                                       placeholder="Email" value="<%=cus.getEmail()%>" readonly="readonly">
                                                                <label >Địa chỉ email</label>
                                                            </div>
                                                        </div>
                                                        <%
                                                            }else {
                                                        %>
                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="text" class="form-control" id="name"
                                                                       placeholder="Tên" value="" required>
                                                                <label for="name">Tên</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-floating theme-form-floating">
                                                                <input type="email" class="form-control" id="email"
                                                                       placeholder="Email" value="" required>
                                                                <label for="email">Địa chỉ email</label>
                                                            </div>
                                                        </div>
                                                        <%
                                                            }
                                                        %>
                                                        <div class="col-12">
                                                            <div class="form-floating theme-form-floating">
                                                                <textarea name="content" class="form-control"
                                                                          placeholder="Nhận xét của bạn"
                                                                          id="floatingTextarea2"
                                                                          style="height: 150px" required></textarea>
                                                                <label for="floatingTextarea2">Nhận xét của bạn</label>
                                                            </div>
                                                        </div>
                                                        <button type="submit"
                                                                class="btn btn-md bg-dark cart-button text-white w-100">Đăng</button>
                                                    </div>

                                                </form>
                                            </div>

                                        </div>
                                        <div class="review-title">
                                            <h4 class="fw-500">Đánh giá của khách hàng</h4>
                                        </div>

                                        <div class="review-people">
                                            <ul class="review-list">
                                                <%
                                                    Vector<Feedback> feedbackVector = (Vector<Feedback>) request.getAttribute("feedbackVector");
                                                    if(feedbackVector != null){
                                                        for(Feedback item : feedbackVector){
                                                %>
                                                <li>
                                                    <div class="people-box">
                                                        <div class="people-comment">
                                                            <a class="name"
                                                               href="javascript:void(0)"><%=item.getCustomer().getName()%></a>
                                                            <div class="date-time">
                                                                <h6 class="text-content"><%=item.getDate()%></h6>
                                                            </div>
                                                            <div class="reply">
                                                                <p>
                                                                    <%= item.getContent()%>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </ul>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <div class="col-xxl-3 col-xl-4 col-lg-5 d-none d-lg-block wow fadeInUp">
                <div class="right-sidebar-box">
                    <!-- Trending Product -->
                    <div class="pt-25">
                        <div class="category-menu">
                            <h3>Trending Products</h3>

                            <ul class="product-list product-right-sidebar border-0 p-0">
                                <%
                                    Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
                                    if(vector != null){
                                        for (Product item : vector){
                                %>
                                <li>
                                    <div class="offer-product">
                                        <a href="productdetail?pro_id=<%=item.getProduct_id()%>" class="offer-image">
                                            <img src="<%=item.getImage()%>"
                                                 class="img-fluid blur-up lazyload" alt="">
                                        </a>

                                        <div class="offer-detail">
                                            <div>
                                                <a href="productdetail?pro_id=<%=item.getProduct_id()%>">
                                                    <h6 class="name"><%=item.getProduct_name()%></h6>
                                                </a>
                                                <span><%=item.getVolume()%> ml</span>
                                                <h6 class="price theme-color">$ <%=item.getPrice()%></h6>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <%
                                        }
                                    }
                                %>
                            </ul>
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
                            <p>Chúng tôi là quán cà phê mà chắc chắn bạn nên thử và trải nghiệm. Rất hân hạnh được phục
                                vụ.</p>

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
                                <a href="" class="text-content">Về chúng tôi</a>
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
                                <a href="customer" class="text-content">Tài khoản</a>
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

<!-- Quick View Modal Box Start -->
<div class="modal fade theme-modal view-modal" id="view" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header p-0">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="row g-sm-4 g-2">
                    <div class="col-lg-6">
                        <div class="slider-image">
                            <img src="${pageContext.request.contextPath}/template/assets/images/product/category/1.jpg" class="img-fluid blur-up lazyload"
                                 alt="">
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="right-sidebar-modal">
                            <h4 class="title-name">Peanut Butter Bite Premium Butter Cookies 600 g</h4>
                            <h4 class="price">$36.99</h4>
                            <div class="product-rating">
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
                                <span class="ms-2">8 Reviews</span>
                                <span class="ms-2 text-danger">6 sold in last 16 hours</span>
                            </div>

                            <div class="product-detail">
                                <h4>Product Details :</h4>
                                <p>Candy canes sugar plum tart cotton candy chupa chups sugar plum chocolate I love.
                                    Caramels marshmallow icing dessert candy canes I love soufflé I love toffee.
                                    Marshmallow pie sweet sweet roll sesame snaps tiramisu jelly bear claw. Bonbon
                                    muffin I love carrot cake sugar plum dessert bonbon.</p>
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
                                    <option selected>Select Size</option>
                                    <option value="1.2">1/2 KG</option>
                                    <option value="0">1 KG</option>
                                    <option value="1.5">1/5 KG</option>
                                    <option value="red">Red Roses</option>
                                    <option value="pink">With Pink Roses</option>
                                </select>
                            </div>

                            <div class="modal-button">
                                <button onclick="location.href = 'cart.jsp';"
                                        class="btn btn-md add-cart-button icon">Add
                                    To Cart</button>
                                <button onclick="location.href = 'product-left.html';"
                                        class="btn theme-bg-color view-button icon text-white fw-bold btn-md">
                                    View More Details</button>
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
<div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chọn vị trí của bạn</h5>
                <p class="mt-1 text-content">Nhập vị trí để xem ưu đãi hấp dẫn</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="location-list">
                    <div class="search-input">
                        <input type="search" class="form-control" placeholder="Vị trí của bạn">
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
                                <a href="home" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-2">
                            <div class="deal-offer-contain">
                                <a href="home" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-3">
                            <div class="deal-offer-contain">
                                <a href="home" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="home" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home" class="deal-contain">
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

<!-- Add to cart Modal Start -->
<div class="add-cart-box">
    <div class="add-iamge">
        <img src="${pageContext.request.contextPath}/template/assets/images/cake/pro/1.jpg" class="img-fluid" alt="">
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
    <form action="cart" method="get">
        <input type="hidden" name="service" value="addToCart">
        <input type="hidden" name="pro_id" value="<%=product.getProduct_id()%>">
        <input type="hidden" name="redirect" value="dfjhdfjhg">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="cart-content">

                        <div class="product-image">
                            <img src="<%=product.getImage()%>" class="img-fluid blur-up lazyload"
                                 alt="">
                            <div class="content">
                                <h5><%= product.getProduct_name()%></h5>
                                <h6>$<%=product.getPrice()%></h6>
                            </div>
                        </div>
                        <div class="selection-section">
                            <div class="form-group mb-0">

                            </div>
                            <div class="cart_qty qty-box product-qty m-0">
                                <div class="input-group h-100">
                                    <button type="button" class="qty-left-minus" data-type="minus" data-field="">
                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                    </button>
                                    <input class="form-control input-number qty-input" type="text" name="quantity"
                                           value="1">
                                    <button type="button" class="qty-right-plus" data-type="plus" data-field="">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="add-btn">
                            <button type="submit"
                                    class="btn btn-md bg-dark cart-button text-white w-100">Thêm vào giỏ hàng</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
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