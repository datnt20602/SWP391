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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/assets/css/style-admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/assets/css/pagination.css">

    <title> Đánh giá </title>
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
            border-radius: 10px;
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
        .options-container {
            display: none;
            border-radius: 10px;
            margin-left: 900px;
            background-color: #ccc;
            border: none;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .option-item {
            display: inline-block;
            padding: 10px;
            cursor: pointer;
            border-radius: 7px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .show {
            opacity: 1;
        }
    </style>
</head>
<body>
<div id="deleteDiv">
    <form action="adminfeedback" method="post">
        <h3>Bạn muốn xóa đánh giá của khách hàng này ?</h3>
        <input id="deleteId" name="feedback_id" style="display: none">
        <div class="" style="margin-top: 20px;">
            <button type="submit" name="option" value="delete"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a;margin-right: 20px;">
                Xóa
            </button>
            <button type="button" onclick="toggleDelete()"
                    style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Hủy
            </button>
        </div>
    </form>
</div>
<div id="popup">
  <form action="adminfeedback" method="post">
    <div class="wave-group">
      <label class="label">
        <span class="label-char" style="--index: 0">Id</span>

      </label><br>
      <input type="text" class="input" id="detailFId" name="feedbackId" readonly>
      <span class="bar"></span>

    </div>
    <div class="wave-group">
      <span class="bar"></span>
      <label class="label">
        <span class="label-char" style="--index: 0">Nội dung</span>

      </label><br>
<%--        <input type="text" class="input" id="detailContent" name="feedbackContent" style="margin-top: 20px;width: 80%">--%>
        <textarea class="input" id="detailContent" name="feedbackContent" style="margin-top: 20px; width: 80%;" rows="5"></textarea>

    </div>
    <div class="wave-group">
      <label class="label">
        Ngày
      </label><br>
      <input type="text" class="input" id="detailDate" name="feedbackDate"
             style="margin-top: 20px;width: 80%">
      <span class="bar"></span>
      <br>

    </div>
    <div class="wave-group">
      <span class="bar"></span>
      <label class="label">
        <span class="label-char" style="--index: 0">Khách hàng</span>

      </label><br>
        <input type="text" class="input" id="detailCusId" name="customerName" style="margin-top: 20px;width: 80%">

    </div>
    <div class="wave-group">
      <input type="text" class="input" id="detailProId" name="productName" style="margin-top: 20px;width: 80%">
      <span class="bar"></span>
      <label class="label">
        <span class="label-char" style="--index: 0">Sản phẩm</span>

      </label>
    </div>



    <div class="" style="margin-top: 20px;">
      <button type="button" onclick="toggle()"
              style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">Đóng
      </button>
    </div>
  </form>
</div>
<div id="popup1">
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

            <label class="label">
                <span class="label-char" style="--index: 0">P</span>
                <span class="label-char" style="--index: 1">a</span>
                <span class="label-char" style="--index: 2">s</span>
                <span class="label-char" style="--index: 3">s</span>
            </label><br>
            <input type="password" class="input" id="detailAdminPass" name="adminPass"
                   style="margin-top: 20px;width: 80%" hidden="hidden" readonly>


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
                <a href="home">
                    <i class='bx bxs-home'></i>
                    <span class="text">Trang chủ</span>
                </a>
            </li>
            <li>
                <a href="product">
                    <i class='bx bxs-shopping-bag-alt'></i>
                    <span class="text">Sản Phẩm</span>
                </a>
            </li>
            <li>
                <a href="adminfeedback">
                    <i class='bx bxs-doughnut-chart'></i>
                    <span class="text">Đánh giá</span>
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
            <div class="profile" onmouseover="showOptions()" onmouseout="hideOptions()">
                <img style="margin-left: 1000px"
                     src="${pageContext.request.contextPath}/template/assets/images/people/people.png">
            </div>
            <div id="options"
                 style="border: none"
                 class="options-container"
                 onmouseover="showOptions()" onmouseout="hideOptions()">
        <span onclick='toggle1();loadDataAdmin(JSON.stringify(${admin.toJson()}))'
              class="option-item">
            Thông tin cá nhân
        </span>
                <br>
                <a class="option-item" href="changepass">Đổi mật khẩu</a><br>
                <a class="option-item" href="forgotpass">Quên mật khẩu</a>
            </div>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Đánh giá</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="adminfeedback">Đánh giá</a>
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
                    <form class="" action="adminfeedback" method="get">
                        <div class="head">
                            <h3>Đánh giá</h3>
                            <h2>${errorMessage}</h2>

                            <div class="wave-group">
                                <span class="bar"></span>
                                <label class="label">
                                   <span>Tên sản phẩm</span>

                                </label><br>
                                <input type="text" class="input" id="inputSearchName" name="name" value="${param.name}">

                            </div>
                            <button id="search-button"
                                    style="border: 1px solid #5c636a; border-radius: 5px;height: 39px;width: 39px;cursor: pointer;"
                                    class="">
                                <i class="bx bx-search"></i>
                            </button>

                            <%--                    <i class="bx bx-filter"></i>--%>
                        </div>
                    </form>
                    <table>
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nội dung</th>
                            <th>Thời gian</th>
                            <th>Sản phẩm</th>
                            <th>Khách hàng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="feedback" items="${listFeedback}">
                            <tr>
                                <td>
                                    <h4>${feedback.getFeedback_id()} </h4>
                                </td>
                                <td>
                                    <h5 style="max-width: 200px;padding-left: 50px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${feedback.getContent()}</h5>
                                </td>
                                <td>
                                    <h5>${feedback.getDate()}</h5>
                                </td>
                                <td>
                                    <h5>${feedback.getProduct().getProduct_name()}</h5>

                                </td>
                                <td>
                                    <h5>${feedback.getCustomer().getName()}</h5>

                                </td>
                                <td>
                                        <%--                  <button type="button"--%>
                                        <%--                          onclick='toggle();loadData(JSON.stringify(${product.toJson()}))'--%>
                                        <%--                          style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">--%>
                                        <%--                    Chi tiết--%>
                                        <%--                  </button>--%>
                                </td>
                                <td>
                                    <button type="button"
                                            onclick='toggle();loadData(JSON.stringify(${feedback.toJson()}))'
                                            style="padding: 10px;cursor: pointer;border-radius: 7px;border: 1px solid #5c636a">
                                        Chi tiết
                                    </button>
                                </td>
                                <td>

                                    <button onclick="toggleDelete();alertDelete(${feedback.getFeedback_id()})"
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
    function loadData(feedback) {
        var data = JSON.parse(feedback);
        console.log(data);
        document.getElementById("detailFId").value = data.feedback_id;
        document.getElementById("detailContent").value = data.content;
        document.getElementById("detailDate").value = data.date;
        //document.getElementById("detailSrate").value = data.star_rate;
        document.getElementById("detailCusId").value = data.customer.name;
        document.getElementById("detailProId").value = data.product.product_name;


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

    // var priceValue = document.querySelectorAll(".priceValue");
    // priceValue.forEach(p => {
    //     var number = parseFloat(p.innerText);
    //     if (!isNaN(number)) {
    //         p.innerText = number.toLocaleString();
    //     }
    // });

    let pages = ${totalPages};

    document.getElementById('pagination').innerHTML = createPagination(pages, ${pageNumber});

    function createPagination(pages, page) {
        let str = '<ul class="page">';
        let active;
        let pageCutLow = page - 1;
        let pageCutHigh = page + 1;
        var name = document.getElementById("inputSearchName");

        // Show the Previous button only if you are on a page other than the first
        if (page > 1) {
            str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + (page - 1) + '"><li onclick="createPagination(pages, ' + (page - 1) + ')" class="page__btn paging">&laquo;</li></a>';
        }
        // Show all the pagination elements if there are less than 6 pages total
        if (pages < 6) {
            for (let p = 1; p <= pages; p++) {
                active = page == p ? "active" : "";
                str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + p + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
        }
        // Use "..." to collapse pages outside of a certain range
        else {
            // Show the very first page followed by a "..." at the beginning of the
            // pagination section (after the Previous button)
            if (page > 2) {
                str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + 1 + '"><li onclick="createPagination(pages, 1)" class="page__numbers paging">1</li></a>';
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
                str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + p + '"><li onclick="createPagination(pages, ' + p + ')" class="page__numbers paging ' + active + '">' + p + '</li></a>';
            }
            // Show the very last page preceded by a "..." at the end of the pagination
            // section (before the Next button)
            if (page < pages - 1) {
                if (page < pages - 2) {
                    str += '<li class="page__dots"><span>...</span></li>';
                }
                str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + pages + '"><li onclick="createPagination(pages, pages)" class="page__numbers paging">' + pages + '</li></a>';
            }
        }
        // Show the Next button only if you are on a page other than the last
        if (page < pages) {
            str += '<a style="color: black" href="adminfeedback?name=' + name.value + '&page=' + (page + 1) + '"><li onclick="createPagination(pages, ' + (page + 1) + ')" class="page__btn paging">&raquo;</li></a>';
        }
        str += '</ul>';
        // Return the pagination string to be outputted in the pug templates
        document.getElementById('pagination').innerHTML = str;
        return str;
    }

    // function showOptions() {
    //     var optionsDiv = document.getElementById("options");
    //     if (optionsDiv.style.display === "none") {
    //         optionsDiv.style.display = "block";
    //     } else {
    //         optionsDiv.style.display = "none";
    //     }
    // }
    var optionsDiv = document.getElementById("options");
    var optionItems = optionsDiv.getElementsByClassName("option-item");
    var hideOptionsTimeout;

    function showOptions() {
        clearTimeout(hideOptionsTimeout);
        optionsDiv.style.display = "block";
        setTimeout(function() {
            optionsDiv.classList.add("show");
            for (var i = 0; i < optionItems.length; i++) {
                optionItems[i].style.opacity = "1";
            }
        }, 10);
    }

    function hideOptions() {
        hideOptionsTimeout = setTimeout(function() {
            var isMouseOverOptions = false;
            for (var i = 0; i < optionItems.length; i++) {
                if (optionItems[i].matches(":hover")) {
                    isMouseOverOptions = true;
                    break;
                }
            }

            if (!optionsDiv.matches(":hover") && !isMouseOverOptions) {
                optionsDiv.classList.remove("show");
                for (var i = 0; i < optionItems.length; i++) {
                    optionItems[i].style.opacity = "0";
                }
                setTimeout(function() {
                    optionsDiv.style.display = "none";
                }, 300);
            }
        }, 200);
    }
</script>

</body>
</html>
