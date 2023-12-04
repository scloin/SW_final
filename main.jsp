<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
<meta charset="UTF-8">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;900&display=swap');
    #Logo {
        font-size: 64px; 
        font-family: Noto Sans KR Black;
        color: #ffffff;
    }

    #menu {
        font-size: 20px; 
        font-family: Noto Sans KR Light;
        color: #ffffff;
    }

    #poster {
        width: 300px;
        height: 400px;
    }
    a {text-decoration:none; color: inherit;}
    
    @keyframes glow {
        0% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
        50% { text-shadow: 0 0 20px #ffd300, 0 0 30px #ffd300, 0 0 40px #ffd300; }
        100% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
    }
    span {
        animation: glow 1.1s infinite;
    }


    body {
        background-color: #000000;
    }
</style>
</head>
<br>
<body>
<table style="width:1000; align:center; margin-left:auto; margin-right:auto;">
    <tr>
    <td style="width:700;" id="Logo"><a href="main.jsp">열<span style="color: #FFD300">무비</span>빔밥</a></td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="login/logout.jsp">
        로그아웃</a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="login/register.jsp">
        회원가입</a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="db/membersinfo.jsp">
        My Info</a>
    </td>
    </tr>
</table>
<br><br><br>
<table style="width:1200; text-align:center; margin-left:auto; margin-right:auto; background-color:#3f3e3e">
    <tr>
    <td style=""><a href="movie/movie.jsp"><img id="poster" src="main_ui/images.jpg"/></a></td>
    </td>
    <td><a href="movie/movie.jsp"><img id="poster" src="main_ui/images.jpg"/></a></td>
    </td>
    <td><a href="movie/movie.jsp"><img id="poster" src="main_ui/images.jpg"/></a></td>
    </td>
    </tr>
</table>

</body>
</html>