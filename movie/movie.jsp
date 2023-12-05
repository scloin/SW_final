<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="swsw.testsss" %>
<head>
<meta charset="UTF-8">

</head>
<br>
<body>
<%
String movienum=request.getParameter("name");
String movienames=request.getParameter("moviename");

%>


<% testsss A=new testsss();
String B=A.ttest();
out.print(B);

%>
</body>
</html>