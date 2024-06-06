<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>주문내역</title>
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
            width: 1190px;
            margin: 0 auto;
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

        .order {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            width: 1190px;
            margin: 0 auto;
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
            width: calc(100% - 40px);
        }

        .order-status {
            margin-top: 10px;
        }

        .refund-button {
            background-color: #555;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
        }

        .refund-button:hover {
            background-color: #666;
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

        .divider-between-orders,
        .divider-between-sections {
            width: 1190px;
            height: 0px;
            border: 3px solid #DFDFDF;
            margin: 20px auto;
        }

        .divider-between-sections {
            border: 1px solid #F0F0F0;
        }

        .divider-between-title-and-order {
            border-top: 3px solid #000000;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Refund Popup Styles */
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

        #yes-button {
            background-color: #6200EA;
            color: white;
        }

        #single-item-refund-yes-button {
            background-color: #6200EA;
            color: white;
        }

        #single-item-exchange-yes-button {
            background-color: #6200EA;
            color: white;
        }

        #no-button {
            background-color: #FFFFFF;
            color: black;
            border: 1px solid #000000;
        }

        #single-item-refund-no-button {
            background-color: #FFFFFF;
            color: black;
            border: 1px solid #000000;
        }

        #single-item-exchange-no-button {
            background-color: #FFFFFF;
            color: black;
            border: 1px solid #000000;
        }
    </style>
</head>

