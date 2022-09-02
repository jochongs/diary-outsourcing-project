<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<% 
    session.removeAttribute("userId");
%> 
<script>
    location.href = "../page/login.jsp";
</script>