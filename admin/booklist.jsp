<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="swsw.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>예매 현황</title>
</head>
<body id="tb" margin ="auto">
<%@ include file="/noonoocine/head.jsp" %>
<h2 id="gra">예매 현황</h2>
    <div style="width: 100%;">
        <table width='900' height='500' border='1' style="margin:auto;">
            <tr>
            	<th style="border: 0px solid white; padding: 8px; font-size: 25px; text-align: center; background-color: #576F72; color: white; width: 30px;">순위</th>
                <th style="border: 0px solid white; padding: 8px; font-size: 25px; text-align: center; background-color: #576F72; color: white; width: 70px;">영화 이름</th>
                <th style="border: 0px solid white; padding: 8px; font-size: 25px; text-align: center; background-color: #576F72; color: white; width: 30px;">예매 수</th>
            </tr>

<%
                String sql = "select t2.movieNm, count(*) as count from booking as t1 join movie t2 on t1.movidCD = t2.movidCD group by t1.movidCD, t2.movidCD ORDER BY count DESC;";
                Connection conn = ConnectionContext.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                int rank = 1;
                while (rs.next()) {
            %>
                    <tr>
                     	<td style="font-size: 25px; text-align: center;"><%= rank++ %></td>
                        <td style="font-size: 25px; text-align: center;"><%= rs.getString("t2.movieNm") %></td>
                        <td style="font-size: 25px; text-align: center;"><%= rs.getString("count") %></td>
                    </tr>
            <%
                }
                rs.close();
                pstmt.close();
            %>
        </table>
        <br>
    </div>
</form>

</body>
</html>
