<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ include file="../module/login_auth.jsp"%>
<% 
    //받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");
        
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //session값 불러오기
    String selectedUser = (String)session.getAttribute("selectedUser");
    String userId = (String)session.getAttribute("userId");
    boolean viewOtherUser = false;
    if(selectedUser == null){
        selectedUser = userId;
        viewOtherUser = true;
    }
    //sql준비
    String sql = "SELECT id,name FROM account WHERE id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, selectedUser);

    

    //sql문 전송    
    ResultSet result = query.executeQuery();
     
    //2차원 결과 배열 생성
    ArrayList<String> userData = new ArrayList<String>(); 
    while(result.next()){
        userData.add(result.getString(1));
        userData.add(result.getString(2));
    }
%> 
<%
    //년월 파라미터 가져오기
    String selectedMonth = request.getParameter("month");
    String selectedYear = request.getParameter("year");

    if(selectedMonth == null){
        selectedMonth = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
    }
    if(selectedYear == null){
        selectedYear = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
    }

    //sql준비
    String sql2 = "SELECT * FROM schedule WHERE DATE_FORMAT(date,'%Y-%m') BETWEEN ? AND ? AND author=? ORDER BY date";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1, selectedYear+"-"+selectedMonth);
    query2.setString(2, selectedYear+"-"+selectedMonth);
    query2.setString(3, selectedUser);
    
    //sql문 전송    
    ResultSet result2 = query2.executeQuery();
    ArrayList<ArrayList<String>> scheduleData = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성
    while(result2.next()){
        ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
        tmpData.add("\""+result2.getString(1)+"\"");
        tmpData.add("\""+result2.getString(2)+"\"");
        tmpData.add("`"+result2.getString(3)+"`");
        tmpData.add("\""+result2.getString(4)+"\"");
        scheduleData.add(tmpData);
        //scheduleResultString = scheduleResultString + "[\`"+result2.getString(1)+"\`" +","+"\""+result2.getString(2)+"\""+","+"\""+result2.getString(3)+"\""+","+"\""+result2.getString(4)+"\""+"],";
    }
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
    <link rel="stylesheet" href="../css/sidebar.css">
    <title>다이어리 페이지</title>
</head>
<body>
    <%@ include file="../module/sidebar.jsp"%>
    <%@ include file="../module/nav.jsp" %>
    <main>
        <section class="diary_section">
            <div class="diary_title_container">
                <button class="move_before_month_btn" onclick="clickMoveBeforePageBtnEvent('<%=selectedYear%>','<%=selectedMonth%>')"></button>
                <div class="diary_title">
                    <h1><%=selectedYear%>년 <%=selectedMonth%>월</h1> 
                    <span>다이어리 <p>(<%=userData.get(1)%>)</p></span>
                </div>
                <button class="move_next_month_btn" onclick="clickMoveNextPageBtnEvent('<%=selectedYear%>','<%=selectedMonth%>')"></button>
            </div>
            <div class="diary_container">
                <form action="../module/add_schedule.jsp" class="schedule_form">
                    <div class="schedule_date_time_input_container">
                        <input required type="datetime-local" name="datetime">
                        <!-- <input required type="time" name="time">  -->
                    </div>
                    <div class="schedule_contents_input_container">
                        <textarea required name="contents" placeholder="일정 내용을 입력해주세요"></textarea>
                    </div>
                    <div class="schedule_submit_btn_container">
                        <button type="submit">일정추가</button>
                    </div>
                </form>
                <div class="schedule_container">
                    <!-- modify input form 동적 생성을 위한 예시 div
                        <div class="schedule_date_container">
                        <div class="schedule_date_title_container">
                            2022년 08월 03일
                        </div>
                        <div class="schedule_item">
                            <form action="../module/modify_schedule.jsp">
                                <div class="schedule_time_container">
                                    <input class="datetime_input" name="datetime" type="datetime-local" value="2022-02-02 12:00">
                                </div>
                                <div class="schedule_contents_container">
                                    <textarea name="contents"></textarea>
                                </div>
                                <div class="schedule_btn_container">
                                    <button class="modify_schedule_btn">수정완료</button>
                                    <button class="delete_schedule_btn">취소</button>
                                </div>
                            </form>
                        </div>
                    </div> -->
                </div>
            </div>
        </section>
    </main>
    <script src="../js/diary_page.js"></script>
    <script src="../js/nav.js"></script>
    <script>
        addSchedule(<%=scheduleData%>);
    </script>
</body>