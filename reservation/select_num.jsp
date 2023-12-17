<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>영화 예매</title>
  <script>
    function validateForm() {
      var adultCount = document.querySelector('select[name="adult_cnt"]').value;
      var childCount = document.querySelector('select[name="child_cnt"]').value;

      if (adultCount == "0" && childCount == "0") {
        alert("적어도 한 명 이상의 인원을 선택해야 합니다.");
        return false; // 폼 제출을 중단
      }
      return true; // 폼 제출 계속
    }
  </script>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<div style="width:1000px; margin-left:auto; margin-right:auto; text-align:left;">
  <h2>영화 예매</h2>
<div id="plaintext">
  <%String movie_title= String.valueOf(request.getParameter("movie"));%>

  선택한 영화는 [<%=movie_title%>] 입니다.<br><br>
  
  인원을 선택하세요.<br>
  <form action="<%=request.getContextPath()+"/noonoocine/reservation/seats.jsp"%>" onsubmit="return validateForm()">
    성인 : 
    <select name="adult_cnt">
      <option value="0">0</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
    <br>
    청소년 : 
    <select name="child_cnt">
      <option value="0">0</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
    <br><br>
    <input type="hidden" name="movie_title" value="<%=movie_title%>">
    <input type="submit" value="좌석 현황 확인">
  </form>
 </div></div>
</body>
</html>
