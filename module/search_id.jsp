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
    String phoneNumber = request.getParameter("phone_number");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "SELECT id FROM account WHERE phone_number=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, phoneNumber);

    //sql문 전송    
    ResultSet result = query.executeQuery();
    ArrayList<String> searchUserId = new ArrayList<String>(); //2차원 배열에 들어갈 배열 생성
    while(result.next()){
        searchUserId.add("`"+result.getString(1)+"`");
    }
%>

<script>
    const searchResult = <%=searchUserId%>;
    if(searchResult.legnth === 0){
        //아이디를 찾지 못했을 때
        alert("아이디를 찾지 못했습니다.");
        location.href = "../page/search_id_page.jsp";
    }else{
        //아이디를 찾았을 때
        alert(`아이디를 찾았습니다 아이디 : ` + searchResult[0]);
        location.href = "../page/login_page.jsp";
    }
</script>