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
    //String 받아오기
    String userId = (String)session.getAttribute("userId");
    String datetime = request.getParameter("datetime");
    String contents = request.getParameter("contents");
    String idx = request.getParameter("idx");

    //받아오는 값에 대한 인코딩 지정
    request.setCharacterEncoding("utf-8");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "UPDATE schedule SET date=?,contents=? WHERE author=? AND idx=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, datetime);
    query.setString(2, contents);
    query.setString(3, userId);
    query.setString(4, idx);
    
    //sql문 전송    
    query.executeUpdate();

    String month = new java.text.SimpleDateFormat("MM").parse(datetime);
    String year = new java.text.SimpleDateFormat("yyyy").parse(datetime);
%>

<script>
    const date = new Date("<%=datetime%>");
    const month = (date.getMonth()+1).toString().padStart(2,0);
    const year = date.getFullYear().toString().padStart(2,0);
    location.href = '../page/diary_page.jsp?year'+year+'&month='+month;
</script>