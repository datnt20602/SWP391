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
<!-- SIDEBAR -->
<div id="blur" class="container">
    <section id="sidebar">

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
</div>
<!-- CONTENT -->


<script src="${pageContext.request.contextPath}/template/assets/js/script-admin.js"></script>
<script>
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