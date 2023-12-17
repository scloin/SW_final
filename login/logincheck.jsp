<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String bookingpage="../reservation/select_num.jsp";
String mypage="../mypage/check_my_reservations.jsp";
if (session.getAttribute("id")!=null){
	if (request.getParameter("booking")!=null){
	%>
	<jsp:forward page="<%= bookingpage %>"/>
	<%	
	}
	else if (request.getParameter("userinfo")!=null){
	%>
	<jsp:forward page="<%= mypage %>"/>
	<%	
	}
	
}
else{
%>
<jsp:forward page="../login/login.jsp" >
<jsp:param name="warning" value="true"/>
</jsp:forward>
<%	
}

%>
</body>
</html>