<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head><title>영화 예매 결제</title></head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<div id="plaintext" style="width:1000px; margin-left:auto; margin-right:auto; text-align:left;">
  <%
  String movie_title=String.valueOf(request.getParameter("movie_title"));
  String[] selectedSeats = request.getParameterValues("seat");
  int adult_cnt = Integer.parseInt(request.getParameter("adult_cnt"));
  int child_cnt = Integer.parseInt(request.getParameter("child_cnt"));

  // 가격 계산 (예: 성인 8000원, 청소년 5000원)
  int totalCost = adult_cnt * 8000 + child_cnt * 5000;

  String selectedSeatsStr = String.join(", ", selectedSeats);
  %>
  <h3>결제 확인</h3>
  선택한 좌석: <%=selectedSeatsStr%><br>
  성인 <%=adult_cnt%>명, 청소년 <%=child_cnt%>명<br>
  총 금액: <%=totalCost%>원<br><br>

  <form action="add_reservation.jsp" method="get">
  
    <input type="hidden" name="movie_title" value="<%=movie_title%>">
    <input type="hidden" name="selectedSeatsStr" value="<%=selectedSeatsStr%>">
    <input type="hidden" name="adult_cnt" value="<%=adult_cnt%>">
    <input type="hidden" name="child_cnt" value="<%=child_cnt%>">
    <input type="hidden" name="totalCost" value="<%=totalCost%>">
    <button type="submit" id="style-bttn">결제하기</button>
  </form>
  </div>
</body>
</html>