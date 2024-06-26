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
				<div class="mb-3" style="position: relative;">
					<input class="form-control" id="password" name="password" type="password" placeholder="비밀번호 입력">
					<p id="capsLockChk" style="display: none;">CapsLock 켜짐</p>
				</div>


				<!-- 로그인 박스-->
				<div
					class="d-flex align-items-center justify-content-between mt-4 mb-0">
					<button class="btn btn-primary" type="button" onclick="loginSubmit()">로그인</button>
				</div>
			</form>
		</div>
	</div>
<!-- 	<div class="modal modal-backdrop" style="display: none;" data-bs-backdrop="static backdrop" -->
<!-- 		id="loginDangerAlert"> -->
<!-- 		<div class="modal-dialog alertModal"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header text-danger"> -->
<!-- 					<div class="modal-title" id="exampleModalLabel"> -->
<!-- 						<i data-feather="alert-circle" id="toastFeather"></i> <strong -->
<!-- 							class="me-auto" id="modalTitle">로그인 실패</strong> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div id="modalContent" style="padding: 15px;"> -->
<!-- 						아이디 혹은 비밀번호를 다시 확인해주세요.<br/> -->
<!-- 						5회이상 틀릴 경우 해당 아이디의 로그인이 제한됩니다. -->
<!-- 						(<span id="fail"></span>/5) -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button id="returnLoginBtn" style="margin-left: 10px;" class="btn btn-danger" -->
<!-- 							type="button">확인</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript">
		var password = document.getElementById("password");
		var id = document.getElementById("id");
		id.addEventListener("keyup", function (event) {
		      if (event.keyCode === 13) {
		        event.preventDefault();
		        loginSubmit();
		      }
		    });
		password.addEventListener("keyup", function (event) {
	      if (event.keyCode === 13) {
	        event.preventDefault();
	        loginSubmit();
	      }
	    });
		password.addEventListener("keydown", function (event) {
			const capsLockOn = event.getModifierState && event.getModifierState("CapsLock");
			if(capsLockOn){
				document.getElementById("capsLockChk").style = "display:block; color:red; font-size:10px; position:absolute; top:14px; right:14px;";
			}else{
				document.getElementById("capsLockChk").style.display = "none";
			}
		});
		function loginSubmit() {
			var id = document.getElementById("id").value;
			var password = document.getElementById("password").value;
			
			if(id == "" || password == ""){
				alert("아이디와 비밀번호를 입력해주세요.");
// 				document.querySelector("#modalContent").innerText = "아이디와 비밀번호를 입력해주세요.";
// 				document.querySelector("#loginDangerAlert").style.display = "block";
// 				document.querySelector("#returnLoginBtn" ).addEventListener("click", function(){
// 					document.querySelector("#loginDangerAlert").style.display = "none";
// 					document.getElementById("id").value = "";
// 					document.getElementById("password").value = "";
// 				})
				document.getElementById("id").value = "";
				document.getElementById("password").value = "";
				return;
			}else{
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
// 						document.querySelector("#modalContent").innerText = "없는 아이디입니다. 다시 확인하여주세요";
// 						document.querySelector("#loginDangerAlert").style.display = "block";
// 						document.querySelector("#returnLoginBtn" ).addEventListener("click", function(){
// 							document.querySelector("#loginDangerAlert").style.display = "none";
// 							document.getElementById("id").value = "";
// 							document.getElementById("password").value = "";
// 						})
						document.getElementById("id").value = "";
						document.getElementById("password").value = "";
						return;
					}else if(result.msg == 'LOCK'){
						alert("접근이 제한된 아이디입니다. 관리자에게 문의해주세요");
// 						document.querySelector("#modalContent").innerText = "접근이 제한된 아이디입니다. 관리자에게 문의해주세요";
// 						document.querySelector("#loginDangerAlert").style.display = "block";
// 						document.querySelector("#returnLoginBtn" ).addEventListener("click", function(){
// 							document.querySelector("#loginDangerAlert").style.display = "none";
// 						})
						return;
					}else if(result.msg == 'SUCCESS'){
						location.href="./main.do";
					}else if (result.msg == 'SUCCESSADMIN'){
						location.href="./admin.do";
					}else{
						alert("아이디 혹은 비밀번호를 다시 확인해주세요.\n5회이상 틀릴 경우 해당 아이디의 로그인이 제한됩니다.("+result.msg+"/5)");
// 						document.getElementById("fail").innerText = result.msg;
// 						document.querySelector("#loginDangerAlert").style.display = "block";
// 						document.querySelector("#returnLoginBtn").addEventListener("click", function(){
// 							document.querySelector("#loginDangerAlert").style.display = "none";
// 							document.getElementById("password").value = "";
// 						})
						document.getElementById("password").value = "";
					}
				});
			}
		}
	</script>
</body>
</html>