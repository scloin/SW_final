<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB(review)에 rating 추가</title></head>
<body>

  <%
  try{
	  String movie_id=String.valueOf(request.getParameter("movie_id"));
	  String user_id=String.valueOf(session.getAttribute("id"));
	  int rating = Integer.parseInt(request.getParameter("rating"));
	  
	  String insert = "insert into review (movidCD, id, rating) ";
	
	  String sql=insert+"values ('"+movie_id+"', '"+user_id+"', "+rating+");";
	  out.println(sql);
	  
	  Connection conn = ConnectionContext.getConnection();
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  int update = pstmt.executeUpdate(sql);
	  
	  pstmt.close();
	  
	  response.sendRedirect("../mypage/check_my_reservations.jsp"); 
  }
  catch(Exception e)
  {
	  %>
	  <script>
	  alert("이미 별점을 매긴 영화입니다.");
	  history.go(-1);
	  </script>
	  <%
  }
  
%>
</body>
</html>
