<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;600;900&display=swap');
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
        width: 240px;
        height: 320px;
        border-radius: 10px;
    }

    #moviename {
        font-size: 20px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;
    }
    #plaintext {
        font-size: 20px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;
    }
    
    #movieinfo {
        font-size: 30px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;
    }


    a {text-decoration:none; color: inherit;}
    
    @keyframes glow {
        0% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
        50% { text-shadow: 0 0 20px #ffd300, 0 0 30px #ffd300, 0 0 40px #ffd300; }
        100% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
    }
    span {
        animation: glow 3s infinite;
    }


    body {
        background-color: #000000;
    }
</style>
</head>
<body>
<br>
<table style="width:1000; align:center; margin-left:auto; margin-right:auto;">
    <tr>
    <td style="width:700;" id="Logo"><a href=<%=request.getContextPath()+"/noonoocine/main.jsp"%>>열<span style="color: #FFD300">무비</span>빔밥</a></td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="/swsw/noonoocine/movie/movielist.jsp">
        영화목록 </a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="/swsw/noonoocine/login/logout.jsp">
        로그아웃</a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="/swsw/noonoocine/login/register.jsp">
        회원가입</a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href="/swsw/noonoocine/db/membersinfo.jsp">
        My Info</a>
    </td>
    </tr>
</table>
<br><br><br>
</body>
</html>