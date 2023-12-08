<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="swsw.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%

String sql = "select movieNm, avg(rating) as stars, poster from review As R, movie As M where R.movidCD=M.movidCD group by M.movidCD, M.movieNm order by avg(rating) DESC;";
String[] movies={"","","","",""};
String[] locates={"","","","",""};
String[] stars={"","","","",""};
Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
int i=0;
while (rs.next()){
	movies[i]=rs.getString("movieNm");
	locates[i]=rs.getString("poster");
	stars[i]=rs.getString("stars");
	i++;
}


for (i=0; i<5; i++){
	out.print(movies);
	out.print(locates);
	out.print(stars);
}

//String[] movies= {"어벤져스", "돈 룩 업", "올빼미", "인셉션"}; //임시
//String[] locates= {"image/poster3.png", "image/poster2.png", "image/poster1.png", "image/poster4.png"}; //임시

rs.close();
pstmt.close();

%>

<form action="movie/movie.jsp" method="get">
<%request.setAttribute("movienames",movies); %>
<table style="border-radius: 10px; width:1200; height:400px; text-align:center; margin-left:auto; margin-right:auto; background-color:#242424">
    <tr>
    <% for (i=0; i<4; i++){ %>
    <td>
    <input type="hidden" name="<%= i%>" value="<%= movies[i]%>">
    <input type="submit" name="movie" style="background-size : cover; background-image: url(<%= locates[i]%>); width: 240px;height: 320px; font-size: 0;line-height: 0;" value="<%= i %>">
    
    <p id="moviename"><%=movies[i] %></p>
    <p id="moviename"><%=Math.round(Float.parseFloat(stars[i]) *10)/10.0 %>/5.0</p>
    </td>
    <%}%>
    </tr>
</table>
</form>
