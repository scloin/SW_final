<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<%
   String msg = "";
   String sql = "SELECT seat FROM booking WHERE id='4-head'and movidCD='20212866'"; // 예시 쿼리 수정
   Connection conn = ConnectionContext.getConnection();
   PreparedStatement pstmt = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
   // 모든 좌석을 msg 문자열에 추가
   while (rs.next()) {
      msg += rs.getString("seat") + " ";
   }
   rs.close();
   pstmt.close();
%>
2020124134 LEEYUKYUNG <br/>
쿼리문: <%=sql%><br/>
쿼리결과: <%=msg%><br/>
linux git test
</body>
</html>
