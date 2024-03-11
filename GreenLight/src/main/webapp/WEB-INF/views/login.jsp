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
			<form>
				<!-- 이메일-->
				<div class="mb-3">
					<label class="small mb-1" for="inputId">아이디</label> <input
						class="form-control" id="inputId" type="text"
						placeholder="Enter email address">
				</div>

				<!-- 비밀번호-->
				<div class="mb-3">
					<label class="small mb-1" for="inputPassword">비밀번호</label> <input
						class="form-control" id="inputPassword" type="password"
						placeholder="Enter password">
				</div>

				<!-- 비밀번호 저장-->
				<div class="mb-3">
					<div class="form-check">
						<input class="form-check-input" id="rememberPasswordCheck"
							type="checkbox" value=""> <label class="form-check-label"
							for="rememberPasswordCheck">비밀번호 저장</label>
					</div>
				</div>

				<!-- 로그인 박스-->
				<div
					class="d-flex align-items-center justify-content-between mt-4 mb-0">
					<a class="small" href="#">비밀번호 찾기</a> <a class="btn btn-primary"
						href="#">로그인</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>