<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<% 
    
%> 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/variable.css">
    <link rel="stylesheet" href="../css/login_page.css">
    <link rel="stylesheet" href="../css/layout.css">
    <title>로그인</title>
</head>
<body>
    <main>
        <section class="login_section">
            <div class="login_title_container">
                <h1>로그인</h1>
            </div>
            <form action="../module/login.jsp" method="post" class="login_form">
                <div class="id_input_container">
                    <input type="text" name="id" minlength="6" maxlength="12" placeholder="abc123">
                </div>
                <div class="pw_input_container">
                    <input type="password" name="pw" minlength="8" maxlength="12" placeholder="*********">
                </div>
                <div class="page_move_btn_container">
                    <div class="signup_btn_container">
                        <button type="button" onclick="clickSignupBtnEvent()">회원가입</button>
                    </div>
                    <div class="search_btn_container">
                        <button type="button" onclick="clickSearchIdBtnEvent()">아이디찾기</button>/<button type="button" onclick="clickSearchPwBtnEvent()">비밀번호찾기</button>
                    </div>
                </div>
                <div class="submit_btn_container">
                    <button class="submit_btn">로그인</button>
                </div>
            </form>
        </section>
    </main>
    <script src="../js/login_page.js"></script>
</body>