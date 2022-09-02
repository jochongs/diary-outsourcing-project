<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<% 
    //받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");

    //받아오는 값을 저장
    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "SELECT * FROM account where id=? AND pw=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    //sql문 전송    
    ResultSet result = query.executeQuery();
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();  //2차원 배열의 껍데기 생성
    while(result.next()){
        ArrayList<String> tmpData = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
        tmpData.add(result.getString(1));
        tmpData.add(result.getString(2));
        data.add(tmpData);
    }
    //아이디와 비밀번호가 동일하면...
    boolean loginState = false;
    if(data.size() != 0){
        //세션을 만들어준다. 
        session.setAttribute("userId",idValue);
        session.setMaxInactiveInterval(60*60*24);
        loginState = true;
    }
%> 
    <script>
        const loginState = <%=loginState%>;
        if(loginState === true){
            //로그인성공
            location.href = "../page/diary_page.jsp";
        }else{
            alert("아이디또는 비밀번호가 잘못되었습니다.");
            location.href = '../page/login_page.jsp';
        }
    </script>