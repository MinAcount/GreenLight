<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>
	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
			<h1 style="margin-bottom: 70px; text-align: center;">비밀번호 변경</h1>
				<div class="row">
                            <div class="col-lg-6" style="margin: 0 auto;">
                                <!-- Change password card-->
                                <div class="card mb-6">
                                    <div class="card-header">새로운 비밀번호</div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="currentPassword">기존 비밀번호</label>
                                                <input class="form-control" id="currentPassword" type="password" placeholder="기존 비밀번호를 입력해주세요">
                                                <i data-feather="eye" class="openEye" style="position: absolute; top:30%; left:90%;" onclick="openPassword('0')"></i>
                                                <i data-feather="eye-off" class="closeEye" style="position: absolute; top:30%; left:90%; display: none;" onclick="closePassword('0')"></i>
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="newPassword">새로운 비밀번호</label>
                                                <input class="form-control col-sm-8" id="newPassword" type="password" placeholder="새로운 비밀번호를 입력해주세요">
                                                <i data-feather="eye" class="openEye" style="position: absolute; top:51%; left:90%;" onclick="openPassword('1')"></i>
                                                <i data-feather="eye-off" class="closeEye" style="position: absolute; top:51%; left:90%; display: none;" onclick="closePassword('1')"></i>
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="confirmPassword">새로운 비밀번호 확인</label>
                                                <input class="form-control" id="confirmPassword" type="password" placeholder="새로운 비밀번호를 한 번 더 입력해주세요">
                                                <i data-feather="eye" class="openEye" style="position: absolute; top:71%; left:90%;" onclick="openPassword('2')"></i>
                                                <i data-feather="eye-off" class="closeEye" style="position: absolute; top:71%; left:90%; display: none;" onclick="closePassword('2')"></i>
                                            </div>
                                            <button class="btn btn-primary" type="button" onclick="modifyPassword()">변경 완료</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
				<%@ include file="./include/footer.jsp"%>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/emp_ljw/emp.js"></script>
</body>
</html>