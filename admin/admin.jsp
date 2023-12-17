<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="me" margin ="auto">
<%@ include file="/noonoocine/head.jsp" %>
<br>
<h2 id="gra">영화 추가</h2>
<form action="insert_mv.jsp" method="get">
        <table id="plaintext" style="margin : auto; height:400px; width: 500px">
            <tr>
                <td><label for="movieCD">영화 코드:</label></td>
                <td><input type="text" id="movieCd" name="movieCd" required></td>
            </tr>        
            <tr>
                <td><label for="movieNm">영화 이름:</label></td>
                <td><input type="text" id="movieNm" name="movieNm" required></td>
            </tr>
            <tr>
                <td><label for="opendt">개봉 날짜:</label></td>
                <td><input type="text" id="opendt" name="opendt" placeholder="YYYYMMDD" required></td>
            </tr>
            <tr>
                <td><label for="prdtstatNm">개봉 정보:</label></td>
                <td><input type="text" id="prdtstatNm" name="prdtstatNm" required></td>
            </tr>
            <tr>
                <td><label for="genreAlt">장르:</label></td>
                <td><input type="text" id="genreAlt" name="genreAlt"></td>
            </tr>
            <tr>
                <td><label for="directors">감독:</label></td>
                <td><input type="text" id="directors" name="directors" ></td>
            </tr>
            <tr>
                <td><label for="poster">포스터 경로:</label></td>
                <td><input type="text" id="url" name="url" maxlength="20"></td>
            </tr>
        </table>
        <br>
        <button type="submit" class="submit-btn">열무비빔밥에 영화 추가</button>
    </form>
</body>
</html>
