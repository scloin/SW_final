<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB에 예약 정보 추가</title></head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<div style="width:1000px; margin-left:auto; margin-right:auto; text-align:left;">
<div id="gra">
  <%
  String id = (String)session.getAttribute("id");
  String sql= " select sb.*,r.rating "+
  	"from (select movienm,b.* from booking as b, movie as m where b.movidcd=m.movidcd) as sb "+
	"left outer join review as r on sb.id=r.id and sb.movidCD=r.movidCD where sb.id='"+id+"';";
  Connection conn = ConnectionContext.getConnection();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  out.println(id+"님의 예매 내역입니다.<br><br>");
  %>
</div>
<div id="plaintext">
  <%
  while (rs.next()){
	  String movie_id = rs.getString("movidCD");
	  String movie_title = rs.getString("movienm");
	  String opendt = rs.getString("time");
	  String rating = rs.getString("rating");

	  String seat = rs.getString("seat");
	  int price = rs.getInt("price");
	  
	  out.println("영화 제목 : "+movie_title+"<br>");
	  out.println("상영 일시 : 20"+opendt.substring(0,2)+"년 "+opendt.substring(4,6)+"월 "+opendt.substring(6)+"일"+"<br>");
	  out.println("이용 좌석 : "+seat+"<br>");
	  out.println("결제 금액 : "+price+"원<br><br>");
	  
	    out.println("<form action='../mypage/add_rating.jsp' method='post'>");
	    if (rating==null){
		    out.println("별점: <select name='rating' id='style-select'>");
		    for (int i = 1; i <= 5; i++) {
		      out.println("<option value='" + i + "'>" + i + "</option>");
		    }
		    out.println("</select>");
		    out.println("<input type='hidden' name='movie_id' value='" + movie_id + "'>");
		    //out.println("<input type='hidden' name='user_id' value='id'>");
		    out.println("<input type='submit' id='style-bttn' value='별점 주기'>");
		    out.println("</form><br><br>");
	    }else{
		    out.println("별점: "+"⭐".repeat(Integer.parseInt(rating))+"<br><br>");
	    }
  }
  rs.close();
  stmt.close();
  %>
</div>
</body>
</html>