<body>
    <header>
        <h1>주문내역</h1>
    </header>
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

    <!-- Container Section -->
    <div class="container">
        <!-- Main Content Section -->
        <main class="main-content inner">
            <h2>주문 내역</h2>

            <div class="divider-between-title-and-order"></div>

            <!-- 첫번째 주문내역 -->
            <section class="order">
                <div class="order-group">

                    <div class="order">

                        <div class="order-text">
                            <p class="order-date">주문일: 2024.03.14
                                <button class="refund-button">환불신청</button>
                            </p>
                            <span class="order-status">배송중</span>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: 39,000원</p>
                                <div class="button-group">
                                    <button class="single-item-exchange-button">교환</button>
                                    <button class="single-item-refund-button">환불</button>
                                </div>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: 39,000원</p>
                                <div class="button-group">
                                    <button class="single-item-exchange-button">교환</button>
                                    <button class="single-item-refund-button">환불</button>
                                </div>
                            </div>
                        </div>
                        <div class="order-details">
                            <img src="tshirt.jpg" alt="티셔츠 이미지">
                            <div class="product-info">
                                <h3>티셔츠</h3>
                                <p>브랜드: ABC</p>
                                <p>상품명: 티셔츠</p>
                                <p>옵션: 블루, L</p>
                                <p>가격: 39,000원</p>
                                <div class="button-group">
                                    <button class="single-item-exchange-button">교환</button>
                                    <button class="single-item-refund-button">환불</button>
                                </div>
                            </div>
                        </div>

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

            <!-- 두번째 주문내역 -->
            <div class="order">


                <div class="order-text">
                    <p class="order-date">주문일: 2024.03.14
                        <button class="refund-button">환불신청</button>
                    </p>
                    <span class="order-status">주문완료</span>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <!-- Divider Between Sections -->
                <div class="divider-between-sections"></div>

                <section class="order-price">
                    <div class="total-section">
                        <p class="total-amount">총 주문금액 <span>78,000원</span></p>
                        <p class="accumulated-points">적립 포인트 <span>780p</span></p>
                    </div>
                </section>
            </div>

            <div class="divider-between-orders"></div>


            <!-- 세번째 주문내역 -->
            <div class="order">


                <div class="order-text">
                    <p class="order-date">주문일: 2024.03.14
                        <button class="refund-button">환불신청</button>
                    </p>
                    <span class="order-status">배송완료</span>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <div class="order-details">
                    <img src="tshirt.jpg" alt="티셔츠 이미지">
                    <div class="product-info">
                        <h3>티셔츠</h3>
                        <p>브랜드: ABC</p>
                        <p>상품명: 티셔츠</p>
                        <p>옵션: 블루, L</p>
                        <p>가격: 39,000원</p>
                        <div class="button-group">
                            <button class="single-item-exchange-button">교환</button>
                            <button class="single-item-refund-button">환불</button>
                        </div>
                    </div>
                </div>
                <!-- Divider Between Sections -->
                <div class="divider-between-sections"></div>

                <section class="order-price">
                    <div class="total-section">
                        <p class="total-amount">총 주문금액 <span>78,000원</span></p>
                        <p class="accumulated-points">적립 포인트 <span>780p</span></p>
                    </div>
                </section>
            </div>

            <!-- 전체주문환불신청 알림 -->
            <div id="refund-popup" class="popup">
                <div class="popup-content">
                    <div class="popup-header">
                        <span class="popup-icon">!</span>
                    </div>
                    <div class="popup-body">
                        <p>환불 신청하시겠습니까?</p>
                    </div>
                    <div class="popup-footer">
                        <button class="popup-button" id="yes-button">예</button>
                        <button class="popup-button" id="no-button">아니오</button>
                    </div>
                </div>
            </div>

            <!-- 개별주문환불신청 알림 -->
            <div id="single-item-refund-popup" class="popup">
                <div class="popup-content">
                    <div class="popup-header">
                        <span class="popup-icon">!</span>
                    </div>
                    <div class="popup-body">
                        <p>환불 신청하시겠습니까?</p>
                    </div>
                    <div class="popup-footer">
                        <button class="popup-button" id="single-item-refund-yes-button">예</button>
                        <button class="popup-button" id="single-item-refund-no-button">아니오</button>
                    </div>
                </div>
            </div>
            <!-- 개별주문교환신청 알림 -->
            <div id="single-item-exchange-popup" class="popup">
                <div class="popup-content">
                    <div class="popup-header">
                        <span class="popup-icon">!</span>
                    </div>
                    <div class="popup-body">
                        <p>교환 신청하시겠습니까?</p>
                    </div>
                    <div class="popup-footer">
                        <button class="popup-button" id="single-item-exchange-yes-button">예</button>
                        <button class="popup-button" id="single-item-exchange-no-button">아니오</button>
                    </div>
                </div>
            </div>



    </div>


    </section>



    </div>


    </main>
    </div>
    <script> 
        function showRefundPopup() {
            document.getElementById('refund-popup').style.display = 'flex';
        }
 
        function hideRefundPopup() {
            document.getElementById('refund-popup').style.display = 'none';
        }

 
        function showSingleItemRefundPopup() {
            document.getElementById('single-item-refund-popup').style.display = 'flex';
        }
 
        function hideSingleItemRefundPopup() {
            document.getElementById('single-item-refund-popup').style.display = 'none';
        }

 
        function showSingleItemExchangePopup() {
            document.getElementById('single-item-exchange-popup').style.display = 'flex';
        }
 
        function hideSingleItemExchangePopup() {
            document.getElementById('single-item-exchange-popup').style.display = 'none';
        }

 
        document.querySelectorAll('.refund-button').forEach(button => {
            button.addEventListener('click', showRefundPopup);
        });

        document.getElementById('yes-button').addEventListener('click', function () { 
            hideRefundPopup();
        });

        document.getElementById('no-button').addEventListener('click', hideRefundPopup);
 
        document.querySelectorAll('.single-item-refund-button').forEach(button => {
            button.addEventListener('click', showSingleItemRefundPopup);
        });

        document.getElementById('single-item-refund-yes-button').addEventListener('click', function () { 
            hideSingleItemRefundPopup();
        });

        document.getElementById('single-item-refund-no-button').addEventListener('click', hideSingleItemRefundPopup);
 
        document.querySelectorAll('.single-item-exchange-button').forEach(button => {
            button.addEventListener('click', showSingleItemExchangePopup);
        });

        document.getElementById('single-item-exchange-yes-button').addEventListener('click', function () { 
            hideSingleItemExchangePopup();
        });

        document.getElementById('single-item-exchange-no-button').addEventListener('click', hideSingleItemExchangePopup);
    </script>
</body>

</html>
