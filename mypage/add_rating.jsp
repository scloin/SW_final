<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB(review)에 rating 추가</title></head>
<body>
  <%
  String movie_id=String.valueOf(request.getParameter("movie_id"));
  String user_id=String.valueOf(request.getParameter("user_id"));
  int rating = Integer.parseInt(request.getParameter("rating"));
  
  String insert = "insert into review (movidCD, id, rating) ";

  String sql=insert+"values ('"+movie_id+"', '"+user_id+"', "+rating+");";
  out.println(sql);
  
  Connection conn = ConnectionContext.getConnection();
  PreparedStatement pstmt = conn.prepareStatement(sql);
  //int update = pstmt.executeUpdate(sql);
  
  pstmt.close();
  
  response.sendRedirect("../mypage/check_my_reservations.jsp"); 
%>
</body>
</html>
