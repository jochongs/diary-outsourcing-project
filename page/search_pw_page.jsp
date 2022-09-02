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
    <link rel="stylesheet" href="../css/search_pw_page.css">
    <link rel="stylesheet" href="../css/layout.css">
    <title>비밀번호찾기</title>
</head>
<body>
    <main>
        <section class="search_pw_section">
            <div class="search_pw_title_container">
                <h1>비밀번호찾기</h1>
            </div>
            <form action="../module/search_id.jsp" method="post" class="search_pw_form">
                <div class="phonenumber_input_container">
                    <div class="input_name_container">
                        아이디
                    </div>
                    <div class="input_container">
                        <input required type="text" name="text" placeholder="abc123" minlength="6" maxlength="12">
                    </div>
                </div>
                <div class="phonenumber_input_container">
                    <div class="input_name_container">
                        연락처
                    </div>
                    <div class="input_container">
                        <input required type="text" name="text" placeholder="-없이" minlength="11" maxlength="11">
                    </div>
                </div>
                <div class="submit_btn_container">
                    <button>비밀번호 찾기</button>
                </div>
            </form>
        </section>
    </main>
</body>