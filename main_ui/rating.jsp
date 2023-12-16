<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%

String sql = "(SELECT movienm, avg(rating) as stars, poster " +
        "FROM review as R, movie as M " +
        "WHERE R.movidcd=M.movidcd AND prdtstatnm='상영 중' " +
        "GROUP BY M.movidcd, M.movienm " +
        "ORDER BY avg(rating) DESC)" +
        "UNION " +
        "(SELECT movienm, 0 as star, poster " +
        "FROM movie as M " +
        "WHERE prdtstatnm='상영 중' AND M.movidcd NOT IN (SELECT movidcd FROM review)) " +
        "ORDER BY stars DESC";
String[] movies={"","","","",""};
String[] locates={"","","","",""};
String[] stars={"","","","",""};
Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
int i=0;
while ((rs.next())&&(i<5)){
	movies[i]=rs.getString("movieNm");
	locates[i]=rs.getString("poster");
	stars[i]=rs.getString("stars");
	i++;
}

rs.close();
pstmt.close();

%>
<p id="movieinfo" style="width:1200; text-align:left; margin-left:auto; margin-right:auto; background-color:#000000">영화 차트</p>
<form action="movie/movie.jsp" method="get">
<table style="border-radius: 10px; width:1200; height:425px; text-align:center; margin-left:auto; margin-right:auto; background-color:#242424">
    <tr>
    <% for (i=0; i<4; i++){ %>
    <td>
    <input type="submit" name="movie" style="all: unset; background-size : cover; background-image: url(<%= locates[i]%>); width: 240px;height: 320px; font-size: 0;line-height: 0;" value="<%= movies[i] %>">
    </td><%}%>
    <tr>
    <% for (i=0; i<4; i++){ %>
    <td>
    <p id="moviename"><%=movies[i] %></br>
    <%=Math.round(Float.parseFloat(stars[i]) *10)/10.0 %>/5.0</p>
    </td><%}%>
    </tr>
</table>
</form>
