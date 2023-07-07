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
</head>
<body>


<!-- SIDEBAR -->
<section id="sidebar">

    <c:if test="${admin != null}">
        <a href="admin" class="brand">
            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png"  style="width: 30%">
            <span class="text">Admin</span>
        </a>
    </c:if>
    <c:if test="${staff != null}">
        <a href="admin" class="brand">
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
        <a href="admin">
            <i class='bx bxs-doughnut-chart'></i>
            <span class="text">Khách hàng</span>
        </a>
    </li>

        <li>
            <a href="#">
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
        <i class='bx bx-menu'></i>




        <a href="#" class="profile">
            <img src="${pageContext.request.contextPath}\template\assets\images\people\people.png">
        </a>
    </nav>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
        <div class="head-title">
            <div class="left">
                <h1>Khách hàng</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="admin">Khách hàng</a>
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
                <i class='bx bxs-calendar-check'></i>
                <span class="text">
						<h3>1020</h3>
						<p>New Order</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-group'></i>
                <span class="text">
						<h3>2834</h3>
						<p>Visitors</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-dollar-circle'></i>
                <span class="text">
						<h3>$2543</h3>
						<p>Total Sales</p>
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
</body>
</html>