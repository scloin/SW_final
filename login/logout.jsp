<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
<meta charset="UTF-8">
</head>
<body>

<%@ include file="/noonoocine/head.jsp" %>
<div id="Logo" style="text-align:center">로그아웃 되었습니다!</div>
<% session.invalidate(); %>
<br><br>
<div style="text-align:center">

  <a href = "login.jsp" id="movieinfo" >
  <div style="background-color:#f47835; width:200px; height:60px; margin-left:auto; margin-right:auto; border-radius:30px; line-height : 60px;">
  로그인</div>
  </a><br>
  <a href = "../main.jsp" id="movieinfo" >
  <div style="background-color:#f47835; width:200px; height:60px; margin-left:auto; margin-right:auto; border-radius:30px; line-height : 60px;">
  처음으로</div>
  </a><br>
</div>
</body>
</html>
