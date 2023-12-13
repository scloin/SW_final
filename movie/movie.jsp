<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
</head>
<br>
<body>
<%@ include file="/noonoocine/main.html" %>
<%
String movienum=request.getParameter("movie");
String moviename=request.getParameter(movienum);

String msg = null;
String sql = "SELECT * From movie Where movieNm='"+moviename+"';";
String info[]={"","","",""};

Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

if (rs.next()){
	info[0] = rs.getString("genreAlt");
	info[1] = rs.getString("prdtstatNm");
	info[2] = rs.getString("directors");
	info[3] = rs.getString("poster");
}
rs.close();
pstmt.close();
info[3]="/swsw/noonoocine/"+info[3];
%>
<table id="plaintext" style="border-spacing: 30px; align:center; margin-left:auto; margin-right:auto;" >
<tr><td>
<img src=<%=info[3] %> width="345px" height="500px">
</td>
<td id="movieinfo" style="width:345px;" >
<p>영화 이름 : <%=moviename %></p>
<p>장르 : <%=info[0] %></p>
<p>감독 : <%=info[2] %></p>
<p>개봉 정보 : <%=info[1] %></p>
</td>
</tr>

</table>
</body>
</html>