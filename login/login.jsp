<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
<%if(request.getParameter("warning")!=null && request.getParameter("warning").equals("true")){
	%>
	<script>
	alert("로그인이 필요한 작업입니다.\n로그인 후 이용하시기 바랍니다.");
	</script>
	<%
	}
String cookid = null;
boolean ck =  false;
Cookie[] cookies = request.getCookies();  
if (cookies != null && cookies.length > 0) {
    for (int i = 0 ; i < cookies.length ; i++) {
       if (cookies[i].getName().equals("id")) {
    	   cookid = cookies[i].getValue();
    	   ck = true;
       }
    }
}
%>
<div class="login-container">
    <h2  id="menu">아이디 비밀번호를 입력하신 후 <br>
     로그인 버튼을 클릭해 주세요.</h2>
    <form class="login-form" action="../login/loginprocess.jsp" method="get">
        <div class="form-group">
        <%if(ck) { %>
            <label for="username"  id="me" >Id</label>
            <input type="text" id="id" name="id" value="<%= cookid %>" maxlength="10" size="40" required>
        <% } else {%>
        <label for="username"  id="me" >Id</label>
            <input type="text" id="id" name="id" maxlength="10" size="40"  placeholder="ex) hong" required>
        <% } %>
        </div>    
        <div >
        	<label id="me">아이디 기억하기</label>
        	<input type="checkbox" name="idstore" value="store"></input><br/>
        </div>
        <div class="form-group">
            <label for="password"  id="me">Password</label>
            <input type="password" id="pw" name="pw" maxlength="15" size="40" placeholder="ex) 0000"required>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>
</div>
</body>
</html>
