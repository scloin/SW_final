<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%

String sql = "select movienm,poster,opendt from movie where prdtstatNm='개봉예정' order by opendt;";
String[] movies={" "," "," "," "};
String[] locates={" "," "," "," "};
String[] opendt={" "," "," "," "};
Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
int i=0;
java.util.Date date = new java.util.Date();
while ((rs.next())&&(i<4)){
	movies[i]=rs.getString("movieNm");
	locates[i]=rs.getString("poster");
	opendt[i]=rs.getString("opendt");
    date = formatter.parse(rs.getString("opendt"));
    opendt[i]=(1900+date.getYear())+"년 "+date.getMonth()+"월 "+date.getDate()+"일";
	i++;
}

rs.close();
pstmt.close();

%>
<p id="movieinfo" style="width:1200; text-align:left; margin-left:auto; margin-right:auto; background-color:#000000">상영예정작</p>
<form action="movie/movieinfo.jsp" method="get">
<table style=" border-radius: 10px; width:1200; height:425px; text-align:center; margin-left:auto; margin-right:auto; background-color:#242424">
    <tr>
    <% for (i=0; i<4; i++){ %>
    <td>
    <input type="submit" name="movie" style="all: unset; background-size : cover; background-image: url(<%= locates[i]%>); width: 240px;height: 320px; font-size: 0;line-height: 0;" value="<%= movies[i] %>">
    </td><%}%>
    <tr>
    <% for (i=0; i<4; i++){ %>
    <td>
    <p id="moviename"><%=movies[i] %></br>
    📅<%=opendt[i]%></p>
    </td><%}%>
    </tr>
</table>
</form>