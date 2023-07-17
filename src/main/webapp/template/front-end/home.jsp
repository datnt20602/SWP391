<%@ page import="Model.Product" %>
<%@ page import="java.util.Vector" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import =" java.util.Vector,Model.Product" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="Dal.DAOProduct" %>
<%@ page import="Model.Order_item" %>
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
    <title>cofPhe Shop</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/pagination.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="/ODShop/template/assets/css/pagination.css">

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
                    <h2>Chào mừng tới cofPhe.</h2>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Poster Section Start -->
<section>
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="slider-1 slider-animate product-wrapper no-arrow">
                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="${pageContext.request.contextPath}/template/assets/images/shop/latte.jpg"
                                 class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Bắt đầu ngày mới với 1 ly cà phê !</h2>
                                    <h3>Giảm giá tới 25%</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="${pageContext.request.contextPath}/template/assets/images/shop/coffee1.jpeg"
                                 class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Đồ uống cho một ngày tuyệt vời !</h2>
                                    <h3>Mời bạn và bạn bè cùng thưởng thức.</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="${pageContext.request.contextPath}/template/assets/images/shop/coffee2.jpeg"
                                 class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Đồng hành cùng bạn là đồ uống của chúng tôi !</h2>
                                    <h3>Làm ơn chọn đồ uống phía dưới.</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Poster Section End -->

