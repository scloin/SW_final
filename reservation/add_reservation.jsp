<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>DB에 예약 정보 추가</title></head>
<body>
  <%
  String movie_title=String.valueOf(request.getParameter("movie_title"));
  String selectedSeatsStr = request.getParameter("selectedSeatsStr");
  int adult_cnt = Integer.parseInt(request.getParameter("adult_cnt"));
  int child_cnt = Integer.parseInt(request.getParameter("child_cnt"));
  int totalCost = Integer.parseInt(request.getParameter("totalCost"));
  String id = "12345"; //(String)session.getAttribute("user_id");
  
  String insert = "insert into booking (movidCD, id, time, seat, adult, teenager, price) ";
  String movie_id = "(select movidCD from movie where movienm='"+movie_title+"'), ";
  String user_id = "'"+id+"', ";
  String opendt = "(select opendt from movie where movienm='"+movie_title+"'), ";
  String seat = "'"+selectedSeatsStr+"', ";
  String cnt_and_price = adult_cnt+", "+child_cnt+", "+totalCost;
  String sql=insert+"values ("+movie_id+user_id+opendt+seat+cnt_and_price+");";
  out.println(sql);
  
  Connection conn = ConnectionContext.getConnection();
  PreparedStatement pstmt = conn.prepareStatement(sql);
  //int update = pstmt.executeUpdate(sql);
  
  pstmt.close();
  
  response.sendRedirect("../mypage/check_my_reservations.jsp"); 
%>
</body>
</html>
