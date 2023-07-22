<%--
  Created by IntelliJ IDEA.
  User: Minh1511
  Date: 7/8/2023
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Vector" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import =" java.util.Vector,Model.Product" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Model.Customer" %>
<%@ page import="Model.Order" %>
<%@ page import="Model.*" %>
<%@ page import="java.util.ArrayList" %>
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
<%
  Order order = (Order) request.getAttribute("order");
%>
<!-- Breadcrumb Section End -->

<!-- Cart Section Start -->
<section class="cart-section section-b-space">
  <div class="container-fluid-lg">
    <div class="row g-sm-4 g-3">
      <div class="col-xxl-9 col-lg-8">
        <div class="cart-table order-table order-table-2">
          <div class="table-responsive">
            <table class="table mb-0">
              <tbody>
              <%
                Vector<Model.Order_item> vector = (Vector<Order_item>) request.getAttribute("cart_list");
                for (Order_item item : vector){
              %>
              <tr>
                <td class="product-detail">
                  <div class="product border-0">
                    <a href="product.left-sidebar.html" class="product-image">
                      <img src="<%=item.getProduct().getImage()%>"
                           class="img-fluid blur-up lazyload" alt="">
                    </a>
                    <div class="product-detail">
                      <ul>
                        <li class="name">
                          <a href="product-left-thumbnail.html"><%=item.getProduct().getProduct_name()%></a>
                        </li>

                        <li class="text-content">Dung tích :  <%=item.getProduct().getVolume()%>ml</li>
                      </ul>
                    </div>
                  </div>
                </td>

                <td class="price">
                  <h4 class="table-title text-content">Giá</h4>
                  <h6 class="theme-color"><%=item.getPrice()%>00 VND</h6>
                </td>

                <td class="quantity">
                  <h4 class="table-title text-content">Số lượng</h4>
                  <h4 class="text-title"><%=item.getQuantity()%></h4>
                </td>

                <td class="subtotal">
                  <h4 class="table-title text-content">Total</h4>
                  <h5>$<%=(item.getQuantity()*item.getPrice())%>00 VND</h5>
                </td>
              </tr>
              <%}%>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <%
        Double totalMoney = Double.parseDouble(request.getAttribute("totalMoney").toString());
      %>
      <div class="col-xxl-3 col-lg-4">
        <div class="row g-4">
          <div class="col-lg-12 col-sm-6">
            <div class="summery-box">
              <div class="summery-header">
                <h3>Giá Chi Tiết</h3>
                <h5 class="ms-auto theme-color">(<%=vector.size()%> Sản Phẩm)</h5>
              </div>

              <ul class="summery-contain">
                <li>
                  <h4>Thành tiền</h4>
                  <h4 class="price"><%=totalMoney%>00 VND</h4>
                </li>

                <li>
                  <h4>Só tiền giảm giá</h4>
                  <h4 class="price theme-color">000 VND</h4>
                </li>

              </ul>

              <ul class="summery-total">
                <li class="list-total">
                  <h4>Tổng tiền </h4>
                  <h4 class="price"><%=totalMoney%>00 VND</h4>
                </li>
              </ul>
            </div>
          </div>

          <%
            Address adr = (Address) request.getAttribute("address");
          %>
          <div class="col-lg-12 col-sm-6">
            <div class="summery-box">
              <div class="summery-header d-block">
                <h3>Địa chỉ Nhận Hàng</h3>
              </div>

              <ul class="summery-contain pb-0 border-bottom-0">
                <li class="d-block">
                  <h4><%=adr.getAddress_name()%></h4>
                </li>

                <li class="pb-0">
                  <h4>Ngày đặt hàng :</h4>
                  <h4 class="price theme-color">
                    <a href="ordertracking?order_id=<%=order.getOrder_id()%>" class="text-danger">Track Order</a>
                  </h4>
                </li>
              </ul>

              <ul class="summery-total">
                <li class="list-total border-top-0 pt-2">
                  <h4 class="fw-bold"><%=order.getOrder_date()%></h4>
                </li>
              </ul>
            </div>
          </div>

          <div class="col-12">
            <div class="summery-box">
              <div class="summery-header d-block">
                <h3>Phương thưc thanh toán</h3>
              </div>

              <ul class="summery-contain pb-0 border-bottom-0">
                <li class="d-block pt-0">
                  <p class="text-content"><%=request.getAttribute("payment_method")%></p>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Cart Section End -->

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
                <button onclick="location.href = 'cart';"
                        class="btn btn-md add-cart-button icon">Add
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
  function loadMore(){
    $.ajax({
      url: 'SWP391/home?service=load', // Đường dẫn xử lý yêu cầu
      type: 'get',
      success: function(response) {
        // Xử lý phản hồi từ máy chủ
        var row =  $('#contentSearch');
        row.innerHTML += response;
      }
    });
  }
</script>
<script>
  function searchByName(param){
    const txtSearch = param.valueOf;
    $ .ajax({
      url : "/SWP391/SreachController",
      type: "get",
      data:{
        txt : txtSearch
      },
      success : function (data){
        const row = document.getElementById("contentSearch");
        row.innerHTML = data;
      },
      error: function (xhr){

      }
    });
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
