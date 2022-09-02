<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<% 
    //String 받아오기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phoneNumber = request.getParameter("phoneNumber");
    String position_code = request.getParameter("position");
    String team_code = request.getParameter("team");

    //받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "INSERT INTO account (id,pw,name,position_code,team_code,phone_number) VALUES (?, ?, ?, ?, ?,?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);
    query.setString(3, name);
    query.setString(4, position_code);
    query.setString(5, team_code);    
    query.setString(6, phoneNumber);
    
    //sql문 전송    
    query.executeUpdate();
%> 

<script>
    location.href = "../page/login_page.jsp";
</script>