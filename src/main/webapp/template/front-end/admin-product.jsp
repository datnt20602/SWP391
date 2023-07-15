<%--
  Created by IntelliJ IDEA.
  User: jiggnguyen
  Date: 6/26/2023
  Time: 10:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet">
    <!-- My CSS -->
    <link rel="stylesheet" type="text/css" href="/ODShop/template/assets/css/style-admin.css">
    <link rel="stylesheet" href="/ODShop/template/assets/css/pagination.css">

    <title> Sản phẩm </title>
    <style>
        .wave-group {
            position: relative;
        }

        .wave-group .input {
            font-size: 16px;
            padding: 10px 10px 10px 5px;
            display: block;
            width: 200px;
            border: none;
            border-bottom: 1px solid #515151;
            background: transparent;
        }

        .wave-group .input:focus {
            outline: none;
        }

        .wave-group .label {
            color: #999;
            font-size: 18px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 5px;
            top: 10px;
            display: flex;
        }

        .wave-group .label-char {
            transition: 0.2s ease all;
            transition-delay: calc(var(--index) * .05s);
        }

        .wave-group .input:focus ~ label .label-char,
        .wave-group .input:valid ~ label .label-char {
            transform: translateY(-20px);
            font-size: 14px;
            color: #5264AE;
        }

        .wave-group .bar {
            position: relative;
            display: block;
            width: 200px;
        }

        .wave-group .bar:before, .wave-group .bar:after {
            content: '';
            height: 2px;
            width: 0;
            bottom: 1px;
            position: absolute;
            background: #5264AE;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }

        .wave-group .bar:before {
            left: 50%;
        }

        .wave-group .bar:after {
            right: 50%;
        }

        .wave-group .input:focus ~ .bar:before,
        .wave-group .input:focus ~ .bar:after {
            width: 50%;
        }

        #search-button:active {
            background-color: #bdbdbd;
        }

        #blur.active {
            filter: blur(20px);
            pointer-events: none;
            user-select: none;
        }

        #popup, #popup1 {
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            height: fit-content;
            padding: 50px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, .30);
            background: #ffffff;
            visibility: hidden;
            opacity: 0.5;
            transition: 0.5s;
            z-index: 9999;
        }

        #popup.active, #popup1.active {
            top: 50%;
            visibility: visible;
            opacity: 1;
            transform: 0.5s;
        }

        #deleteDiv {
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            height: fit-content;
            padding: 50px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, .30);
            background: #ffffff;
            visibility: hidden;
            opacity: 0.5;
            transition: 0.5s;
            z-index: 9999;
        }

        #deleteDiv.active {
            top: 50%;
            visibility: visible;
            opacity: 1;
            transform: 0.5s;
        }

        #addDiv {
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            height: fit-content;
            padding: 50px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, .30);
            background: #ffffff;
            visibility: hidden;
            opacity: 0.5;
            transition: 0.5s;
            z-index: 9999;
        }

        #addDiv.active {
            top: 50%;
            visibility: visible;
            opacity: 1;
            transform: 0.5s;
        }

        #options {
            display: none;
            position: absolute;
            background-color: white;
            padding: 10px;
            border: 1px solid black;
            top: 100%;
            left: 0;
        }

        .profile {
            cursor: pointer;
        }
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body>
<div id="addDiv">
    <form action="product" method="post">
        <div class="wave-group">
            <input required type="text" class="input" name="productName" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">N</span>
                <span class="label-char" style="--index: 1">a</span>
                <span class="label-char" style="--index: 2">m</span>
                <span class="label-char" style="--index: 3">e</span>
            </label>
        </div>
        <div class="wave-group">

            <input required type="text" class="input" name="productCategory"
                   style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">D</span>
                <span class="label-char" style="--index: 1">a</span>
                <span class="label-char" style="--index: 2">n</span>
                <span class="label-char" style="--index: 3">h</span>
                <span class="label-char" style="--index: 4">&nbsp;</span>
                <span class="label-char" style="--index: 5">m</span>
                <span class="label-char" style="--index: 6">ụ</span>
                <span class="label-char" style="--index: 7">c</span>
            </label>

        </div>
        <div class="wave-group">
            <input required type="number" class="input" name="productPrice" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">P</span>
                <span class="label-char" style="--index: 1">r</span>
                <span class="label-char" style="--index: 2">i</span>
                <span class="label-char" style="--index: 3">c</span>
                <span class="label-char" style="--index: 4">e</span>
            </label>
        </div>
        <div class="wave-group">
            <input required type="text" class="input" name="productImage" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">I</span>
                <span class="label-char" style="--index: 1">m</span>
                <span class="label-char" style="--index: 2">a</span>
                <span class="label-char" style="--index: 3">g</span>
                <span class="label-char" style="--index: 4">e</span>
            </label>
        </div>
        <div class="wave-group">
            <input required type="number" class="input" name="productVolume" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">V</span>
                <span class="label-char" style="--index: 1">o</span>
                <span class="label-char" style="--index: 2">l</span>
                <span class="label-char" style="--index: 3">u</span>
                <span class="label-char" style="--index: 4">m</span>
                <span class="label-char" style="--index: 5">e</span>
            </label>
        </div>
        <div class="wave-group" style="margin-top: 20px;">
            <label>
                Describe
            </label><br>
            <textarea rows="10" cols="25" name="productDescribe" style="width: 80%;font-size: 16px;"
                      placeholder="Describe">

            </textarea>

        </div>

        <div class="" style="margin-top: 20px;">

            <button type="submit" name="option" value="add"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                Thêm
            </button>
            <button type="button" onclick="toggleAddDiv()"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Hủy
            </button>
        </div>
    </form>
