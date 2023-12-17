<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>
login page

<div class="login-container">
    <h2  id="menu">아이디 비밀번호를 입력하신 후 <br>
     로그인 버튼을 클릭해 주세요.</h2>
    <form class="login-form" action="loginprocess.jsp" method="post">
        <div class="form-group">
            <label for="username"  id="me" >Id</label>
            <input type="text" id="id" name="id" maxlength="10" size="40" placeholder="ex) hong123" required>
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
