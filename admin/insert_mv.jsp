<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/noonoocine/head.jsp" %>
<html>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
<title>MV insert</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
int movieCD = Integer.parseInt(request.getParameter("movieCd"));
String movieNm = request.getParameter("movieNm");
String opendt = request.getParameter("opendt");
String prdtstatNm = request.getParameter("prdtstatNm");
String genreAlt = request.getParameter("genreAlt");
String directors = request.getParameter("directors");
String poster = request.getParameter("url");

int succ = 0;
Connection conn = ConnectionContext.getConnection();

try {
    if (conn != null) {
    	String sql = "INSERT INTO movie (movidCD, movieNm, opendt, prdtstatNm, genreAlt, directors, poster) VALUES (?, ?, ?, ?, ?, ?, ?)";
        //out.println("연결 성공");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        pstmt.setInt(1, movieCD);
        pstmt.setString(2, movieNm);
        pstmt.setString(3, opendt);
        pstmt.setString(4, prdtstatNm);
        pstmt.setString(5, genreAlt);
        pstmt.setString(6, directors);
        pstmt.setString(7, poster);
        succ = pstmt.executeUpdate();
        
        pstmt.close();
    } else {
        out.println("연결 실패");
    }
} catch (SQLException e) {
    e.printStackTrace();
} 
%>

<% if (succ == 1) { 
		String path = "/swsw/noonoocine/"+ poster ;%>

		<p id='gra' style='text-align: center;' >
		영화 코드 : <%= movieCD %><br>
		영화 이름 : <%= movieNm %><br>
		개봉 날짜: <%= opendt %><br>
		장르 : <%= genreAlt %><br>
		개봉 정보 : <%= prdtstatNm %><br>
		감독 :<%= directors %><br>
		이미지 경로 :<%= poster %><br></p>
		<img src= "<%= path %>" width="200px" height="250px" style="display: block; margin: 0 auto;">
document.write("<p id='gra' style='text-align: center;'> ------ 성공적으로 추가되었습니다. ------ </p>");
<% } else { %>
document.write("<p id='gra' style='text-align: center;'> ------ 이미 존재하는 영화입니다. ------ </p>");
<% } %>


<a href = "admin.jsp" id="movieinfo" >영화 더 추가하기</a> 

</body>
</html>
