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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 상세정보</h1>
				<form>
					<div class="container-xl px-4 mt-4">
						<div class="row">
							<div class="col-xl-4" style="width: 60%; margin: 0 auto;">
								<div class="card mb-4 mb-xl-0">
									<div class="card-header">${vo.name}</div>
									<div class="card-body text-center">
										<c:if test="${vo.profile eq null && vo.gender eq 'F'}">
											<img class="img-account-profile rounded-circle mb-2" id="preview"
												src="assets/img/illustrations/profiles/profile-1.png" alt="프로필사진" width="160px;"/>
										</c:if>
										<c:if test="${vo.profile eq null && vo.gender eq 'M'}">
											<img class="img-account-profile rounded-circle mb-2" id="preview"
												src="assets/img/illustrations/profiles/profile-2.png" alt="프로필사진" width="160px;"/>
										</c:if>
										<c:if test="${vo.profile ne null}">
											<img class="img-account-profile rounded-circle mb-2" id="preview"
												src="data:image/png;base64,${vo.profile}" alt="프로필사진" width="160px;"/>
										</c:if>
										<div id="modifyProfile" style="display: none;">
											<div class="small font-italic text-muted mb-4">500KB 이하의 이미지만 가능합니다</div>
											<label class="btn btn-primary" for="profile">사진올리기</label>
											<input type="file" id="profile" name="profile" accept="image/*" onchange="profileUpload(this)" style="display:none"/>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-8" style="width: 100%; margin: 10px auto;">
								<div class="card mb-4">
									<div class="card-header">${vo.id}</div>
									<div class="card-body">
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="name">이름*</label>
												<input class="form-control" id="name" name="name" placeholder="이름" value="${vo.name}" disabled="disabled">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="dept">부서*</label>
												<div class="datatable-dropdown">
													<c:forEach var="dept" items="${deptList}" varStatus="vs">
														<c:if test="${dept.deptno eq vo.deptno}">
															<input class="form-control" id="hidden_deptno" value="${dept.dname}" disabled="disabled">
														</c:if>
													</c:forEach>
													<select class="datatable-selector" name="deptno" id="deptno" style="display: none;">
														<c:forEach var="dept" items="${deptList}" varStatus="vs">
															<option value="${dept.deptno}">${dept.dname}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="spot">직위*</label>
												<div class="datatable-dropdown">
												<input class="form-control" id="hidden_spot" value="${vo.spot}" disabled="disabled">
													<select class="datatable-selector" name="spot" id="spot" style="display: none;">
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
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="etype">근무형태*</label>
												<div class="datatable-dropdown">
													<input class="form-control" id="hidden_etype" value="${vo.etype eq 'A' ? '정규직' : '비정규직'}" disabled="disabled">
													<select class="datatable-selector" name="etype" id="etype" style="display: none;">
														<option value="A" selected="selected">정규직</option>
														<option value="B">비정규직</option>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="gender">성별</label>
												<div class="datatable-dropdown">
													<input class="form-control" value="${vo.gender eq 'F' ? '여성' : '남성'}" disabled="disabled">
													<select class="datatable-selector" name="gender" id="gender" style="display: none">
														<option value="M" selected="selected">남성</option>
														<option value="F">여성</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="email">이메일*</label>
												<input class="form-control" id="email" name="email" placeholder="이메일" value="${vo.email}" disabled="disabled">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="address">주소</label>
												<input class="form-control" id="address" name="address" placeholder="주소" value="${vo.address}" disabled="disabled">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="phone">전화번호*</label>
												<input class="form-control" id="phone" name="phone" placeholder="전화번호 ex)01012345678" maxlength="11" value="${vo.phone}" disabled="disabled">
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="birthday">생년월일</label>
												<fmt:parseDate value="${vo.birthday}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtBirthday"/>
												<input class="form-control" value="<fmt:formatDate value="${fmtBirthday}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="join_day">입사일*</label>
												<fmt:parseDate value="${vo.join_day}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtJoinDay"/>
												<input class="form-control" id="hidden_join_day" value="<fmt:formatDate value="${fmtJoinDay}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
												<div id="join_day" style="display: none;">
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
											<div class="col-md-6">
												<label class="small mb-1" for="join_day">퇴사일</label>
												<fmt:parseDate value="${vo.exit_day}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtExitDay"/>
												<input id="hidden_exit_day" class="form-control" value="<fmt:formatDate value="${fmtExitDay}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
												<div id="exit_day" style="display: none;">
													<div class="input-group input-group-joined"
														style="width: 14.5rem;">
														<span class="input-group-text" id="litepickerSpan">
															<i data-feather="calendar"></i>
														</span> <input class="form-control ps-0"
															id="litepickerDate" name="exit_day"
															placeholder="YYYY-MM-DD" />
													</div>
												</div>
											</div>
										</div>
										<p style="font-size: 7px; position:absolute; right: 20px;">* 필수입력사항입니다.</p>
										
										<c:if test="${vo.estatus eq 'N'}">
											<button class="btn btn-danger" type="button" id="checkExitDayBtn" onclick="checkExitEmployee('N')">퇴사일 수정</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateExitDayBtn" onclick="updateExitDay('${vo.id}')">수정 완료</button>
										</c:if>
										<c:if test="${vo.estatus eq 'Y'}">
											<button class="btn btn-primary" type="button" id="employeeModifyBtn" onclick="checkModifyEmployee()">수정</button>
											<button class="btn btn-danger" type="button" id="employeeExitBtn" onclick="checkExitEmployee('Y')">퇴사</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateEmployeeBtn" onclick="updateEmployee('${vo.id}')">수정 완료</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateExitBtn" onclick="updateExit('${vo.id}')">퇴사 결정</button>
										</c:if>
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
	<script type="text/javascript" charset="UTF-8" src="js/emp_ljw/emp.js"></script>
	<script>
    window.addEventListener('DOMContentLoaded', event => {

    const litepickerSingleDate = document.getElementById('litepickerSingleDate');
    const litepicker = document.getElementById('litepicker');
    const litepickerDate = document.getElementById('litepickerDate');
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
    if (litepickerDate) {
	    new Litepicker({
		    element: litepickerDate,
		    format: 'YYYY-MM-DD'
		});
	}
});
</script>
</body>
</html>