<!-- Shop Section Start -->
<section class="section-b-space shop-section">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-custome-3">
                <div class="left-box wow fadeInUp">
                    <div class="shop-left-sidebar">
                        <div class="back-button">
                            <h3><i class="fa-solid fa-arrow-left"></i> Back</h3>
                        </div>


                        <div class="accordion custome-accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">
                                        <span>Danh mục</span>
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show"
                                     aria-labelledby="headingOne">
                                    <div class="accordion-body">

                                        <ul class="category-list custom-padding custom-height">
                                            <form class="w-100 h-100" id="formCategories"
                                                  action="<%= (request.getParameter("service") == null) ? "home" : "home?service=" + request.getParameter("service")%>"
                                                  method="get">
                                                <c:forEach var="category" items="${listCategory}">
                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                ${categories.contains(category) ? "checked" : ""}
                                                                   value="${category}" name="category" id="${category}"
                                                                   class="categories">
                                                            <label class="form-check-label" for="${category}">
                                                                <span class="name"> ${category}</span>
                                                            </label>
                                                        </div>
                                                    </li>
                                                </c:forEach>

                                                <li>
                                                    <div class="form-check ps-0 m-0 category-list-box">

                                                    </div>
                                                </li>
                                            </form>
                                        </ul>
                                        <script>
                                            $(".category-list-box input[type=checkbox]").each(() => {
                                                $(this).change(() => {
                                                    $("#formCategories").submit();
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-custome-9">
                <div class="show-button">
                    <div class="filter-button-group mt-0">
                        <div class="filter-button d-inline-block d-lg-none">
                            <a><i class="fa-solid fa-filter"></i> Filter Menu</a>
                        </div>
                    </div>

                    <div class="top-filter-menu">
                        <div class="category-dropdown">
                            <h5 class="text-content">Sắp xếp theo:</h5>
                            <div class="dropdown">
                                <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"
                                        data-bs-toggle="dropdown">
                                    <span id="selectedOption">Mời chọn</span> <i class="fa-solid fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li onclick="updateSelectedOption('low')">
                                        <a class="dropdown-item" id="low" href="home?service=displayAllUp">Giá thấp -
                                            cao</a>
                                    </li>
                                    <li onclick="updateSelectedOption('high')">
                                        <a class="dropdown-item" id="high" href="home?service=displayAllReduce">Giá cao
                                            - thấp</a>
                                    </li>
                                    <li onclick="updateSelectedOption('normal')">
                                        <a class="dropdown-item" id="normal" href="home?service=displayAll">Tất cả</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="grid-option d-none d-md-block">
                            <ul>
                                <li class="three-grid">
                                    <a href="javascript:void(0)">
                                        <img src="${pageContext.request.contextPath}/template/assets/svg/grid-3.svg"
                                             class="blur-up lazyload" alt="">
                                    </a>
                                </li>
                                <li class="grid-btn d-xxl-inline-block d-none active">
                                    <a href="javascript:void(0)">
                                        <img src="${pageContext.request.contextPath}/template/assets/svg/grid-4.svg"
                                             class="blur-up lazyload d-lg-inline-block d-none" alt="">
                                        <img src="${pageContext.request.contextPath}/template/assets/svg/grid.svg"
                                             class="blur-up lazyload img-fluid d-lg-none d-inline-block" alt="">
                                    </a>
                                </li>
                                <li class="list-btn">
                                    <a href="javascript:void(0)">
                                        <img src="${pageContext.request.contextPath}/template/assets/svg/list.svg"
                                             class="blur-up lazyload" alt="">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%
                    Vector<Product> vector = (Vector<Product>) request.getAttribute("data");
                %>
                <div id="contentSearch"
                     class="row g-sm-4 g-3 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 product-list-section">
                    <%
                        for (Product temp : vector) {

                    %>
                    <div>
                        <div class="product-box-3 h-100 wow fadeInUp" data-wow-delay="0.6">
                            <div class="product-header">
                                <div class="product-image">
                                    <a href="productdetail?pro_id=<%=temp.getProduct_id()%>">
                                        <img src="<%=temp.getImage()%>"
                                             class="img-fluid blur-up lazyload" alt="">
                                    </a>

                                    <ul class="product-option">
                                        <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">
                                            <a style="padding-left: 95px" href="wishlist?service=addToWislist&pro_id=<%=temp.getProduct_id()%>" class="notifi-wishlist">
                                                <i data-feather="heart"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-footer">
                                <div class="product-detail">
                                    <span class="span-name"><%=temp.getCategory_name()%></span>
                                    <a href="productdetail">
                                        <h5 class="name"><%=temp.getProduct_name()%></h5>
                                    </a>
                                    <p class="text-content mt-1 mb-2 product-content"><%=temp.getDescribe()%></p>
                                    <div class="product-rating mt-2">
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
                                        <span>(4.0)</span>
                                    </div>
                                    <h6 class="unit"><%= temp.getVolume()%>ml</h6>
                                    <h5 class="price"><span class="theme-color"><%= temp.getPrice()%></span>
                                        <del>$15.15</del>
                                    </h5>
                                    <div class="add-to-cart-box bg-white">
                                        <button class="btn btn-add-cart addcart-button"
                                                onclick="location.href = 'cart?service=addToCart&pro_id=<%=temp.getProduct_id()%>';">Add
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div id="pagination"></div>

            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

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
                            <img src="${pageContext.request.contextPath}/template/assets/images/product/category/1.jpg"
                                 class="img-fluid blur-up lazyload"
                                 alt="">
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
                <h5 class="modal-title" id="exampleModalLabel">Mời bạn chọn vị trí</h5>
                <p class="mt-1 text-content">Nhập vị trí để xem ưu đãi hấp dẫn</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
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
                    <h5 class="modal-title w-100" id="deal_today">Giảm giá</h5>
                    <p class="mt-1 text-content">Đề xuất cho bạn.</p>
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
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/10.png"
                                         class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home.jsp" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-2">
                            <div class="deal-offer-contain">
                                <a href="home.jsp" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/11.png"
                                         class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home.jsp" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-3">
                            <div class="deal-offer-contain">
                                <a href="home.jsp" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/12.png"
                                         class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home.jsp" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="home.jsp" class="deal-image">
                                    <img src="${pageContext.request.contextPath}/template/assets/images/vegetable/product/13.png"
                                         class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="home.jsp" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
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
             class="img-fluid blur-up lazyload" alt="">
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

<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->

<!-- latest jquery-->

<script>
    function updateSelectedOption(optionId) {
        var selectedOptionText = document.getElementById("selectedOption");
        var selectedOptionItem = document.getElementById(optionId);

        if (selectedOptionItem) {
            selectedOptionText.innerText = selectedOptionItem.innerText;
            localStorage.setItem("selectedOption", selectedOptionItem.innerText);
        }
    }

    // Khôi phục giá trị đã chọn
    var selectedOptionText = document.getElementById("selectedOption");
    var savedOption = localStorage.getItem("selectedOption");
    if (savedOption) {
        selectedOptionText.innerText = savedOption;
    }

</script>

<script>
    function loadData(product) {
        var data = JSON.parse(product);
        console.log(data);
        document.getElementById("detailId").value = data.product_id;
        document.getElementById("detailName").value = data.product_name;
        document.getElementById("detailPrice").value = parseInt(data.price).toLocaleString();
        document.getElementById("detailImage").value = data.image;
        document.getElementById("detailVolume").value = data.volume;
        document.getElementById("detailDescribe").value = data.describe;
        document.getElementById("detailCategory").value = data.category_name;
    }

    function alertDelete(id) {
        document.getElementById("deleteId").value = id;
    }

    function toggleDelete() {
        var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var deleteDiv = document.getElementById('deleteDiv');
        deleteDiv.classList.toggle('active');
    }

    function toggle() {
        var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var popup = document.getElementById('popup');
        popup.classList.toggle('active');
    }

    var priceValue = document.querySelectorAll(".priceValue");
    priceValue.forEach(p => {
        var number = parseFloat(p.innerText);
        if (!isNaN(number)) {
            p.innerText = number.toLocaleString();
        }
    });

    var urlForCategory = "";
    var checked = document.querySelectorAll(".category-list-box input[type=checkbox]:checked");
    checked.forEach((check) => {
        urlForCategory += "&category=" + check.value;
        document.querySelector("#low").href += urlForCategory;
        document.querySelector("#high").href += urlForCategory;
        document.querySelector("#normal").href += urlForCategory;
    });
    let pages = ${totalPages};

    document.getElementById('pagination').innerHTML = createPagination(pages, ${pageNumber});

    function createPagination(pages, page) {
        let str = '<ul class="page">';
        let active;
        let pageCutLow = page - 1;
        let pageCutHigh = page + 1;

        // Show the Previous button only if you are on a page other than the first
        if (page > 1) {
            str += '<a style="color: black" href="home?page=' + (page - 1) + urlForCategory + '"><li onclick="createPagination(pages, ' + (page - 1) + ')" class="page__btn paging">&laquo;</li></a>';
        }
        // Show all the pagination elements if there are less than 6 pages total
        if (pages < 6) {
            for (let p = 1; p <= pages; p++) {
                active = page == p ? "active" : "";
                str += '<a style="color: black" href="home?page=' + p + urlForCategory + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
        }
        // Use "..." to collapse pages outside of a certain range
        else {
            // Show the very first page followed by a "..." at the beginning of the
            // pagination section (after the Previous button)
            if (page > 2) {
                str += '<a style="color: black" href="home?page=' + 1 + urlForCategory + '"><li onclick="createPagination(pages, 1)" class="page__numbers paging">1</li></a>';
                if (page > 3) {
                    str += `<li class="page__dots"><span>...</span></li>`;
                }
            }
            // Determine how many pages to show after the current page index
            if (page === 1) {
                pageCutHigh += 2;
            } else if (page === 2) {
                pageCutHigh += 1;
            }
            // Determine how many pages to show before the current page index
            if (page === pages) {
                pageCutLow -= 2;
            } else if (page === pages - 1) {
                pageCutLow -= 1;
            }
            // Output the indexes for pages that fall inside the range of pageCutLow
            // and pageCutHigh
            for (let p = pageCutLow; p <= pageCutHigh; p++) {
                if (p === 0) {
                    p += 1;
                }
                if (p > pages) {
                    continue
                }
                active = page == p ? "active" : "";
                str += '<a style="color: black" href="home?page=' + p + urlForCategory + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
            // Show the very last page preceded by a "..." at the end of the pagination
            // section (before the Next button)
            if (page < pages - 1) {
                if (page < pages - 2) {
                    str += '<li class="page__dots"><span>...</span></li>';
                }
                str += '<a style="color: black" href="home?page=' + pages + urlForCategory + '"><li onclick="createPagination(pages, pages)" class="page__numbers paging">' + pages + '</li></a>';
            }
        }
        // Show the Next button only if you are on a page other than the last
        if (page < pages) {
            str += '<a style="color: black" href="home?page=' + (page + 1) + urlForCategory + '"><li onclick="createPagination(pages, ' + (page + 1) + ')" class="page__btn paging">&raquo;</li></a>';
        }
        str += '</ul>';
        // Return the pagination string to be outputted in the pug templates
        document.getElementById('pagination').innerHTML = str;
        return str;
    }
</script>


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
<script src="${pageContext.request.contextPath}/template/assets/js/slick/custom_slick.js"></script>

<!-- Price Range Js -->
<script src="${pageContext.request.contextPath}/template/assets/js/ion.rangeSlider.min.js"></script>

<!-- Quantity js -->
<script src="${pageContext.request.contextPath}/template/assets/js/quantity-2.js"></script>

<!-- sidebar open js -->
<script src="${pageContext.request.contextPath}/template/assets/js/filter-sidebar.js"></script>

<!-- WOW js -->
<script src="${pageContext.request.contextPath}/template/assets/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/custom-wow.js"></script>

<!-- script js -->
<script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script>
</body>

</html>