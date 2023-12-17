<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% session.invalidate(); %>
<head>
<meta charset="UTF-8">
</head>
<br>
<body>

<%@ include file="/noonoocine/head.jsp" %>
<p id="Logo">로그아웃 되었습니다!</p>
  <a href = "login.jsp" id="movieinfo" >로그인</a><br>
  <a href = "../main.jsp" id="movieinfo" >처음으로</a><br>

</body>
</html>
