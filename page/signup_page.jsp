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
    <link rel="stylesheet" href="../css/signup_page.css">
    <link rel="stylesheet" href="../css/layout.css">
    <title>회원가입</title>
</head>
<body>
    <main>
        <section class="signup_section">
            <div class="signup_title_container">
                <h1>회원가입</h1>
            </div>
            <form action="../module/login.jsp" method="post" class="signup_form">
                <div class="id_input_container">
                    <div class="input_name_container">
                        아이디
                    </div>
                    <div class="input_container">
                        <input required type="text" name="id" placeholder="abc123" minlength="6" maxlength="12">
                    </div>
                    <button class="check_id_btn" type="button">아이디체크</button>
                </div>
                <div class="pw_input_container">
                    <div class="input_name_container">
                        비밀번호
                    </div>
                    <div class="input_container">
                        <input required type="password" name="pw" placeholder="********" minlength="8" maxlength="12">
                    </div>
                </div>
                <div class="name_input_container">
                    <div class="input_name_container">
                        이름
                    </div>
                    <div class="input_container">
                        <input required type="text" name="name" placeholder="홍길동" minlength="1" maxlength="20">
                    </div>
                </div>
                <div class="phonenumber_input_container">
                    <div class="input_name_container">
                        연락처
                    </div>
                    <div class="input_container">
                        <input required type="text" name="name" placeholder="홍길동" minlength="1" maxlength="20">
                    </div>
                </div>
                <div class="position_input_container">
                    <div class="input_name_container">
                        직급
                    </div>
                    <div class="input_container">
                        <select name="position">

                        </select>
                    </div>
                </div>
                <div class="team_input_container">
                    <div class="input_name_container">
                        팀
                    </div>
                    <div class="input_container">
                        <select name="team">
                            <option value="">data</option>
                        </select>
                    </div>
                </div>
                <div class="submit_btn_container">
                    <button>회원가입</button>
                </div>
            </form>
        </section>
    </main>
</body>