<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB에 예약 정보 추가</title></head>
<body>
  <%
  String id = "12345";//(String)session.getAttribute("user_id");
  String sql="select * from movie as m, booking as b where id = '"+id+"' and b.movidcd=m.movidcd";
  Connection conn = ConnectionContext.getConnection();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  out.println(id+"님의 예매 내역입니다.<br><br>");
  
  while (rs.next()){
	  String movie_id = rs.getString("movidCD");
	  String movie_title = rs.getString("movienm");
	  String opendt = rs.getString("opendt");
	  boolean user_reviewed = false; // NEED db query

	  String seat = rs.getString("seat");
	  int price = rs.getInt("price");
	  
	  out.println("영화 제목 : "+movie_title+"<br>");
	  out.println("상영 일시 : "+opendt.substring(0,4)+"년 "+opendt.substring(4,6)+"월 "+opendt.substring(6)+"일"+"<br>");
	  out.println("이용 좌석 : "+seat+"<br>");
	  out.println("결제 금액 : "+price+"원<br><br>");
	  
	    out.println("<form action='add_rating.jsp' method='post'>");
	    out.println("<input type='hidden' name='movie_id' value='" + movie_id + "'>");
	    if (!user_reviewed){
		    out.println("별점: <select name='rating'>");
		    for (int i = 1; i <= 5; i++) {
		      out.println("<option value='" + i + "'>" + i + "</option>");
		    }
		    out.println("</select>");
		    out.println("<input type='hidden' name='movie_id' value='movie_id'>");
		    out.println("<input type='hidden' name='user_id' value='id'>");
		    out.println("<input type='submit' value='별점 주기'>");
		    out.println("</form><br><br>");
	    }
  }
  rs.close();
  stmt.close();
  %>
</body>
</html>
