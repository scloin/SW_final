<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
<script>
function validateForm() { //form.id.valueS
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var name = document.getElementById("name").value;
    var ssn1 = document.getElementById("age").value;
    var gender = document.getElementsByName("gender");
    var sex;

    for (var i = 0; i < gender.length; i++) {
        if (gender[i].checked) {
        	sex = gender[i].value;             	
            break;
            }
        }

    var fieldIds = ["id", "pw", "name", "age"];

    for (var i = 0; i < fieldIds.length; i++) {
        var fieldValue = document.getElementById(fieldIds[i]).value;

        if (fieldValue == "") {
            alert("모든 필수 항목을 입력해주세요.");
            document.getElementById(fieldIds[i]).focus();
            return false;
        }
    }
    document.form.submit();

}
</script>
</head>
<body>
<%@ include file="/noonoocine/head.jsp" %>


<h2>회원가입 환영합니다!</h2>
<form name="form" action="insert.jsp" method="post">
    <table id="plaintext" style="margin : auto; height:600px">

        <tr>
            <td><label for="name">▶ 본인의 이름을 입력해 주세요.</label></td>
        </tr>
        <tr id='gray'>
            <td><input type="text" id="name" name="name" maxlength="10"  size="40" placeholder="ex) 홍길동"></td>
        </tr>
        <tr>
            <td><label for="id">▶ 아이디를 4~10자 이내로 입력해 주세요.</label></td>
        </tr>
        <tr id='gray'>
            <td><input type="text" id="id" name="id" maxlength="10" size="40" placeholder="ex) hong123"></td>
        </tr>
        <tr>
            <td><label for="pw">▶ 비밀번호는 4~15자 이내로 입력해 주세요.</label></td>
        </tr>
        <tr id='gray'>
            <td><input type="password" id="pw" name="pw" maxlength="15" size="40" placeholder="ex) 0000"></td>
        </tr>        
        <tr>
            <td><label for="residence">▶ 나이를 입력해 주세요.</label></td>
        </tr>
        <tr id='gray'>
            <td>
                <input type="text" id="age" name="age" maxlength="3" size="40" placeholder="ex) 20">
            </td>
        </tr>
        <tr>
            <td><label>▶ 성별</label></td>
        </tr>
        <tr id='gray'>
            <td>
                <input type="radio" id="male" name="gender" value="M" checked>
                <label for="male">남자</label>
                <input type="radio" id="female" name="gender" value="F">
                <label for="female">여자</label>
            </td>
        </tr>
    </table>
        <div style="background-color: #000000; border-radius: 10px; text-align: center; padding: 15px;">
            <button type="button" class="submit-btn" onClick="validateForm()">열무비빔밥 회원가입</button>
        </div>
</form>

</body>
</html>
