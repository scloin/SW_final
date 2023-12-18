<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>

<head>
<meta charset="UTF-8">
<title>DB insert</title>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<% request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("name");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  int age = Integer.parseInt(request.getParameter("age"));
  String sex = request.getParameter("gender");
  int succ = 0;
  out.println(id + pw + name + age + sex);
  Connection conn = ConnectionContext.getConnection(); 
	    try {
	        if (conn != null) {
	            out.println("연결 성공");
	            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO user (id, name, pw, age, sex, authority) VALUES (?, ?, ?, ?, ?, ?);");
		        out.println("PreparedStatement 생성 성공");	        
		        pstmt.setString(1, id);
		        pstmt.setString(2, name);
		        pstmt.setString(3, pw);
		        pstmt.setInt(4, age);
		        pstmt.setString(5, sex);
		        pstmt.setInt(6, 0);
		        succ = pstmt.executeUpdate();
		        
	            if (succ > 0) {
	                out.println("데이터 삽입 성공");
	            } else {
	                out.println("데이터 삽입 실패");
	            } 
	            pstmt.close();
	        } else {
	            out.println("연결 실패");
	        }
	        //conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	%>
<script> 
    <% if (succ == 1) { %>
    	document.write("<p id='Logo' style='text-align: center;'>회원가입에 성공하셨습니다!</p>");
    <% } else { %>
    	document.write("<p id='Logo' style='text-align: center;'>이미 존재하는 id입니다. 다시 입력해주세요</p>");
    <% } %>
</script>

  <a href = "login.jsp" id="movieinfo"><div style="background-color:#576F72; width:100px; margin-left:auto; margin-right:auto; border-radius:10px">
    로그인</div></a><br>
  <a href = "../main.jsp" id="movieinfo"><div style="background-color:#576F72; width:120px; margin-left:auto; margin-right:auto; border-radius:10px">
  처음으로</div></a><br>
  <a href = "register.jsp" id="movieinfo" ><div style="background-color:#576F72; width:120px; margin-left:auto; margin-right:auto; border-radius:10px">
  다시하기</div></a> 
</body>
</html>
