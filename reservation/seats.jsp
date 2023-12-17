<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>영화 예매</title></head>
<body>
  <%
  int adult_cnt=Integer.parseInt(String.valueOf(request.getParameter("adult_cnt")));
  int child_cnt=Integer.parseInt(String.valueOf(request.getParameter("child_cnt")));
  %>
  선택한 인원 : 성인 <%=adult_cnt%>명, 청소년 <%=child_cnt%>명<br><br>
  
<div id="seats">

    <h3>좌석 선택</h3>
    <form action="pay.jsp" onsubmit="return validateSeats()">
      <table>
        <% 
        String rows = "ABCDEFG";
        int cols = 10;
        %>

        <tr>
          <td></td> <% // 첫번째 칸 비우기, 열 레이블
          for (int col = 1; col <= cols; col++) { %>
            <td><%=col%></td>
          <% } %>
        </tr>
        
        <% 
        for (int i = 0; i < rows.length(); i++) {
            %><tr>
            <td><%=rows.charAt(i)%></td> <% // 행 레이블
            for (int j = 1; j <= cols; j++) {
                String seatId = "" + rows.charAt(i) + j;
                 if (!"A2".equals(seatId) && !"C3".equals(seatId)) { // db와 연동 필요
                    %><td><input type="checkbox" name="seat" value="<%=seatId%>" onclick="onCheckboxClick(this)"></td><%
                }
                else {
                    %><td>X</td><%
                }
            }%>
            </tr>
        <%}%>
      </table>
</div>

<style>
  table {
    border-collapse: collapse;
  }
  td {
    border: 1px solid #ddd;
    text-align: center;
    padding: 10px;
  }
</style>
  
  <input type="hidden" name="adult_cnt" value="<%=adult_cnt%>">
  <input type="hidden" name="child_cnt" value="<%=child_cnt%>">
  <button id="book_ticket">예매하기</button>
</form>

<script>

  var maxSeats = <%= adult_cnt + child_cnt %>; // 최대 선택 가능 좌석 수
  var checkedCount = 0; // 현재 선택된 체크박스 수

  // 체크박스 클릭 이벤트 핸들러
  function onCheckboxClick(checkbox) {
    if (checkbox.checked) {
      checkedCount++; // 체크박스 선택 시 카운트 증가
    } else {
      checkedCount--; // 체크박스 해제 시 카운트 감소
    }
    
    console.log("선택된 좌석: " + checkbox.value);
    console.log("총 선택된 좌석 수: " + checkedCount);

    if (checkedCount > maxSeats) {
      alert('선택 가능한 좌석 수를 초과했습니다. 최대 ' + maxSeats + '개의 좌석을 선택할 수 있습니다.');
      checkbox.checked = false;
      checkedCount--; // 체크 해제하고 카운트 감소
    }
  }

  // 폼 제출 시 좌석 수 확인
  function validateSeats() {
    if (checkedCount !== maxSeats) {
      alert('선택한 좌석 수가 인원 수와 일치하지 않습니다. ' + maxSeats + '개의 좌석을 선택해야 합니다.');
      return false; // 폼 제출을 중지
    }
    return true; // 폼 제출을 계속
  }
</script>
</body>
</html>