<%@ page import="java.util.Vector" %>
<%@ page import="Model.Address" %>
<%@ page import="Model.Order_item" %>
<%@ page import="Model.Customer" %>
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
    <title>Thanh Toán</title>

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
<!-- Breadcrumb Section End -->

<!-- Cart Section Start -->
<section class="breadscrumb-section pt-0">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="breadscrumb-contain">
                    <h2>Thanh Toán</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="index.html">
                                    <i class="fa-solid fa-house"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Thanh Toán</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout section Start -->
<section class="checkout-section-2 section-b-space">
    <form action="ordersuccess" method="get">
    <div class="container-fluid-lg">
        <div class="row g-sm-4 g-3">
            <div class="col-lg-8">
                <div class="left-sidebar-checkout">
                    <div class="checkout-detail-box">
                        <ul>
                            <li>
                                <div class="checkout-icon">
                                    <lord-icon target=".nav-item" src="https://cdn.lordicon.com/ggihhudh.json"
                                               trigger="loop-on-hover"
                                               colors="primary:#121331,secondary:#646e78,tertiary:#0baf9a"
                                               class="lord-icon">
                                    </lord-icon>
                                </div>
                                <div class="checkout-box">
                                    <div class="checkout-title">
                                        <h4>Địa chỉ giao hàng</h4>
                                    </div>

                                    <div class="checkout-detail">
                                        <div class="row g-4">
                                    <%
                                        Vector<Address> addressVector = (Vector<Address>) request.getAttribute("address");
                                        if(addressVector != null){
                                            for(Address item : addressVector){

                                    %>
                                            <div class="col-xxl-6 col-lg-12 col-md-6">
                                                <div class="delivery-address-box">
                                                    <div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="addressID"
                                                                   id="flexRadioDefault2" checked="checked" value="<%=item.getAddress_id()%>">
                                                        </div>

                                                        <div class="label">
                                                            <label><%=item.getTen_goi_nho()%></label>
                                                        </div>

                                                        <ul class="delivery-address-detail">
                                                            <li>
                                                                <h4 class="fw-500"><%=item.getName()%></h4>
                                                            </li>
                                                            <li>
                                                                <h6 class="text-content"><span
                                                                        class="text-title">Email :</span>
                                                                    <%=item.getEmail()%></h6>
                                                            </li>

                                                            <li>
                                                                <h6 class="text-content mb-0"><span
                                                                        class="text-title">Phone
                                                                            :</span> <%=item.getPhone()%></h6>
                                                            </li>
                                                            <li>
                                                                <p class="text-content"><span
                                                                        class="text-title">Địa chỉ cụ thể
                                                                            :</span><%=item.getAddress_name()%>
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-content"><span
                                                                        class="text-title">Địa chỉ :
                                                                            </span><%=item.getCity()+","+item.getDistrict()+","+item.getWard()%>
                                                                </p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                    <%

                                            }
                                        }
                                    %>
                                            <div>
                                                <button type="button"  class="btn theme-bg-color text-white btn-sm fw-bold mt-lg-0 mt-3"
                                                        data-bs-toggle="modal" data-bs-target="#add-address"><i data-feather="plus"
                                                                                                                class="me-2"></i> Thêm địa chỉ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="checkout-icon">
                                    <lord-icon target=".nav-item" src="https://cdn.lordicon.com/qmcsqnle.json"
                                               trigger="loop-on-hover" colors="primary:#0baf9a,secondary:#0baf9a"
                                               class="lord-icon">
                                    </lord-icon>
                                </div>
                                <div class="checkout-box">
                                    <div class="checkout-title">
                                        <h4>Phương Thức Thanh Toán</h4>
                                    </div>

                                    <div class="checkout-detail">
                                        <div class="accordion accordion-flush custom-accordion"
                                             id="accordionFlushExample">
                                            <div class="accordion-item">
                                                <div class="accordion-header" id="flush-headingFour">
                                                    <div class="accordion-button collapsed"
                                                         data-bs-toggle="collapse"
                                                         data-bs-target="#flush-collapseFour">
                                                        <div class="custom-form-check form-check mb-0">
                                                            <label class="form-check-label" for="cash"><input
                                                                    class="form-check-input mt-0" type="radio"
                                                                    name="flexRadioDefault" value="1" id="cash" checked> Thanh toán khi nhận hàng </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="flush-collapseFour"
                                                     class="accordion-collapse collapse show"
                                                     data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body">
                                                        <p class="cod-review">Khi nhận hàng bạn được kiểm tra rồi thanh toán !
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="accordion-item">
                                                <div class="accordion-header" id="flush-headingTwo">
                                                    <div class="accordion-button collapsed"
                                                         data-bs-toggle="collapse"
                                                         data-bs-target="#flush-collapseTwo">
                                                        <div class="custom-form-check form-check mb-0">
                                                            <label class="form-check-label" for="banking"><input
                                                                    class="form-check-input mt-0" type="radio"
                                                                    name="flexRadioDefault" value="2" id="banking" >Chuyển khoản ngân hàng</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                                                     data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body">
                                                        <h5 class="text-uppercase mb-4">Chuyển khoản vào ngân hàng của chúng tôi</h5>
                                                        <img style="width: 300px;height: 400px;"
                                                                src="https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/358085863_1975151149526710_4494173388623438017_n.jpg?stp=cp6_dst-jpg&_nc_cat=105&cb=99be929b-3346023f&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=OZhlEx6fiqsAX8ZF-zR&_nc_ht=scontent.fhan5-2.fna&oh=00_AfArnc5fGFNOOlcTl0Gz4f5wVD92l9O0Y-btaSt8a5SPHQ&oe=64ADB96D">
                                                        <h5 class="text-uppercase mb-4">Khi chùng tôi nhận được tiền bạn đơn hàng của bạn sẽ được ship ngay</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="right-side-summery-box">
                    <div class="summery-box-2">
                        <div class="summery-header">
                            <h3>Chi tiết Order</h3>
                        </div>

                        <ul class="summery-contain">
                            <%
                                Vector<Order_item> vector = (Vector<Order_item>) session.getAttribute("cart_list");
                                for(Order_item item : vector){
                            %>
                            <li>
                                <img src="<%=item.getProduct().getImage()%>"
                                     class="img-fluid blur-up lazyloaded checkout-image" alt="">
                                <h4><%=item.getProduct().getProduct_name()%> <span> x<%=item.getQuantity()%></span></h4>
                                <h4 class="price"><%=item.getProduct().getPrice()%>VND</h4>
                            </li>
                            <%}%>
                        </ul>

                        <ul class="summery-total">
                            <li>
                                <h4>Subtotal</h4>
                                <h4 class="price"><%=session.getAttribute("totalMoney")%>VND</h4>
                            </li>

                            <li>
                                <h4>Shipping</h4>
                                <h4 class="price">15.000 VND</h4>
                            </li>

                            <li class="list-total">
                                <h4>Tổng (VND)</h4>
                                <h4 class="price"><%=session.getAttribute("totalMoney")%>VND</h4>
                            </li>
                        </ul>
                    </div>
                    <button type="submit" class="btn theme-bg-color text-white btn-md w-100 mt-4 fw-bold">Place Order</button>
                </div>
            </div>
        </div>
    </div>
    </form>
