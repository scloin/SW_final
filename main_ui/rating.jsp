<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>

<meta charset="UTF-8">
<%
//어쩌구 해서 DB에서 가져왔다 침
String[] movies= {"어벤져스", "돈룩업", "올빼미", "인셉션"}; //임시
String[] locates= {"img/1.webp", "img/2.webp", "img/3.JPG", "img/4.jpg"}; //임시


%>
<form action="movie/movie.jsp" method="post">
<%request.setAttribute("movienames",movies); %>
<table style="border-radius: 10px; width:1200; height:400px; text-align:center; margin-left:auto; margin-right:auto; background-color:#242424">
    <tr>
    <% for (int i=0; i<4; i++){ %>
    <td>
    <input type="hidden" name="moviename" value="<%= movies[i]%>">
    <input type="submit" name="movie" style="background-size : cover; background-image: url(<%= locates[i]%>); width: 240px;height: 320px; font-size: 0;line-height: 0;" value=<%= i %>>
    
    <p id="moviename"><%=movies[i] %></p>
    </td>
    <%}%>
    </tr>
</table>
</form>
