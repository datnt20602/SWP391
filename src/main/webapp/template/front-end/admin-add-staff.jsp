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

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/bootstrap.css">

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/font-awesome.css">

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/vendors/feather-icon.css">

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/template/assets/css/style.css">

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


        .theme-form-floating {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        label {
            font-weight: bold;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .error-message {
            background-color: #f8f9fa;
            padding: 10px;
        }
        .input-box {
            border-radius: 10px;
            border-style: solid;
        }

        .theme-form-floating {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error-message {
            background-color: #f8f9fa;
            padding: 10px;
        }

        .forgot-box {
            /* Add your styling for the forgot box */
        }

        .btn {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>


<!-- SIDEBAR -->
<section id="sidebar">

    <c:if test="${admin != null}">
        <a href="home" class="brand">
            <img src="${pageContext.request.contextPath}/template/assets/images/logo/logo.png" style="width: 30%">
            <span class="text">Admin</span>
        </a>
    </c:if>

    <ul class="side-menu top">

        <li>
            <a href="home">
                <i class='bx bxs-home'></i>
                <span class="text">Trang chủ</span>
            </a>
        </li>
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
    <%--    <nav>--%>
    <%--        <div class="profile" onclick="showOptions()">--%>
    <%--            <img src="/ODShop/template/assets/images/people/people.png">--%>
    <%--        </div>--%>
    <%--        <div id="options" style="display: none; border-radius: 10px">--%>
    <%--            <a href="#">Thông tin cá nhân</a><br>--%>
    <%--            <a href="changepass">Đổi mật khẩu</a><br>--%>
    <%--            <a href="forgotpass">Quên mật khẩu</a>--%>

    <%--        </div>--%>
    <%--    </nav>--%>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <form class="border rounded p-4" action="addStaff" method="post">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Họ Tên</label>
                            <input type="text" class="form-control" id="fullname" placeholder="Full Name"
                                   name="fullname" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phone" placeholder="Phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Địa chỉ email</label>
                            <input type="email" class="form-control" id="email" placeholder="Email Address"
                                   name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" placeholder="Password"
                                   name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="repass" class="form-label">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="repass" placeholder="Re-Password"
                                   name="repass" required>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" type="submit">Đăng kí</button>
                        </div>
                        <div class="mb-3">
                            <h3 class="bg-light text-danger p-2">${mess}</h3>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%--        <div class="input-box col-6">--%>
        <%--            <form class="row g-10" style="border-radius: 10px; border-style: solid " action="addStaff" method="post">--%>
        <%--                <div class="col-8">--%>
        <%--                    <div class="form-floating theme-form-floating">--%>
        <%--                        <input type="text" class="form-control" id="fullname" placeholder="Full Name" name = "fullname">--%>
        <%--                        <label for="fullname">Họ Tên</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="col-8">--%>
        <%--                    <div class="form-floating theme-form-floating">--%>
        <%--                        <input type="text" class="form-control" id="phone" placeholder="Phone" name = "phone">--%>
        <%--                        <label for="phone">Phone</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="col-8">--%>
        <%--                    <div class="form-floating theme-form-floating">--%>
        <%--                        <input type="email" class="form-control" id="email" placeholder="Email Address" name = "email">--%>
        <%--                        <label for="email">Địa chỉ email</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>

        <%--                <div class="col-8">--%>
        <%--                    <div class="form-floating theme-form-floating">--%>
        <%--                        <input type="password" class="form-control" id="password"--%>
        <%--                               placeholder="Password" name = "password" required>--%>
        <%--                        <label for="password">Mật khẩu</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="col-8">--%>
        <%--                    <div class="form-floating theme-form-floating">--%>
        <%--                        <input type="password" class="form-control" id="repass"--%>
        <%--                               placeholder="Re-Password" name = "repass" required>--%>
        <%--                        <label for="password">Nhập lại mật khẩu</label>--%>
        <%--                    </div>--%>

        <%--                </div>--%>

        <%--                <div class="col-8">--%>
        <%--                    <div class="forgot-box">--%>


        <%--                    </div>--%>
        <%--                    <h3 style="background-color:#f8f9fa" class="error-message">${mess}</h3>--%>

        <%--                </div>--%>

        <%--                <div class="col-8">--%>
        <%--                    <button class="btn btn-animation w-100" type="submit">Đăng kí</button>--%>
        <%--                </div>--%>
        <%--            </form>--%>
        <%--        </div>--%>
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