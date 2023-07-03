<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/style-admin.css">
    <c:if test="${admin != null}">
        <title>Admin</title>
    </c:if>
    <c:if test="${staff != null}">
        <title>Staff</title>
    </c:if>

    <style>
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
    </style>
</head>
<body>


<!-- SIDEBAR -->
<section id="sidebar">

    <c:if test="${admin != null}">
        <a href="home" class="brand">
            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"  style="width: 30%">
            <span class="text">Admin</span>
        </a>
    </c:if>
    <c:if test="${staff != null}">
        <a href="home" class="brand">
            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"  style="width: 30%">
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
        </c:if>

    </ul>
    <ul class="side-menu">

        <li>
            <a href="logout" class="logout">
                <i class='bx bxs-log-out-circle'></i>
                <span class="text">Đăng xuất</span>
            </a>
        </li>
    </ul>
</section>
<!-- SIDEBAR -->


<!-- CONTENT -->
<section id="content">
    <!-- NAVBAR -->
    <nav>
        <div class="profile" onclick="showOptions()">
            <img src="/ODShop/template/assets/images/people/people.png">
        </div>
        <div id="options" style="display: none; border-radius: 10px">
            <a href="#">Thông tin cá nhân</a><br>
            <a href="changepass">Đổi mật khẩu</a><br>
            <a href="forgotpass">Quên mật khẩu</a>

        </div>
    </nav>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
        <div class="head-title">
            <div class="left">
                <h1>Trang chủ</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="user">Trang chủ</a>
                    </li>
                    <li><i class='bx bx-chevron-right'></i></li>
                    <li>
                        <a class="active" href="home">Trang chủ</a>
                    </li>
                </ul>
            </div>

        </div>

        <ul class="box-info">
            <li>
                <i class='bx bx-store-alt'></i>
                <span class="text">
						<h3>${totalProduct}</h3>
						<p>Tổng sản phẩm</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-group'></i>
                <span class="text">
						<h3>${totalCustomer}</h3>
						<p>Tổng số người dùng</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-group'></i>
                <span class="text">
						<h3>${totalStaff}</h3>
						<p>Tổng số nhân viên</p>
					</span>
            </li>
        </ul>


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Recent Orders</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Date Order</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
                            <p>Admin 1</p>
                        </td>
                        <td>01-10-2021</td>
                        <td><span class="status completed">Completed</span></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
                            <p>Admin 1</p>
                        </td>
                        <td>01-10-2021</td>
                        <td><span class="status pending">Pending</span></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
                            <p>Admin 1</p>
                        </td>
                        <td>01-10-2021</td>
                        <td><span class="status process">Process</span></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
                            <p>Admin 1</p>
                        </td>
                        <td>01-10-2021</td>
                        <td><span class="status pending">Pending</span></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
                            <p>Admin 1</p>
                        </td>
                        <td>01-10-2021</td>
                        <td><span class="status completed">Completed</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="todo">
                <div class="head">
                    <h3>Todos</h3>
                    <i class='bx bx-plus'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <ul class="todo-list">
                    <li class="completed">
                        <p>Todo List</p>
                        <i class='bx bx-dots-vertical-rounded'></i>
                    </li>
                    <li class="completed">
                        <p>Todo List</p>
                        <i class='bx bx-dots-vertical-rounded'></i>
                    </li>
                    <li class="not-completed">
                        <p>Todo List</p>
                        <i class='bx bx-dots-vertical-rounded'></i>
                    </li>
                    <li class="completed">
                        <p>Todo List</p>
                        <i class='bx bx-dots-vertical-rounded'></i>
                    </li>
                    <li class="not-completed">
                        <p>Todo List</p>
                        <i class='bx bx-dots-vertical-rounded'></i>
                    </li>
                </ul>
            </div>
        </div>
    </main>
    <!-- MAIN -->
</section>
<!-- CONTENT -->


<script src="${pageContext.request.contextPath}/template/assets/js/script-admin.js"></script>
<script>
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