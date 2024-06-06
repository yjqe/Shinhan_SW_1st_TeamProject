<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>대여내역</title>
    <style>
        .inner {
            max-width: 1300px;
            margin: 0 auto;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
            background-color: #444;
            margin: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #fff;
            background-color: #555;
            padding: 5px 10px;
            border-radius: 3px;
        }

        nav ul li a:hover {
            background-color: #666;
        }

        .container {
            display: flex;
            justify-content: space-between; 
            align-items: flex-start;
            padding: 20px; 
        }

        .sidebar h2 {
            margin-top: 0;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            background-color: #fff;
            padding: 5px 10px;
            border-radius: 3px;
            display: block;
        }

        .sidebar ul li a:hover {
            background-color: #ddd;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: white;
        }

        .main-content h2 {
            margin-top: 0;
        }

        section {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
        }

        section h3 {
            margin-top: 0;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }

        .order-text {
            display: flex;
            justify-content: space-between;
        }

        .order-status-wrapper {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-top: 10px;
        }

        .order-status {
            margin-bottom: 5px; 
            margin-right: auto !important;
        }

        .order {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            width: 1190px;
            margin: 20px auto;
        }

        .order-group {
            display: flex;
            flex-direction: column;
        }

        .order-details {
            display: flex;
            align-items: center;
            margin-bottom: 20px; 
        }

        .order-date {
            margin-top: 10px;
        }

        .product-info {
            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }

        .product-info img {
            max-width: 100px;
            max-height: 100px;
        }

        .product-info p {
            margin: 5px 0;
        }

        .order-text {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .order-status,
        .return-button {
            margin: 5px 0;
        }

        .product-info img {
            max-width: 100px;
            max-height: 100px;
        }

        .product-info p {
            margin: 5px 0;
        }

        .divider {
            margin: 20px auto;
            width: 80%;
        }

        .total-section {
            text-align: center;
            margin: auto;
            max-width: 200px;
        }

        .total-amount,
        .accumulated-points {
            margin: 10px 0;
        }

        .total-amount span,
        .accumulated-points span {
            float: right;
        }

        .divider-between-orders {
            position: relative;
            width: 1190px;
            height: 0px;
            border: 3px solid #DFDFDF;
            margin: 20px auto;
        }

        .divider-between-sections {
            width: 1190px;
            height: 0px;
            border: 1px solid #F0F0F0;
            margin-top: 20px;
            margin-bottom: 20px;
            margin: 20px auto;
        }

        .divider-between-title-and-order {
            border-top: 3px solid #000000;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Return Popup Styles */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background-color: white;
            padding: 20px;
            text-align: center;
            max-width: 300px;
            width: 100%;
        }

        .popup-header {
            margin-bottom: 20px;
        }

        .popup-icon {
            font-size: 30px;
            font-weight: bold;
            color: black;
        }

        .popup-body {
            margin-bottom: 20px;
        }

        .popup-footer {
            display: flex;
            justify-content: space-around;
        }

        .popup-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #return-yes-button {
            background-color: #6200EA;
            color: white;
        }

        #return-no-button {
            background-color: #FFFFFF;
            color: black;
            border: 1px solid #000000;
        }
    </style>
</head>

<body>
    <!-- Header Section -->
    <header>
        <h1>Web Test</h1>
    </header>
    <!-- Navigation Section -->
    <nav>
        <ul>
            <li><a href="women.jsp">여성</a></li>
            <li><a href="men.jsp">남성</a></li>
            <li><a href="kids.jsp">키즈</a></li>
            <li><a href="luxury.jsp">럭셔리</a></li>
            <li><a href="sports.jsp">스포츠</a></li>
            <li><a href="bags.jsp">가방&신발</a></li>
            <li><a href="accessories.jsp">악세사리</a></li>
            <li><a href="ai-recommend.jsp">AI추천코디</a></li>
            <li><a href="rental.jsp">옷대여</a></li>
            <li><a href="notice.jsp">공지사항</a></li>
            <li><a href="qa.jsp">Q&A</a></li>
        </ul>
    </nav>

    <!-- 컨테이너 -->
    <div class="container">
        <!-- 메인 컨텐츠 -->
        <main class="main-content inner">
            <h2>대여 내역</h2>

            <div class="divider-between-title-and-order"></div>

            <!-- 첫번째 대여내역 -->
            <section class="order">
                <div class="order-group">

                    <div class="order">


                        <div class="order-text">
                            <p class="order-date">대여일: 2024.03.14</p>
                            <div class="order-status-wrapper">
                                <span class="order-status">대여중</span>
                                <button class="return-button">반납하기</button>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>

                    </div>
            </section>

            <!-- Divider Between Sections -->
            <div class="divider-between-sections"></div>

            <section class="rent-date">
                <div class="total-section">
                    <p class="total-amount">대여 일자 <span>2024.03.14</span></p>
                    <p class="accumulated-points">반납 예정일 <span>2024.03.21</span></p>
                </div>
            </section>
            <!-- Divider Between Sections -->
            <div class="divider-between-sections"></div>

            <section class="order-price">
                <div class="total-section">
                    <p class="total-amount">총 주문금액 <span>78,000원</span></p>
                    <p class="accumulated-points">적립 포인트 <span>780p</span></p>
                </div>
            </section>

            <div class="divider-between-orders"></div>

            <!-- 두번째 대여내역 -->
            <section class="order">
                <div class="order-group">

                    <div class="order">


                        <div class="order-text">
                            <p class="order-date">대여일: 2024.03.14</p>
                            <div class="order-status-wrapper">
                                <span class="order-status">대여중</span>
                                <button class="return-button">반납하기</button>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: $20</p>
                            </div>
                        </div>

                    </div>
            </section>

            <!-- Divider Between Sections -->
            <div class="divider-between-sections"></div>

            <section class="rent-date">
                <div class="total-section">
                    <p class="total-amount">대여 일자 <span>2024.03.14</span></p>
                    <p class="accumulated-points">반납 예정일 <span>2024.03.21</span></p>
                </div>
            </section>
            <!-- Divider Between Sections -->
            <div class="divider-between-sections"></div>

            <section class="order-price">
                <div class="total-section">
                    <p class="total-amount">총 주문금액 <span>78,000원</span></p>
                    <p class="accumulated-points">적립 포인트 <span>780p</span></p>
                </div>
            </section>
    </div>

    <!-- 반납신청알림 -->
    <div id="return-popup" class="popup">
        <div class="popup-content">
            <div class="popup-header">
                <span class="popup-icon">!</span>
            </div>
            <div class="popup-body">
                <p>반납 신청하시겠습니까?</p>
            </div>
            <div class="popup-footer">
                <button class="popup-button" id="return-yes-button">예</button>
                <button class="popup-button" id="return-no-button">아니오</button>
            </div>
        </div>
    </div>

    </div>


    </section>



    </div>


    </main>
    </div>
    <script>
        /* Function to show the return popup */
        function showReturnPopup() {
            document.getElementById('return-popup').style.display = 'flex';
        }

        /* Function to hide the return popup */
        function hideReturnPopup() {
            document.getElementById('return-popup').style.display = 'none';
        }

        /* Add event listeners to return buttons */
        document.querySelectorAll('.return-button').forEach(button => {
            button.addEventListener('click', showReturnPopup);
        });

        document.getElementById('return-yes-button').addEventListener('click', function () {
            Handle the return logic here
            hideReturnPopup();
        });

        document.getElementById('return-no-button').addEventListener('click', hideReturnPopup);
    </script>
</body>

</html>
