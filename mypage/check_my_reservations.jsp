<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB에 예약 정보 추가</title></head>
<body>
  <%
  String id = (String)session.getAttribute("user_id");
  String sql="select * from booking where user_id ="+id;
  Connection conn = ConnectionContext.getConnection();
  PreparedStatement pstmt = conn.prepareStatement(sql);
  ResultSet rs = pstmt.executeQuery();
  out.println("id");
  %>
  <%=id%>님의 예매 내역입니다.<br>
  <%
  while (rs.next()){
	  String movie_id = rs.getString("movidCD");
	  String seat = rs.getString("seat");
	  int price = rs.getInt("price");
	  out.println(movie_id+" : "+seat+", 결제금액 "+price+"원<br>");
  }
  rs.close();
  pstmt.close();
  %>
</body>
</html>