</div>
<div id="deleteDiv">
    <form action="product" method="post">
        <h3>Bạn muốn xóa sản phẩm này ?</h3>
        <input id="deleteId" name="productId" style="display: none">
        <div class="" style="margin-top: 20px;">
            <button type="submit" name="option" value="delete"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                Delete
            </button>
            <button type="button" onclick="toggleDelete()"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Close
            </button>
        </div>
    </form>
</div>
<div id="popup">
    <form action="product" method="post">
        <div class="wave-group">
            <label class="label">
                <span class="label-char" style="--index: 0">I</span>
                <span class="label-char" style="--index: 1">d</span>
            </label><br>
            <input type="text" class="input" id="detailId" name="productId" readonly>
            <span class="bar"></span>

        </div>
        <div class="wave-group">
            <input type="text" class="input" id="detailName" name="productName" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">N</span>
                <span class="label-char" style="--index: 1">a</span>
                <span class="label-char" style="--index: 2">m</span>
                <span class="label-char" style="--index: 3">e</span>
            </label>
        </div>
        <div class="wave-group">
            <label class="label">
                Danh mục
            </label><br>
            <input type="text" class="input" id="detailCategory" name="productCategory" readonly
                   style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <br>

        </div>
        <div class="wave-group">
            <input type="text" class="input" id="detailPrice" name="productPrice" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">P</span>
                <span class="label-char" style="--index: 1">r</span>
                <span class="label-char" style="--index: 2">i</span>
                <span class="label-char" style="--index: 3">c</span>
                <span class="label-char" style="--index: 4">e</span>
            </label>
        </div>
        <div class="wave-group">
            <input type="text" class="input" id="detailImage" name="productImage" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">I</span>
                <span class="label-char" style="--index: 1">m</span>
                <span class="label-char" style="--index: 2">a</span>
                <span class="label-char" style="--index: 3">g</span>
                <span class="label-char" style="--index: 4">e</span>
            </label>
        </div>
        <div class="wave-group">
            <input type="text" class="input" id="detailVolume" name="productVolume" style="margin-top: 20px;width: 80%">
            <span class="bar"></span>
            <label class="label">
                <span class="label-char" style="--index: 0">V</span>
                <span class="label-char" style="--index: 1">o</span>
                <span class="label-char" style="--index: 2">l</span>
                <span class="label-char" style="--index: 3">u</span>
                <span class="label-char" style="--index: 4">m</span>
                <span class="label-char" style="--index: 5">e</span>
            </label>
        </div>
        <div class="wave-group" style="margin-top: 20px;">
            <label>
                Describe
            </label><br>
            <textarea rows="10" cols="25" id="detailDescribe" name="productDescribe" style="width: 80%;font-size: 16px;"
                      placeholder="Describe">

            </textarea>

        </div>

        <div class="" style="margin-top: 20px;">

            <button type="submit" name="option" value="update"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                Cập nhật
            </button>
            <button type="button" onclick="toggle()"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Hủy
            </button>
        </div>
    </form>
