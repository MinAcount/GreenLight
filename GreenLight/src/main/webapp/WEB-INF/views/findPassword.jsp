<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GreenLight</title>
<!-- 주석처리encodingTest -->
</head>
<link href="css/styles.css" rel="stylesheet" />
<body>
	<div class="card shadow-lg border-0 rounded-lg mt-5" id="loginForm">
		<div class="card-header justify-content-center">
			<h3 class="fw-light my-4">비밀번호 찾기</h3>
		</div>
		<div class="card-body">
			<form method="post" action="./getPassword.do">
				<!-- 아이디-->
				<div class="mb-3">
					<input class="form-control" id="id" name="id" placeholder="사원번호 입력">
				</div>

				<!-- 비밀번호-->
				<div class="mb-3">
					<input class="form-control" id="email" name="email" type="email" placeholder="이메일 입력">
				</div>

				<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
					<a class="small" href="./">로그인 페이지</a>
					<button class="btn btn-primary" type="submit">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>