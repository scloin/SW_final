<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<form action="../movie/movieinfo.jsp" method="get">
<table id="movielist" >
<%

String msg = null;
String sql = "SELECT * From movie order by opendt desc;";
String info[]={"","","","",""};

Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
int i=0;
String bgc;
while(rs.next()){
	
	info[0] = rs.getString("movieNm");
	info[1] = rs.getString("genreAlt");
	info[2] = rs.getString("prdtstatNm");
	info[3] = rs.getString("directors");
	info[4] = request.getContextPath()+"/noonoocine/"+ rs.getString("poster");
	if (i%2==0) bgc="#000000";
	else bgc="#242424";
	i++;
%>
<tr><td>
<input type="submit" name="movie" style="all: unset; background-size : cover; background-image: url(<%= info[4]%>); width: 69px;height: 100px; font-size: 0;line-height: 0;" value="<%= info[0]%>">
</td>
<td style="background-color: <%= bgc%>; border-radius:10px;">
<p>영화 이름 : <%=info[0] %><br>
장르 : <%=info[1] %><br>
개봉 정보 : <%=info[2] %></p>
</td>
</tr>


<%
}
rs.close();
pstmt.close();
%>
</table>
</form>
</body>
</html>