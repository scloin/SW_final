<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>영화 예매 결제</title></head>
<body>
  <%
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

  <form action="../mypage/check_my_reservations.jsp" method="post">
    <input type="hidden" name="selectedSeats" value="<%=selectedSeatsStr%>">
    <input type="hidden" name="totalCost" value="<%=totalCost%>">
    <input type="hidden" name="adult_cnt" value="<%=adult_cnt%>">
    <input type="hidden" name="child_cnt" value="<%=child_cnt%>">
    <button type="submit">결제하기</button>
  </form>
</body>
</html>
