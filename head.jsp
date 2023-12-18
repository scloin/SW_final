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
    #gray {
    background-color: #242424;
    border-radius: 10px;
	}
	#me {
  		font-size: 20px; 
        font-family: Noto Sans KR Light;
        color: #ffffff;
	}
	#gra {
  		font-size: 30px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;
	}
	#style-bttn{
  	all: unset;
  	background-color:#3366FF;
  	width:200px; height:50px;
  	border-radius: 10px;"
    }
	input[type="text"],
	input[type="password"] {
    all: unset;
    background-color: #242424;
    color: white;    
	}
    h2 {
    font-size: 30px;
    text-align: center;
    color: white;
	}
   .submit-btn {
            background-color: #678983;
            color: white;
            padding: 15px;
            font-size: 24px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            width: 30%;
            font-size: 30px; 
            font-family: Noto Sans KR Medium;
            display: block;
            margin : auto;
        }
    #movieinfo {
        font-size: 30px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;
    }
    #Teal {
        font-size: 30px; 
        font-family: Noto Sans KR Medium;
        color: #ffffff;    
        height:60px; 
        margin-left:auto; 
        margin-right:auto;
        line-height : 60px;
        border-radius:30px;
        background-color:#576F72;
        width:200px; 
        color: #E4DCCF;
    }
	#tb {
    width: "1200px";
    border: 5px solid black;
    border-collapse: collapse;
    border-spacing: 50px;
    margin : auto;	
    color: #ffffff;
    font-family: Noto Sans KR Medium;
    font-size: 22px; 
    }
	
	#movielist{
	    font-size: 20px; 
        font-family: Noto Sans KR Light;
        color: #ffffff;
		border-spacing: 10px; 
		width:700px; 
		align:center; 
		margin-left:auto; 
		margin-right:auto;
	
	}
    a {text-decoration:none; color: inherit;}
    
    @keyframes glow {
        0% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
        50% { text-shadow: 0 0 20px #7D9D9C, 0 0 30px #7D9D9C, 0 0 40px #7D9D9C; }
        100% { text-shadow: 0 0 10px #000000, 0 0 20px #000000, 0 0 30px #000000; }
    }
    span {
        animation: glow 3s infinite;
    }


    body {
        background-color: #000000;
    }
        .login-container {
        width: 300px;
        margin: 100px auto;
        padding: 20px;
        background-color: rgba(0, 0, 0, 0.7);
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
    }

    .login-container h2 {
        text-align: center;
    }

    .login-form {
        margin-top: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    .form-group button {
        width: 300px;
        padding: 15px;
        background-color: #678983;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 30px;
        font-family: Noto Sans KR Medium;
        display: block;
        margin : auto;
    }

</style>
</head>
<body>
<table style="width:1000; align:center; margin-left:auto; margin-right:auto;">
    <tr>
    <td style="width:700;" id="Logo"><a href=<%=request.getContextPath()+"/noonoocine/main.jsp"%>>열<span id="glowingtitle" style="color: #678983">무비</span>빔밥</a></td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/movie/movielist.jsp"%>>
        영화목록 </a>
    </td>
    <% if (session.getAttribute("id") != null) { %>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/login/logout.jsp"%>>로그아웃</a>
    </td>
    <% } else { %>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/login/login.jsp"%>>로그인</a>
    </td>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/login/register.jsp"%>>
        회원가입</a>
    </td>
    <% } %>
    <% if (session.getAttribute("auth") != null) { %>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/admin/admin.jsp"%>>
        영화 추가</a>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/admin/member.jsp"%>>
    	회원 수정</a>
    <% } else { %>
    <td style="width:100; text-align:right; vertical-align:bottom" id="menu"><a href=<%=request.getContextPath()+"/noonoocine/login/logincheck.jsp?userinfo=tr"%>>
        My Info</a>
    </td>
    <% } %>
    </tr>
</table>
<p style="fontsize:10px">
<br><br>
</p>
</body>
</html>
