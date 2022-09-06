<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<% 
    String id = request.getParameter("id");
    
     //받아오는 값에 대한 인코딩 지정
     request.setCharacterEncoding("utf-8");
    
    //데이터베이스연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary","guest","1234");

    //sql준비
    String sql = "SELECT id FROM account";
    PreparedStatement query = connect.prepareStatement(sql);
    
    //sql문 전송    
    ResultSet result = query.executeQuery();

    boolean checkId = true;
    ArrayList<String> accountData = new ArrayList<String>();
    while(result.next()){
        accountData.add("\""+result.getString(1)+"\"");
        if(id.equals(result.getString(1))){
            checkId = false;
        }
    }
    
%> 
<head>
    <%@ include file="../module/meta.jsp"%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/variable.css">
    <link rel="stylesheet" href="../css/layout.css">
    <link rel="stylesheet" href="../css/id_check_page.css">
    <title>아이디 중복 체크</title>
</head>
<body>
    <main>
        <section class="id_check_section">
            <div class="id_check_title_container">

            </div>
            <div class="id_check_btn_container">

            </div>
        </section>
    </main>
    <script src="../js/id_check_page.js"></script>
    <script>
        checkIdFunc(<%=checkId%>,'<%=id%>')
    </script>
</body>