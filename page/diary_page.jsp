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

    //값 불러오기
    String userId = (String)session.getAttribute("userId");
    String selectedUser = request.getParameter("selectedUser");
    String selectedUserName = ""; //선택된 유저의 이름
    String diaryUserName = ""; //현재 볼 다이어리 유저 이름
    String diaryUserId = ""; //현재 볼 다이어리 유저 아이디
    boolean viewAuth = false;
    boolean viewState = false; //false : 내 것을 보고 있음 , true : 다른 사람 것을 보고 있음
    String selectedUserPositionNumber = "255";
    ArrayList<ArrayList<String>> scheduleData = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성

    if(selectedUser == null || selectedUser.equals(userId)){
        //선택된 유저가 없거나 선택된 유저가 내 아이디랑 같을 경우
        diaryUserId = userId;
        viewAuth = true;
    }else{
        //선택된 유저가 있을경우
        String sql3 = "SELECT id,account.name,position.number,team_code FROM account JOIN position ON account.position_code=position.code WHERE id=? ";
        PreparedStatement query3 = connect.prepareStatement(sql3);
        query3.setString(1, selectedUser);

        ResultSet result3 = query3.executeQuery();
        
        while(result3.next()){
            selectedUserPositionNumber = result3.getString(3);
            selectedUserName = result3.getString(2);
        }
        diaryUserId = selectedUser;
    }



    //로그인된 사용자의 정보를 가져옴
    String sql = "SELECT id,account.name,position.number,team_code FROM account JOIN position ON account.position_code=position.code WHERE id=? ";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, userId);

    ResultSet result = query.executeQuery();
     
    ArrayList<String> userData = new ArrayList<String>(); 
    String userPositionNumber = "255";
    String userTeamCode = "";
    while(result.next()){
        userData.add(result.getString(1));
        userData.add(result.getString(2));
        userData.add("`"+result.getString(3)+"`");
        diaryUserName=result.getString(2);
        userPositionNumber = result.getString(3);
        userTeamCode = result.getString(4);
    }



    //권한 확인
    if(viewAuth==false && Integer.parseInt(userPositionNumber) < Integer.parseInt(selectedUserPositionNumber)){
        viewAuth = true;
        viewState = true;
        diaryUserId=selectedUser;
        diaryUserName = selectedUserName;
    }




    //다이어리 데이터 가져오기 
    String selectedMonth = request.getParameter("month");
    String selectedYear = request.getParameter("year");
    //년월 파라미터 가져오기
    if(selectedMonth == null){
        selectedMonth = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
    }
    if(selectedYear == null){
        selectedYear = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
    }
    if(viewAuth == true){
        //선택된 유저의 다이어리를 볼 권한이 있다면
        String sql2 = "SELECT * FROM schedule WHERE DATE_FORMAT(date,'%Y-%m') BETWEEN ? AND ? AND author=? ORDER BY date";
        PreparedStatement query2 = connect.prepareStatement(sql2);
        query2.setString(1, selectedYear+"-"+selectedMonth);
        query2.setString(2, selectedYear+"-"+selectedMonth);
        query2.setString(3, diaryUserId);
        
        ResultSet result2 = query2.executeQuery();
        
        while(result2.next()){
            ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
            tmpData.add("\""+result2.getString(1)+"\"");
            tmpData.add("\""+result2.getString(2)+"\"");
            tmpData.add("`"+result2.getString(3)+"`");
            tmpData.add("\""+result2.getString(4)+"\"");
            scheduleData.add(tmpData);
            //scheduleResultString = scheduleResultString + "[\`"+result2.getString(1)+"\`" +","+"\""+result2.getString(2)+"\""+","+"\""+result2.getString(3)+"\""+","+"\""+result2.getString(4)+"\""+"],";
        }
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
<body style="overflow-x:hidden">
    <%@ include file="../module/sidebar.jsp"%>
    <%@ include file="../module/nav.jsp" %>
    <main>
        <section class="diary_section">
            <div class="diary_title_container">
                <button class="move_before_month_btn" onclick="clickMoveBeforePageBtnEvent('<%=selectedYear%>','<%=selectedMonth%>')"></button>
                <div class="diary_title">
                    <h1><%=selectedYear%>년 <%=selectedMonth%>월</h1> 
                    <span>다이어리 <p>(<%=diaryUserName%>)</p></span>
                </div>
                <button class="move_next_month_btn" onclick="clickMoveNextPageBtnEvent('<%=selectedYear%>','<%=selectedMonth%>')"></button>
            </div>
            <div class="diary_container">
                <form action="../module/add_schedule.jsp" class="schedule_form">
                    <div class="schedule_date_time_input_container">
                        <input required type="datetime-local" name="datetime" min="1970-01-01T00:01" max="2038-01-19T03:14">
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
        viewDiaryAuth(<%=viewAuth%>);
        viewStateSet(<%=viewState%>);
        //console.log('<%=userPositionNumber%>','<%=selectedUserPositionNumber%>')
    </script>
</body>