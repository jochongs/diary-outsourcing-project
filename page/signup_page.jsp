<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<% 
    //받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "SELECT * FROM team";
    PreparedStatement query = connect.prepareStatement(sql);
    
    //sql문 전송    
    ResultSet result = query.executeQuery();

    ArrayList<ArrayList<String>> teamData = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성
    while(result.next()){
        ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
        tmpData.add("\""+result.getString(1)+"\"");
        tmpData.add("\""+result.getString(2)+"\"");
        teamData.add(tmpData);
    }

    //sql준비
    String sql2 = "SELECT * FROM position";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    
    //sql문 전송    
    ResultSet result2 = query2.executeQuery();

    ArrayList<ArrayList<String>> positionData = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성
    while(result2.next()){
        ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
        tmpData.add("\""+result2.getString(1)+"\"");
        tmpData.add("\""+result2.getString(2)+"\"");
        tmpData.add("\""+result2.getString(3)+"\"");
        positionData.add(tmpData);
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
            <form action="../module/signup.jsp" method="post" class="signup_form">
                <div class="id_input_container">
                    <div class="input_name_container">
                        아이디
                    </div>
                    <div class="input_container">
                        <input class="check_id_input" required type="text" name="check_id" placeholder="abc123" minlength="6" maxlength="12">
                        <input type="hidden" value="none" class="hidden_id_input" name="id">
                    </div>
                    <button class="check_id_btn" type="button" onclick="clickCheckIdBtnEvent()">중복확인</button>
                </div>
                <div class="pw_input_container">
                    <div class="input_name_container">
                        비밀번호
                    </div>
                    <div class="input_container">
                        <input class="pw_input" required type="password" name="pw" placeholder="********" minlength="8" maxlength="12">
                    </div>
                </div>
                <div class="name_input_container">
                    <div class="input_name_container">
                        이름
                    </div>
                    <div class="input_container">
                        <input class="name_input" required type="text" name="name" placeholder="홍길동" minlength="1" maxlength="20">
                    </div>
                </div>
                <div class="phonenumber_input_container">
                    <div class="input_name_container">
                        연락처
                    </div>
                    <div class="input_container">
                        <input class="phone_number_input" required type="text" name="phoneNumber" placeholder="-없이 입력" minlength="11" maxlength="11">
                    </div>
                </div>
                <div class="position_input_container">
                    <div class="input_name_container">
                        직급
                    </div>
                    <div class="input_container">
                        <select name="position" class="position_select">

                        </select>
                    </div>
                </div>
                <div class="team_input_container">
                    <div class="input_name_container">
                        팀
                    </div>
                    <div class="input_container">
                        <select class="team_select" name="team">
                        </select>
                    </div>
                </div>
                <div class="submit_btn_container">
                    <button>회원가입</button>
                </div>
            </form>
        </section>
    </main>
    <script>
        const teamArray = <%=teamData%>;
        const teamSelect = document.querySelector(".team_select");
        teamArray.map((team,index)=>{
            const teamOption = document.createElement('option');
            teamOption.value = team[0];
            teamOption.innerText = team[1];
            teamSelect.append(teamOption);
        })

        const positionArray = <%=positionData%>;
        const positionSelect = document.querySelector('.position_select');
        positionArray.map((position,index)=>{
            const positionOption = document.createElement('option');
            positionOption.value = position[0];
            positionOption.innerText = position[2];
            positionSelect.append(positionOption);
        })
    </script>
    <script src="../js/signup_page.js"></script>
</body>