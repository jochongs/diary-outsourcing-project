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
    <link rel="stylesheet" href="../css/diary_page.css">
    <link rel="stylesheet" href="../css/layout.css">
    <link rel="stylesheet" href="../css/nav.css">
    <title>다이어리 페이지</title>
</head>
<body>
    <%@ include file="nav.jsp" %>
    <main>
        <section class="diary_section">
            <div class="diary_title_container">
                <button class="move_before_month_btn"></button>
                <div class="diary_title">
                    <h1>2022년 8월</h1> 
                    <span>다이어리 <p>(민경찬)</p></span>
                </div>
                <button class="move_next_month_btn"></button>
            </div>
            <div class="diary_container">
                <form action="../module/add_schedule.jsp" class="schedule_form">
                    <div class="schedule_date_time_input_container">
                        <input required type="date" name="date">
                        <input required type="time" name="time"> 
                    </div>
                    <div class="schedule_contents_input_container">
                        <textarea required name="contents" placeholder="일정 내용을 입력해주세요"></textarea>
                    </div>
                    <div class="schedule_submit_btn_container">
                        <button>일정추가</button>
                    </div>
                </form>
                <div class="schedule_container">
                    <div class="schedule_date_container">
                        <div class="schedule_date_title_container">
                            2022년 08월 03일
                        </div>
                        <div class="schedule_item">
                            <div class="schedule_time_container">
                                오후 4시 30분
                            </div>
                            <div class="schedule_contents_container">
                                <p>이것도 해야하고 저것도 해야하고
                                </p>
                            </div>
                            <div class="schedule_btn_container">
                                <button class="modify_schedule_btn">일정수정</button>
                                <button class="delete_schedule_btn">일정삭제</button>
                            </div>
                        </div>
                        <div class="schedule_item">
                            <div class="schedule_time_container">
                                오후 4시 30분
                            </div>
                            <div class="schedule_contents_container">
                                <p>이것도 해야하고 저것도 해야하고
                                </p>
                            </div>
                            <div class="schedule_btn_container">
                                <button class="modify_schedule_btn">일정수정</button>
                                <button class="delete_schedule_btn">일정삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="schedule_date_container">
                        <div class="schedule_date_title_container">
                            2022년 08월 03일
                        </div>
                        <div class="schedule_item">
                            <div class="schedule_time_container">
                                오후 4시 30분
                            </div>
                            <div class="schedule_contents_container">
                                <p>이것도 해야하고 저것도 해야하고
                                </p>
                            </div>
                            <div class="schedule_btn_container">
                                <button class="modify_schedule_btn">일정수정</button>
                                <button class="delete_schedule_btn">일정삭제</button>
                            </div>
                        </div>
                        <div class="schedule_item">
                            <div class="schedule_time_container">
                                오후 4시 30분
                            </div>
                            <div class="schedule_contents_container">
                                <p>이것도 해야하고 저것도 해야하고
                                </p>
                            </div>
                            <div class="schedule_btn_container">
                                <button class="modify_schedule_btn">일정수정</button>
                                <button class="delete_schedule_btn">일정삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>