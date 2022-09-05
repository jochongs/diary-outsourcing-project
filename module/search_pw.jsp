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
    String id = request.getParameter("id");
    String phoneNumber = request.getParameter("phone_number");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "SELECT pw FROM account WHERE phone_number=? AND id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, phoneNumber);
    query.setString(2, id);

    //sql문 전송    
    ResultSet result = query.executeQuery();
    ArrayList<String> searchUserPw = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
    while(result.next()){
        searchUserPw.add("`"+result.getString(1)+"`");
    }
%>

<script>
    const searchResult = <%=searchUserPw%>;
    if(searchResult.length === 0){
        //비밀번호 찾지 못했을 때
        alert("비밀번호 찾지 못했습니다.");
        location.href = "../page/search_pw_page.jsp";
    }else{
        //비밀번호 찾았을 때
        alert(`비밀번호 찾았습니다 비밀번호 : ` + searchResult[0]);
        location.href = "../page/login_page.jsp";
    }
</script>