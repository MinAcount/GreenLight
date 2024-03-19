<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 추가</h1>
				<form action="./employeeAdd.do" method="post">
					<div class="container-xl px-4 mt-4">
						<div class="row">
							<div class="col-xl-4" style="width: 60%; margin: 0 auto;">
								<div class="card mb-4 mb-xl-0">
									<div class="card-header">프로필 사진</div>
									<div class="card-body text-center">
										<img class="img-account-profile rounded-circle mb-2"
											src="assets/img/illustrations/profiles/profile-2.png" alt=""/>
										<div class="small font-italic text-muted mb-4">5MB 이하의 이미지만 가능합니다</div>
										<button class="btn btn-primary" type="button" onclick="profileUpload()">사진 올리기</button>
									</div>
								</div>
							</div>
							<div class="col-xl-8" style="width: 100%; margin: 10px auto;">
								<div class="card mb-4">
									<div class="card-header">직원정보</div>
									<div class="card-body">
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="name">이름</label>
												<input class="form-control" id="name" name="name" placeholder="이름">
											</div>
											<div class="col-md-6">
												<label class="control-label col-sm-2" for="gender">성별</label>
												<div class="datatable-dropdown">
													<select class="datatable-selector" name="gender">
														<option value="M" selected="selected">남성</option>
														<option value="F">여성</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="dept">부서</label>
												<div class="datatable-dropdown">
													<select class="datatable-selector" name="deptno">
														<c:forEach var="dept" items="${deptList}" varStatus="vs">
															<option value="${dept.deptno}">${dept.dname}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<label class="control-label col-sm-2" for="join_day">입사일</label>
												<div class="input-group input-group-joined"
													style="width: 14.5rem;">
													<span class="input-group-text" id="litepickerSpan">
														<i data-feather="calendar"></i>
													</span> <input class="form-control ps-0"
														id="litepickerSingleDate" name="join_day"
														placeholder="YYYY-MM-DD" />
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="spot">직위</label>
												<div class="datatable-dropdown">
													<select class="datatable-selector" name="spot">
														<option value="01" selected="selected">사원</option>
														<option value="02">주임</option>
														<option value="03">대리</option>
														<option value="04">과장</option>
														<option value="05">차장</option>
														<option value="06">부장</option>
														<option value="07">이사</option>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<label class="control-label col-sm-6" for="etype">근무형태</label>
												<div class="datatable-dropdown">
													<select class="datatable-selector" name="etype">
														<option value="A" selected="selected">정규직</option>
														<option value="B">비정규직</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="email">이메일</label>
												<input class="form-control" id="email" name="email" placeholder="이메일">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="address">주소</label>
												<input class="form-control" id="address" name="address" placeholder="주소">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="phone">전화번호</label>
												<input class="form-control" id="phone" name="phone" placeholder="전화번호 ex)01012345678" maxlength="11">
											</div>
											<div class="col-md-6">
												<label class="control-label col-sm-6" for="birthday">생년월일</label>
												<div class="input-group input-group-joined"
													style="width: 14.5rem;">
													<span class="input-group-text" id="litepickerSpan">
														<i data-feather="calendar"></i>
													</span> <input class="form-control ps-0"
														id="litepicker" name="birthday"
														placeholder="YYYY-MM-DD" />
												</div>
											</div>
										</div>
										<button class="btn btn-primary" type="submit">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script>
    window.addEventListener('DOMContentLoaded', event => {

    const litepickerSingleDate = document.getElementById('litepickerSingleDate');
    const litepicker = document.getElementById('litepicker');
    if (litepickerSingleDate) {
	    new Litepicker({
		    element: litepickerSingleDate,
		    format: 'YYYY-MM-DD'
		});
	}
    if (litepicker) {
	    new Litepicker({
		    element: litepicker,
		    format: 'YYYY-MM-DD'
		});
	}
});

</script>


</body>
</html>