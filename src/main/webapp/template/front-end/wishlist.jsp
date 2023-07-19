<%@ page import="java.util.Vector" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Order_item" %>
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
    <title>Wishlist</title>

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
                                        <a href="contact-us.html" class="delivery-login-box">
                                            <div class="delivery-icon">
                                                <i data-feather="phone-call"></i>
                                            </div>
                                            <div class="delivery-detail">
                                                <h6>Giao hàng 24/7</h6>
                                                <h5>+84 373801816</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="right-side">
                                        <a href="wishlist" class="btn p-0 position-relative header-wishlist">
                                            <i data-feather="heart"></i>
                                        </a>
                                    </li>
                                    <%
                                        Vector<Order_item> order_itemVector = (Vector<Order_item>) session.getAttribute("cart_list");
                                        int quantityOI = 0;
                                        if(order_itemVector != null )quantityOI = order_itemVector.size();
                                    %>
                                    <li class="right-side">
                                        <div class="onhover-dropdown header-badge">
                                            <button type="button" class="btn p-0 position-relative header-wishlist">
                                                <i data-feather="shopping-cart"></i>
                                                <span class="position-absolute top-0 start-100 translate-middle badge">
                                                <%=quantityOI%>
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>
                                            </button>

                                            <div class="onhover-div">
                                                <ul class="cart-list">
                                                    <%

                                                        if(order_itemVector != null){
                                                            for(Order_item item : order_itemVector){


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
                                                                <h6><span><%=item.getQuantity()%> x</span> $<%=item.getPrice()%></h6>
                                                                <button class="close-button close_button">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </ul>

                                                <div class="price-box">
                                                    <h5>Tổng :</h5>
                                                    <%
                                                        if(session.getAttribute("totalMoney") != null){
                                                    %>
                                                    <h4 class="theme-color fw-bold">$ <%=session.getAttribute("totalMoney")%></h4>
                                                    <%
                                                    }else {
                                                    %>
                                                    <h4 class="theme-color fw-bold">0</h4>
                                                    <%}%>
                                                </div>

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
                                                    Customer cus = (Customer) session.getAttribute("customer");
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
    <section class="breadscrumb-section pt-0">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="breadscrumb-contain">
                        <h2>Wishlist</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="home">
                                        <i class="fa-solid fa-house"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Wishlist Section Start -->
    <section class="wishlist-section section-b-space">
        <div class="container-fluid-lg">
            <div class="row g-sm-3 g-2">
            <%
                Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
                for(Product temp : vector){
            %>
                <div class="col-xxl-2 col-lg-3 col-md-4 col-6 product-box-contain">
                    <div class="product-box-3 h-100">
                        <div class="product-header">
                            <div class="product-image">
                                <a href="product-detail.jsp">
                                    <img src="<%=temp.getImage()%>" class="img-fluid blur-up lazyload"
                                        alt="">
                                </a>

                                <div class="product-header-top">
                                    <form action="wishlist" method="get">
                                        <input type="hidden" name="service" value="cancelWishlist">
                                        <button class="btn wishlist-button close_button" type="submit" name="cancel" value="<%=temp.getProduct_id()%>">
                                            <i data-feather="x"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="product-footer">
                            <div class="product-detail">
                                <span class="span-name"><%=temp.getCategory_name()%></span>
                                <a href="product-detail.jsp">
                                    <h5 class="name"><%= temp.getProduct_name()%></h5>
                                </a>
                                <h6 class="unit mt-1"><%=temp.getVolume()%></h6>
                                <h5 class="price">
                                    <span class="theme-color">$<%=temp.getPrice()%></span>
                                    <del>$15.15</del>
                                </h5>

                                <div class="add-to-cart-box bg-white mt-2">
                                    <button class="btn btn-add-cart addcart-button"
                                            onclick="location.href = 'cart?service=addToCart&pro_id=<%=temp.getProduct_id()%>';">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%}%>

    </section>
    <!-- Wishlist Section End -->

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

    <!-- Location Modal Start -->
    <div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chọn vị trí của bạn</h5>
                    <p class="mt-1 text-content">Nhập địa chỉ và để xem ưu đãi hấp dẫn</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="location-list">
                        <div class="search-input">
                            <input type="search" class="form-control" placeholder="Tìm kiếm">
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
                        <h5 class="modal-title w-100" id="deal_today">Giảm giá hôm nay</h5>
                        <p class="mt-1 text-content">Đề xuất cho bạn</p>
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
                                    <a href="home.jsp" class="deal-image">
                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                            alt="">
                                    </a>

                                    <a href="home.jsp" class="deal-contain">
                                        <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                        <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                    </a>
                                </div>
                            </li>

                            <li class="list-2">
                                <div class="deal-offer-contain">
                                    <a href="home.jsp" class="deal-image">
                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                            alt="">
                                    </a>

                                    <a href="home.jsp" class="deal-contain">
                                        <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                        <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                    </a>
                                </div>
                            </li>

                            <li class="list-3">
                                <div class="deal-offer-contain">
                                    <a href="home.jsp" class="deal-image">
                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                            alt="">
                                    </a>

                                    <a href="home.jsp" class="deal-contain">
                                        <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                        <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                    </a>
                                </div>
                            </li>

                            <li class="list-1">
                                <div class="deal-offer-contain">
                                    <a href="home.jsp" class="deal-image">
                                        <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                            alt="">
                                    </a>

                                    <a href="home.jsp" class="deal-contain">
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

    <!-- latest jquery-->
    <script src="${pageContext.request.contextPath}/template/assets/js/jquery-3.6.0.min.js"></script>

    <!-- jquery ui-->
    <script src="${pageContext.request.contextPath}/template/assets/js/jquery-ui.min.js"></script>

    <!-- Bootstrap js-->
    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/assets/js/bootstrap/bootstrap-notify.min.js"></script>

    <!-- feather icon js-->
    <script src="${pageContext.request.contextPath}/template/assets/js/feather/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/assets/js/feather/feather-icon.js"></script>

    <!-- Lazyload Js -->
    <script src="${pageContext.request.contextPath}/template/assets/js/lazysizes.min.js"></script>

    <!-- Slick js-->
    <script src="${pageContext.request.contextPath}/template/assets/js/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/template/assets/js/slick/custom_slick.js"></script>

    <!-- Quantity js -->
    <script src="${pageContext.request.contextPath}/template/assets/js/quantity-2.js"></script>

    <!-- script js -->
    <script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script>
</body>

</html>