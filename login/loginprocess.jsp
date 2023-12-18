<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
<title>loginprocess</title>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<div id="Logo" style="text-align:center">
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String storedpw = null;
	boolean authority = false;
	Connection conn = ConnectionContext.getConnection(); 
		    try {
		    	String sql = "SELECT pw, authority From user Where id='"+id+"';";
		    	PreparedStatement pstmt = conn.prepareStatement(sql);
		        if (conn != null) {
			        ResultSet rs = pstmt.executeQuery();
			        if (rs.next()){
			        	storedpw = rs.getString("pw");
			        	authority = rs.getBoolean("authority");
			        	if(storedpw != null && storedpw.equals(pw)){
			        		if(!authority){
			        			out.println( id+"님 로그인 되었습니다.");
			        		}else{
			        			session.setAttribute("auth",authority);
			        		}
			        		session.setAttribute("id",id);
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
%>
</div><br>
<div style="text-align:center">
<%
  
  String check = (String)session.getAttribute("id");

  if(authority){ 
	  response.sendRedirect("../admin/admin.jsp"); 
 }
  
  else {
	  if(check != null) { %> 
    <a href = "../main.jsp" id="Teal" >
    <div style="background-color:#576F72; width:200px; margin-left:auto; margin-right:auto; border-radius:20px">
    예매하러가기</div></a><br>
    <a href = "logout.jsp" id="Teal" >
    <div style="background-color:#576F72; width:200px; margin-left:auto; margin-right:auto; border-radius:20px">
    로그아웃</div></a><br>
    <% } else { %>
    <a href = "login.jsp" id="Teal" >
    <div style="background-color:#576F72; width:200px; margin-left:auto; margin-right:auto; border-radius:20px">
    로그인 다시하기</div></a>
    <% } 
}%>
</div>
</body>
</html>
