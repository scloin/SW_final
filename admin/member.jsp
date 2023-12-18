<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>modify membership</title>

</head>
<body id="me" margin ="auto">
<%@ include file="/noonoocine/head.jsp" %>
<h2 id="gra">회원 정보</h2>
<form action="delete.jsp" method="get">
    <div style="width: 100%;">
        <table width='800' border='1' style="margin:auto;">
            <tr>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 30px;">아이디</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 30px;">이름</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 30px;">비밀번호</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 30px;">나이</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 10px;">성별</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 60px;">권한<br>
                (0:일반회원, 1:사용자)</th>
                <th style="border: 0px solid white; padding: 8px; text-align: center; background-color: #576F72; color: white; width: 30px;">선택</th>
            </tr>
            
            <%
                String sql = "SELECT * From user order by id;";
                Connection conn = ConnectionContext.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    String userId = rs.getString("id");
            %>
                    <tr>
                        <td><%= userId %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("pw") %></td>
                        <td><%= rs.getString("age") %></td>
                        <td><%= rs.getString("sex") %></td>
                        <td><%= rs.getInt("authority") %></td>
                        <td><input type="radio" name="member" value="<%= userId %>"></td>
                    </tr>
            <%
                }
                rs.close();
                pstmt.close();
            %>
        </table>
        <br>
        <input type="submit" class="submit-btn" value="선택한 회원 삭제">
    </div>
</form>

</body>
</html>
