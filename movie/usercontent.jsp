<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="plaintext">

<%
Connection conn = ConnectionContext.getConnection();
String movienm=request.getParameter("movie");
String sql = "SELECT " +
        "CASE " +
        "WHEN age BETWEEN 10 AND 19 THEN '10' " +
        "WHEN age BETWEEN 20 AND 29 THEN '20' " +
        "WHEN age BETWEEN 30 AND 39 THEN '30' " +
        "WHEN age BETWEEN 40 AND 49 THEN '40' " +
        "WHEN age BETWEEN 50 AND 59 THEN '50' " +
        "WHEN age >= 60 THEN '60' " +
        "ELSE '기타' " +
        "END AS age_group, " +
        "AVG(rating) AS average_rating " +
        "FROM ( " +
        "   SELECT rating, u.age " +
        "   FROM movie AS m, review AS r, user AS u " +
        "   WHERE m.movidcd = r.movidcd " +
        "   AND movienm = '"+movienm+"' " +
        "   AND u.id = r.id " +
        ") AS subquery " +
        "GROUP BY age_group " +
        "ORDER BY age_group";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();

float ages[]={0,0,0,0,0,0};
String cases[]={"10","20","30","40","50","60"};
String tempA;
while(rs.next()){
	tempA=rs.getString("age_group");
	for (int i=0; i<6;i++){
		if(tempA.equals(cases[i])){
		ages[i]=rs.getFloat("average_rating");}
	}
}
rs.close();
pstmt.close();

String sql2 = "SELECT avg(rating) as star "+
			"FROM movie AS m, review AS r, user AS u "+
			"WHERE m.movidcd = r.movidcd "+
			"AND movienm = '"+movienm+"' "+
			"AND u.id = r.id;";

PreparedStatement pstmt2 = conn.prepareStatement(sql2);
ResultSet rs2= pstmt2.executeQuery();
double stars=0.0;
if(rs2.next()){
	stars=Math.round(rs2.getFloat("star")*10)/10.0;
}
rs2.close();
pstmt2.close();
%>
<p id="movieinfo" style="margin-left:auto; margin-right:auto; width:600px">별점<br></p>
<table style="margin-left:auto; margin-right:auto; width:600px; background-color: #242424; border-radius:20px; border-spacing: 10px;">
<tr style="vertical-align:bottom; text-align: center;">
<%for (int i=0; i<6;i++){ %>
<td>
<div style="display: inline-block; background-color: #3ed4be; border-radius:20px; border: hidden;  width: 30px;  height: <%=50*ages[i] %>px; align-items: center;"></div>
</td><% }%>
<td>
<div style="display: inline-block; background-color: #424242; border: hidden;  width: 2px;  height:200px; align-items: center;"></div>
</td>
<td id="plaintext" style="font-size:50px; vertical-align:middle">
⭐<%=stars%>
</td>
</tr><tr style="vertical-align:bottom; text-align:center">
<%for (int i=0; i<6;i++){ %>
<td>
<%=cases[i]+"대"%>
</td>
<%}%>
</tr>
</table>
</body>
</html>