</div>
<div id="popup1">
    <c:if test="${admin!=null}">
        <form action="product" method="post">
            <div class="wave-group">
                <label class="label">
                    <span class="label-char" style="--index: 0">I</span>
                    <span class="label-char" style="--index: 1">d</span>
                </label><br>
                <input type="text" class="input" id="detailAdminId" name="adminId" readonly>
                <span class="bar"></span>

            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailAdminName" name="adminName" style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">N</span>
                    <span class="label-char" style="--index: 1">a</span>
                    <span class="label-char" style="--index: 2">m</span>
                    <span class="label-char" style="--index: 3">e</span>
                </label>
            </div>
            <div class="wave-group">
                <label class="label">
                    Email
                </label><br>
                <input type="text" class="input" id="detailAdminEmail" name="adminEmail" readonly
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <br>

            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailAdminPhone" name="adminPhone"
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">P</span>
                    <span class="label-char" style="--index: 1">h</span>
                    <span class="label-char" style="--index: 2">o</span>
                    <span class="label-char" style="--index: 3">n</span>
                    <span class="label-char" style="--index: 4">e</span>
                </label>
            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailAdminStreet" name="adminStreet"
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">S</span>
                    <span class="label-char" style="--index: 1">t</span>
                    <span class="label-char" style="--index: 2">r</span>
                    <span class="label-char" style="--index: 3">e</span>
                    <span class="label-char" style="--index: 4">e</span>
                    <span class="label-char" style="--index: 4">t</span>
                </label>
            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailAdminCity" name="adminCity" style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">C</span>
                    <span class="label-char" style="--index: 1">i</span>
                    <span class="label-char" style="--index: 2">t</span>
                    <span class="label-char" style="--index: 3">y</span>

                </label>
            </div>
            <div class="wave-group">
                <input type="password" class="input" id="detailAdminPass" name="adminPass"
                       style="margin-top: 20px;width: 80%" hidden="hidden">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">P</span>
                    <span class="label-char" style="--index: 1">a</span>
                    <span class="label-char" style="--index: 2">s</span>
                    <span class="label-char" style="--index: 3">s</span>
                </label>
            </div>
            <div class="" style="margin-top: 20px;">

                <button type="submit" name="option" value="updateProfileAdmin"
                        style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                    Update
                </button>
                <button type="button" onclick="toggle1()"
                        style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Close
                </button>
            </div>
        </form>
    </c:if>
    <c:if test="${staff != null}">
        <form action="product" method="post">
            <div class="wave-group">
                <label class="label">
                    <span class="label-char" style="--index: 0">I</span>
                    <span class="label-char" style="--index: 1">d</span>
                </label><br>
                <input type="text" class="input" id="detailStaffId" name="staffId" readonly>
                <span class="bar"></span>

            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailStaffName" name="staffName" style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">N</span>
                    <span class="label-char" style="--index: 1">a</span>
                    <span class="label-char" style="--index: 2">m</span>
                    <span class="label-char" style="--index: 3">e</span>
                </label>
            </div>
            <div class="wave-group">
                <label class="label">
                    Email
                </label><br>
                <input type="text" class="input" id="detailStaffEmail" name="staffEmail" readonly
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <br>

            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailStaffPhone" name="staffPhone"
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">P</span>
                    <span class="label-char" style="--index: 1">h</span>
                    <span class="label-char" style="--index: 2">o</span>
                    <span class="label-char" style="--index: 3">n</span>
                    <span class="label-char" style="--index: 4">e</span>
                </label>
            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailStaffActive" name="staffActive"
                       style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">A</span>
                    <span class="label-char" style="--index: 1">c</span>
                    <span class="label-char" style="--index: 2">t</span>
                    <span class="label-char" style="--index: 3">i</span>
                    <span class="label-char" style="--index: 4">v</span>
                    <span class="label-char" style="--index: 4">e</span>
                </label>
            </div>
            <div class="wave-group">
                <input type="text" class="input" id="detailStaffAid" name="staffAid" style="margin-top: 20px;width: 80%">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">A</span>
                    <span class="label-char" style="--index: 1">i</span>
                    <span class="label-char" style="--index: 2">d</span>


                </label>
            </div>
            <div class="wave-group">
                <input type="password" class="input" id="detailStaffPass" name="staffPass"
                       style="margin-top: 20px;width: 80%" hidden="hidden">
                <span class="bar"></span>
                <label class="label">
                    <span class="label-char" style="--index: 0">P</span>
                    <span class="label-char" style="--index: 1">a</span>
                    <span class="label-char" style="--index: 2">s</span>
                    <span class="label-char" style="--index: 3">s</span>
                </label>
            </div>
            <div class="" style="margin-top: 20px;">

                <button type="submit" name="option" value="updateProfileStaff"
                        style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                    Update
                </button>
                <button type="button" onclick="toggle1()"
                        style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Close
                </button>
            </div>
        </form>
    </c:if>

