<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    boolean loginAuth = true;
    if((String)session.getAttribute("userId")==null){
        loginAuth = false;
    }
%>  

<script>
    const loginAuth = <%=loginAuth%>;
    if(loginAuth === false){
        location.href = "../page/login.jsp";
    }
</script>