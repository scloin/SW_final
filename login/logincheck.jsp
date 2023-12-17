<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String bookingpage="../reservation/select_num.jsp";
if (session.getAttribute("id")!=null){
%>

<jsp:forward page="<%= bookingpage %>"/>
<%	
}
else{
%>
<jsp:forward page="login.jsp" >
<jsp:param name="warning" value="true"/>
</jsp:forward>
<%	
}

%>
</body>
</html>