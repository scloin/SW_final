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
<%@ include file="/noonoocine/head.jsp" %>
<%
String moviename=request.getParameter("movie");

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
	info[3] = request.getContextPath()+"/noonoocine/"+ rs.getString("poster");
}
rs.close();
pstmt.close();

%>
<form action="../booking/booking.jsp" method="get"><input type="hidden" name="movie" value="<%=moviename %>">
<table id="plaintext" style="border-spacing: 30px; align:center; margin-left:auto; margin-right:auto;" >
<tr><td>
<a href=<%=info[3] %> title="<%=moviename %>" target="_blank">
<img src=<%=info[3] %> width="240px" height="320px">
</a>
</td>
<td id="movieinfo" style="width:345px;" >
<table id="plaintext" style="width:345px; height:320px">
<tr><td style="font-size:35px; height:50px" colspan="3">
<%=moviename %><hr color="#424242" size="5px">
</td></tr>
<tr><td style="width:90px;">장르 </td>
<td style="width:20px;height:20px; color:#424242">|</td>
<td> <%=info[0] %></td></tr>
<tr><td>감독 </td>
<td style="width:20px;height:20px; color:#424242">|</td>
<td> <%=info[2] %></td></tr>
<tr><td>개봉 정보 </td>
<td style="width:20px;height:20px; color:#424242">|</td>
<td> <%=info[1] %></td></tr>
<tr><td colspan="3" style="text-align:center;">
<input type="submit" value="예매하기" name="booking" style="all: unset; background-color:#3366FF;  width:200px; height:50px; border-radius: 10px;">
</td></tr>
</table>
</td>
</tr>
</table>
</form>
<jsp:include page="usercontent.jsp"/>
</body>
</html>