</div>
<div id="blur" class="container">
    <section id="sidebar" class="">
        <c:if test="${admin != null}">
            <a href="home" class="brand">
                <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png" style="width: 30%">
                <span class="text">Admin</span>
            </a>
        </c:if>
        <c:if test="${staff != null}">
            <a href="home" class="brand">
                <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png" style="width: 30%">
                <span class="text">Staff</span>
            </a>
        </c:if>
        <ul class="side-menu top">

            <li>
                <a href="product">
                    <i class='bx bxs-shopping-bag-alt'></i>
                    <span class="text">Cửa hàng</span>
                </a>
            </li>

            <c:if test="${admin != null}">
                <li>
                    <a href="user">
                        <i class='bx bxs-doughnut-chart'></i>
                        <span class="text">Khách hàng</span>
                    </a>
                </li>

                <li>
                    <a href="staff">
                        <i class='bx bxs-group'></i>
                        <span class="text">Nhân viên</span>
                    </a>
                </li>
                <li>
                    <a href="addStaff">
                        <i class='bx bxs-group'></i>
                        <span class="text">Thêm Nhân viên</span>
                    </a>
                </li>
            </c:if>

        </ul>
        <ul class="side-menu">
            <li>
                <a href="logout" class="logout">
                    <i class="bx bxs-log-out-circle"></i>
                    <span class="text">Đăng xuất</span>
                </a>
            </li>
        </ul>
    </section>
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <div class="profile" onclick="showOptions()">
                <img src="/ODShop/template/assets/images/people/people.png">
            </div>
            <div id="options" style="display: none; border-radius: 10px">

                <button type="button"
                        onclick='toggle1();loadDataAdmin(JSON.stringify(${admin.toJson()}))'

                        style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">
                    Thông tin cá nhân
                </button>
                <br>
                <a href="changepass">Đổi mật khẩu</a><br>
                <a href="forgotpass">Quên mật khẩu</a>

            </div>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Cửa hàng</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="product">Cửa hàng</a>
                        </li>
                        <li><i class="bx bx-chevron-right"></i></li>
                        <li>
                            <a class="active" href="home">Trang chủ</a>
                        </li>
                    </ul>
                </div>

            </div>

            <div class="table-data">
                <div class="order">
                    <form class="" action="product" method="get">
                        <div class="head">
                            <h3>Sản phẩm</h3>
                            <h2>${errorMessage}</h2>
                            <select name="category" id="selectCategory"
                                    style="font-size: 16px;height: 100%;padding: 10px;border-radius: 5px;width: 15%;cursor: pointer">
                                <option selected value="all">Danh mục</option>
                                <c:forEach var="category" items="${listCategory}">
                                    <option ${param.category.equals(category) ? "selected" : ""}
                                            value="${category}">${category}</option>
                                </c:forEach>
                            </select>
                            <div class="wave-group">
                                <input type="text" class="input" id="inputSearchName" name="name" value="${param.name}">
                                <span class="bar"></span>
                                <label class="label">
                                    <span class="label-char" style="--index: 0">T</span>
                                    <span class="label-char" style="--index: 1">ê</span>
                                    <span class="label-char" style="--index: 2">n</span>

                                </label>
                            </div>
                            <button id="search-button"
                                    style="border: 1px solid #5c636a; border-radius: 5px;height: 39px;width: 39px;cursor: pointer;"
                                    class="">
                                <i class="bx bx-search"></i>
                            </button>

                            <button id="add-button" onclick="toggleAddDiv()"
                                    style="border: 1px solid #5c636a; border-radius: 5px;height: 39px;cursor: pointer; padding: 0 10px;"
                                    class="" type="button">
                                <span>Thêm sản phẩm</span>
                            </button>
                        </div>
                    </form>
                    <table>
                        <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Thể tích</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${listProduct}">
                            <tr>
                                <td>
                                    <img style="max-height: 68px;" src="${product.getImage()}">
                                </td>
                                <td>
                                    <h4>${product.getProduct_name()}</h4>
                                </td>
                                <td>
                                    <h5 class="priceValue">${product.getPrice()}</h5>
                                </td>
                                <td>
                                    <h5>${product.getVolume()}</h5>
                                </td>
                                <td>
                                    <button type="button"
                                            onclick='toggle();loadData(JSON.stringify(${product.toJson()}))'
                                            style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">
                                        Chi tiết
                                    </button>
                                </td>
                                <td>
                                    <button onclick="toggleDelete();alertDelete(${product.getProduct_id()})"
                                            style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">
                                        Xóa
                                    </button>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="pagination">
            </div>
        </main>
        <!-- MAIN -->
    </section>