</section>
<!-- Checkout section End -->

<!-- Add address modal box start -->
<div class="modal fade theme-modal" id="add-address" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Thêm địa chỉ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <form action="address" method="post">
                <div class="modal-body">
                    <div class="form-floating mb-4 theme-form-floating">
                        <input type="text" class="form-control" name="name" id="fname" placeholder="Nhập tên người nhận" value="<%=cus.getName()%>">
                        <label for="fname">Tên người nhận </label>
                    </div>
                    <div class="form-floating mb-4 theme-form-floating">
                        <input type="email" class="form-control"name="email" id="email" placeholder="Nhập Email" value="<%=cus.getEmail()%>">
                        <label for="email">Email </label>
                    </div>

                    <div class="form-floating mb-4 theme-form-floating">
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Số điện thoại " value="<%=cus.getPhone()%>">
                        <label for="phone">Số điện thoại</label>
                    </div>
                    <div class="form-floating mb-4 theme-form-floating">
                        <select name="city"  id="city" class="form-control">
                            <option value="city" selected> Thành phố/ Tỉnh</option>
                        </select>
                    </div>
                    <div class="form-floating mb-4 theme-form-floating">
                        <select  name="district" id="district" class="form-control"  >
                            <option value="district" selected>Huyện/Quận</option>
                        </select>
                    </div>
                    <div class="form-floating mb-4 theme-form-floating">
                        <select name="ward" id="ward" class="form-control" >
                            <option value="ward" selected>Xã</option>
                        </select>
                    </div>


                    <div class="form-floating mb-4 theme-form-floating">
                        <input type="text" class="form-control" name="address" id="address" placeholder="Nhập địa chỉ" required>
                        <label for="address">Địa chỉ cụ thể</label>
                    </div>

                    <div class="form-floating mb-4 theme-form-floating">
                        <input type="text" class="form-control" name="ten_nho" id="name" placeholder="Nhập Tên Gợi">
                        <label for="name">Tên Gợi Nhớ</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit"  name="addAddress" value="checkout"class="btn theme-bg-color btn-md text-white" data-bs-dismiss="modal">Thêm địa chỉ</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Add address modal box end -->
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
                <h5 class="modal-title" id="exampleModalLabel">Mời bạn chọn vị trí</h5>
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
                    <h5 class="modal-title w-100" id="deal_today">Giảm giá hôm nay</h5>
                    <p class="mt-1 text-content">Giảm giá đề xuất cho bạn</p>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Name); // Change here
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if (this.value != "") {
                const result = data.filter(n => n.Name === this.value); // Change here

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Name); // Change here
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Name === citis.value);
            if (this.value != "") {
                const selectedDistrict = dataCity[0].Districts.find(d => d.Name === this.value);
                for (const w of selectedDistrict.Wards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Name);
                }
            }
        };
    }

</script>
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
<script src="${pageContext.request.contextPath}/template/assets/js/quantity.js"></script>

<!-- script js -->
<script src="${pageContext.request.contextPath}/template/assets/js/script.js"></script>
</body>

</html>