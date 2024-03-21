<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GreenLight</title>
</head>
<link href="css/styles.css" rel="stylesheet" />
<body>
	<div class="card shadow-lg border-0 rounded-lg mt-5" id="loginForm">
		<div class="card-header justify-content-center"
			style="text-align: center;">
			<img alt="logo" src="./assets/img/grn.png" width="100px"><br />
			<img alt="logo2" src="./assets/img/logo_grn.png" width="200px">
		</div>
		<div class="card-body">
			<form method="post" action="./login.do" name="loginFrm">
				<!-- 아이디-->
				<div class="mb-3">
					<input class="form-control" id="id" name="id" placeholder="사원번호 입력">
				</div>

				<!-- 비밀번호-->
				<div class="mb-3">
					<input class="form-control" id="password" name="password"
						type="password" placeholder="비밀번호 입력">
				</div>

				<!-- 비밀번호 저장-->
				<div class="mb-3">
					<div class="form-check">
						<input class="form-check-input" id="remember" type="checkbox"
							name="remember-me"> <label class="form-check-label"
							for="remember">자동 로그인</label>
					</div>
				</div>

				<!-- 로그인 박스-->
				<div
					class="d-flex align-items-center justify-content-between mt-4 mb-0">
					<a class="small" href="./findPassword.do">비밀번호 찾기</a>
					<button class="btn btn-primary" type="button"
						onclick="loginSubmit()">로그인</button>
				</div>
			</form>
		</div>
	</div>
	<div class="toast show" role="alert" aria-live="assertive"
		aria-atomic="true" style="opacity: 1; /* position: absolute; left: 50%; top:50%; margin-left:-250px; margin-top:-50px; */">
		<div class="toast-header text-danger">
			<i data-feather="alert-circle" id="toastFeather"></i> <strong
				class="me-auto">로그인 실패</strong>
			<button class="ml-2 mb-1 btn-close" type="button"
				data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body">
			아이디 혹은 비밀번호를 다시 확인해주세요.<br/>
			5회이상 틀릴 경우 해당 아이디의 로그인이 제한됩니다.
			(<span id="fail">${failCount.fail+1}</span>/5)
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript">
		function loginSubmit() {
			var id = document.getElementById("id").value;
			var password = document.getElementById("password").value;
			var failCount = parseInt(document.getElementById("fail").innerHTML);
			console.log("id:",id);
			console.log("pwd:",password);
			console.log("failCount:",failCount);
			console.log("failCount:",typeof failCount);
			
			if(id == "" || password == ""){
				alert("아이디와 비밀번호를 입력해주세요.");
				return;
			}
			fetch('./loginCheck.do', {
				method:'POST',
				headers:{"Content-Type":"application/json"},
				body: JSON.stringify({
					id:id, 
					password:password
				}),
			})
			.then(data => data.json())
			.then(result => {
				console.log(result);
				if(result.msg == 'NULL'){
					alert("없는 아이디입니다. 다시 확인하여주세요");
					return;
				}else if(result.msg == 'LOCK'){
					alert("접근이 제한된 아이디입니다. 관리자에게 문의해주세요");
					return;
				}else if(result.msg == 'SUCCESS'){
					location.href="./login.do";
				}else if (result.msg == 'SUCCESSADMIN'){
					location.href="./loginAdmin.do";
				}else if(result.msg == 'FAIL'){
					alert("비밀번호를 다시 확인하여주세요");
					location.reload();
				}
			});
		}
	</script>
</body>
</html>