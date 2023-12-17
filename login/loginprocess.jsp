<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
<title>loginprocess</title>
</head>
<body id="Logo" margin ="auto">
<%@ include file="/noonoocine/head.jsp" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String storedpw = null;
	  
	Connection conn = ConnectionContext.getConnection(); 
		    try {
		    	String sql = "SELECT pw From user Where id='"+id+"';";
		    	PreparedStatement pstmt = conn.prepareStatement(sql);
		        if (conn != null) {
			        ResultSet rs = pstmt.executeQuery();
			        if (rs.next()){
			        	storedpw = rs.getString("pw");
			        	if(storedpw != null && storedpw.equals(pw)){
			        		session.setAttribute("id",id);
			        		out.println("로그인 되었습니다.");
			        	}
			        	else{
			        		out.println("비밀번호가 틀렸습니다.");
			        	}
			        }
			        else{
			        	out.println("해당하는 사용자가 없습니다.");
			        }
			        rs.close();
		            pstmt.close();
		        } else {
		            out.println("연결 실패");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
%><br>  
  
  <% String check = (String)session.getAttribute("id");
  if (check != null) { %> 
    <div style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href = "../main.jsp" id="movieinfo" >예매하러가기</a><br>
    <div style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href = "logout.jsp" id="movieinfo" >로그아웃</a><br>
    </div>
    <% } else { %>
    <div style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href = "login.jsp" id="movieinfo" >로그인 다시하기</a> 
    </div>
    <% } %>
</body>
</html>
