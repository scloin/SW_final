<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>영화 예매</title>
<style>
  #thea {
    border-collapse: collapse;
    font-size: 20px; 
    font-family: Noto Sans KR Light;
    color: #ffffff;
  }
  #thtd {
	width: 50px; 
	height: 50px;
    
    text-align: center;    
  }
  #style-bttn{
  	all: unset;
  	background-color:#3366FF;
  	width:200px; height:50px;
  	border-radius: 10px;"
  }
</style>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<h2>영화 예매</h2>
<div id="plaintext" style="width:1000px; margin-left:auto; margin-right:auto; text-align:left;">

  <%
  String movie_title=String.valueOf(request.getParameter("movie_title"));
  int adult_cnt=Integer.parseInt(String.valueOf(request.getParameter("adult_cnt")));
  int child_cnt=Integer.parseInt(String.valueOf(request.getParameter("child_cnt")));
  %>
  선택한 영화는 [<%=movie_title%>] 입니다.<br>
  선택한 인원 : 성인 <%=adult_cnt%>명, 청소년 <%=child_cnt%>명<br><br>
  

  <h3>좌석 선택</h3>
  <form action="pay.jsp" onsubmit="return validateSeats()">
  <table id="thea">
    <tr><td>
      <table id="thea">
        <% 
        String rows = "ABCDEFG";
        int cols = 10;
        %>

        <tr >
          <td id="thtd"></td> <% // 첫번째 칸 비우기, 열 레이블
          for (int col = 1; col <= cols; col++) { %>
            <td id="thtd"><%=col%></td>
          <% } %>
        </tr>
        
        <% 
        // db
   		ArrayList<String> bookedSeats = new ArrayList<String>();
        String sql = "SELECT seat FROM booking as b, movie as m where b.movidCD=m.movidCD and movienm='"+ movie_title +"';";
        Connection conn = ConnectionContext.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
          // 모든 좌석을 msg 문자열에 추가
        while (rs.next()) {
           bookedSeats.add(rs.getString("seat"));
        }
        rs.close();
        pstmt.close();
     
        for (int i = 0; i < rows.length(); i++) {
            %><tr>
            <td  id="thtd"><%=rows.charAt(i)%></td> <% // 행 레이블
            for (int j = 1; j <= cols; j++) {
                String seatId = "" + rows.charAt(i) + j;
                boolean booked=false;
                for (String bookedSeat : bookedSeats){
                	if (bookedSeat.indexOf(seatId)>-1){
                		booked=true;
                		break;
                	}
                }
                
                 if (!booked) {
                    %><td id="thtd" style="paddig:0px"><input type="checkbox" name="seat" value="<%=seatId%>" style="width:40px; height:40px;" onclick="onCheckboxClick(this)"></td><%
                }
                else {
                    %><td id="thtd" style="font-size:30px;"><div style="margin-left:auto; margin-right:auto; width:40px;height:40px;background-color:#576F72">✕</div></td><%
                }
            }%>
            </tr>
        <%}%>
      </table>



  <input type="hidden" name="movie_title" value="<%=movie_title%>">
  <input type="hidden" name="adult_cnt" value="<%=adult_cnt%>">
  <input type="hidden" name="child_cnt" value="<%=child_cnt%>">
  
  
</td>
<td id="thtd" style="width:400px; border:0px;">
<button id="style-bttn">예매하기</button>
</td></tr>
</table>
</form>
</div>

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