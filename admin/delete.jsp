<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<%  int succ = 0;
	String mem = request.getParameter("member");
	Connection conn = ConnectionContext.getConnection(); 
	if (conn != null) {
    	String sql = "DELETE FROM USER WHERE id = ?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, mem);
		succ= pstmt.executeUpdate(); } %>
	
	<script> 	
	<% if (succ > 0) { %>
            document.write("<p id='Logo' style='text-align: center;'>삭제에 성공했습니다.</p>");
 <%        } else {     %>
	 		document.write("<p id='Logo' style='text-align: center;'>삭제에 실패했습니다.</p>");
 <%        }%>
</script>	
</body>
</html>