</div>
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


    function loadDataAdmin(admin) {
        var data1 = JSON.parse(admin);
        console.log(data1);
        document.getElementById("detailAdminId").value = data1.admin_id;
        document.getElementById("detailAdminName").value = data1.name;
        document.getElementById("detailAdminEmail").value = data1.email;
        document.getElementById("detailAdminPhone").value = data1.phone;
        // document.getElementById("detailAdminStatus").value = data1.status;
        document.getElementById("detailAdminStreet").value = data1.street;
        document.getElementById("detailAdminCity").value = data1.city;
        document.getElementById("detailAdminPass").value = data1.pass;
    }

    function toggle1() {
        var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var popup = document.getElementById('popup1');
        popup.classList.toggle('active');
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

    function toggleAddDiv() {
        var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var popup = document.getElementById('addDiv');
        popup.classList.toggle('active');
    }


    var priceValue = document.querySelectorAll(".priceValue");
    priceValue.forEach(p => {
        var number = parseFloat(p.innerText);
        if (!isNaN(number)) {
            p.innerText = number.toLocaleString();
        }
    });

    let pages = ${totalPages};

    document.getElementById('pagination').innerHTML = createPagination(pages, ${pageNumber});

    function createPagination(pages, page) {
        let str = '<ul class="page">';
        let active;
        let pageCutLow = page - 1;
        let pageCutHigh = page + 1;
        var name = document.getElementById("inputSearchName");
        var category = document.getElementById("selectCategory");
        // Show the Previous button only if you are on a page other than the first
        if (page > 1) {
            str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + (page - 1) + '"><li onclick="createPagination(pages, ' + (page - 1) + ')" class="page__btn paging">&laquo;</li></a>';
        }
        // Show all the pagination elements if there are less than 6 pages total
        if (pages < 6) {
            for (let p = 1; p <= pages; p++) {
                active = page == p ? "active" : "";
                str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + p + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
        }
        // Use "..." to collapse pages outside of a certain range
        else {
            // Show the very first page followed by a "..." at the beginning of the
            // pagination section (after the Previous button)
            if (page > 2) {
                str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + 1 + '"><li onclick="createPagination(pages, 1)" class="page__numbers paging">1</li></a>';
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
                str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + p + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
            // Show the very last page preceded by a "..." at the end of the pagination
            // section (before the Next button)
            if (page < pages - 1) {
                if (page < pages - 2) {
                    str += '<li class="page__dots"><span>...</span></li>';
                }
                str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + pages + '"><li onclick="createPagination(pages, pages)" class="page__numbers paging">' + pages + '</li></a>';
            }
        }
        // Show the Next button only if you are on a page other than the last
        if (page < pages) {
            str += '<a style="color: black" href="product?name=' + name.value + '&category=' + category.value + '&page=' + (page + 1) + '"><li onclick="createPagination(pages, ' + (page + 1) + ')" class="page__btn paging">&raquo;</li></a>';
        }
        str += '</ul>';
        // Return the pagination string to be outputted in the pug templates
        document.getElementById('pagination').innerHTML = str;
        return str;
    }

    function showOptions() {
        var optionsDiv = document.getElementById("options");
        if (optionsDiv.style.display === "none") {
            optionsDiv.style.display = "block";
        } else {
            optionsDiv.style.display = "none";
        }

    }
</script>
</body>
</html>
