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
			<h3 class="fw-light my-4">로그인</h3>
		</div>
		<div class="card-body">
			<form method="post" action="./login.do">
				<!-- 아이디-->
				<div class="mb-3">
					<input class="form-control" id="id" name="id" placeholder="사원번호 입력">
				</div>

				<!-- 비밀번호-->
				<div class="mb-3">
					<input class="form-control" id="password" name="password" type="password" placeholder="비밀번호 입력">
				</div>

				<!-- 비밀번호 저장-->
				<div class="mb-3">
					<div class="form-check">
						<input class="form-check-input" id="remember-me" type="checkbox">
						<label class="form-check-label" for="remember-me">자동 로그인</label>
					</div>
				</div>

				<!-- 로그인 박스-->
				<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
					<a class="small" href="#">비밀번호 찾기</a>
					<button class="btn btn-primary" type="submit">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>