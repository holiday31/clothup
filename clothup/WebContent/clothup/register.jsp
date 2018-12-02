<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="clothup.*"%>
<%
    int idChecked=0;
	String userid = "";
	String name = "";
	String password1;
	String password2;
	String email = "";
	int department = 0;
	String 에러메시지 = null;
	request.setCharacterEncoding("UTF-8");
	if (request.getMethod().equals("POST")) {
		userid = request.getParameter("userid");
		name = request.getParameter("name");
		password1 = request.getParameter("password1");
		password2 = request.getParameter("password2");
		email = request.getParameter("email");
		idChecked = UserDAO.idCheck(userid)?0:1;
		
		if (userid == null || userid.length() == 0)
			에러메시지 = "사용자 아이디를 입력하세요";
		else if (name == null || name.length() == 0)
			에러메시지 = "이름을 입력하세요";
		else if (password1 == null || password1.length() == 0)
			에러메시지 = "비밀번호를 입력하세요";
		else if (password2 == null || password2.length() == 0)
			에러메시지 = "비밀번호 확인을 입력하세요";
		else if (password1.equals(password2) == false)
			에러메시지 = "비밀번호 불일치";
		else if (email == null || email.length() == 0)
			에러메시지 = "이메일 주소를 입력하세요";
		else if(idChecked==0)
			에러메시지 = "아이디 중복확인을 하세요.";
		else {
			User user = new User(userid, name, password1, email);
			UserDAO.create(user);
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://fonts.googleapis.com/css?family=Jua&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="//unpkg.com/bootstrap/dist/css/bootstrap.min.css">
<script src="//unpkg.com/jquery/dist/jquery.min.js"></script>
<script src="//unpkg.com/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
$('#idConfirm').click(function(){
	var userid=document.getElementById("userId").value;
	if(userid.trim().length==0)
		alert("아이디를 입력하세요.");
	else {
	$.ajax({
		type:"post",
		url:"confirm.jsp",
	    data:{
	    	id:userid
	    },
	    success:whenSuccess,
	    error:whenError
			
	});
	}
	function whenSuccess(resdata){
		if($.trim(resdata)=="true"){
			<%idChecked=0;%>
			alert("이미 사용중인 아이디입니다.");
		}
		else{
			<%idChecked=1;%>
			alert("사용 가능한 아이디입니다.");
		}
	}
	function whenError(){
		alert("Error");
	}
	
});
});

</script>
<style>
body {
	font-family: 'Jua', sans-serif;
	margin: 0;
	padding:0;
	text-align: center;
	<!--background: linear-gradient(45deg, #e37682 15%, #5f4d93 85%);-->
	background-repeat: no-repeat;
	
}

input.form-control, select.form-control {
	width: 200px;
}

input.form-inline, select.form-control {
	width: 200px;
}

input[type="email"] {
	width: 280px;
}

#idConfirm {
	margin-left: 10px;
	height: 35px;
}

.form-wrapper {
	position: relative;
	text-align: center;
	margin: 0 auto; <!--
	border: 1px solid #ccc; -->
	border-radius: 50px;
	width: 700px;
	padding: 15px;
	background-color:white;
	max-width: calc(100% - 4em);
}

.container {
	margin: 0 auto;
}

.centerArea {
	text-align: left;
	margin: 0 auto;
	width: 300px;
}
</style>
</head>
<body>

	<div class="container">

		<h1 style="margin-top:60px;">Join Us</h1>
		
		<div class="form-wrapper">
			<form method="post">

				<div class="centerArea">
					<div class="form-group">
						<label>아이디</label>
						<div class="form-inline">
							<input type="text" class="form-control" name="userid" id=userId
								value="<%=userid%>" /> <input id="idConfirm" class="btn btn-primary" type="button"
								value="중복확인 " />
						</div>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control"
							name="password1" />
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control"
							name="password2" />
					</div>
					<div class="form-group">
						<label>이름</label> <input type="text" class="form-control"
							name="name" value="<%=name%>" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">이메일</label> <input type="email"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							name="email" value="<%=email%>" /> <small id="emailHelp"
							class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>
				</div>



				<button type="submit" class="btn btn-primary">회원가입</button>
				<a href="main.jsp" class="btn btn-default"> 돌아가기 </a>
		</div>
		</form>

		

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
