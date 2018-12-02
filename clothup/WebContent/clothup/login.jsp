<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,clothup.*, java.text.*"%>
<%
	String userid = "";
	String password;
	boolean autologin = false;
	String 에러메시지 = null;
	if (request.getMethod().equals("POST")) {
		userid = request.getParameter("userid");
		password = request.getParameter("password");
		autologin = (request.getParameter("autologin") != null);

		if (userid == null || userid.length() == 0)
			에러메시지 = "사용자 아이디를 입력하세요";
		else if (password == null || password.length() == 0)
			에러메시지 = "비밀번호를 입력하세요";
		else {
			if(UserDAO.login(userid,password))
			{
			session.setAttribute("userid", userid);
			session.setAttribute("autologin", autologin);
			response.sendRedirect("main.jsp");
			return;
			}
			else 
			 에러메시지="아이디 또는 비밀번호를 잘못 입력하셨습니다.";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Jua&amp;subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: 'Jua', sans-serif;
	margin-top: 200px;
	text-align: center;
}

.container {
	margin-top: 0 auto;
	
}

.form-area {
	position: relative;
	width: 100%;
}

.form-wrapper {
	position: relative;
	text-align: center;
	vertical-align: middle;
	margin: 0 auto; <!--
	border: 1px solid #ccc; -->
	width: 500px;
	padding: 15px;
}

.centerArea {
	text-align: center;
	margin: 0 auto;
	width: 350px;
}

</style>
</head>
<body>

	<div class="container">

		<h1>Cloth Up</h1>
		
		<div class="form-area">
			<div class="form-wrapper">
				<form method="post">

					<div class="centerArea">
						<div class="form-group row">
							<label for="inputId" class="col-sm-3 col-form-label">아이디</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputId"
									name="userid" />
							</div>
						</div>

						<div class="form-group row">
							<label for="inputPassword" class="col-sm-3 col-form-label">비밀번호</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="inputPassword"
									name="password" />
							</div>
						</div>

					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="autologin"
							<%=autologin ? "checked" : ""%> /> 자동 로그인
						</label>
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="glyphicon glyphicon-ok"></i> 로그인
					</button>
					<a href="register.jsp" class="btn btn-default"> <i
						class="glyphicon glyphicon-user"></i> 회원가입
					</a> <a href="main.jsp" class="btn btn-default"> 돌아가기 </a>
				</form>
			</div>
		</div>

		


		<%
			if (에러메시지 != null) {
		%>
		<div class="alert alert-danger">
			로그인 실패:
			<%=에러메시지%>
		</div>
		<%
			}
		%>


	</div>
</body>
</html>
