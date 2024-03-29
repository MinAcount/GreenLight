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
			<h1 style="margin-bottom: 70px; text-align: center;">마이 페이지</h1>
				<div class="row">
					<div class="col-xl-4">
						<div class="card mb-4 mb-xl-0">
							<div class="card-header">프로필 사진</div>
							<div class="card-body text-center">
							<c:if test="${empVo.profile eq null && empVo.gender eq 'F'}">
								<img class="img-account-profile rounded-circle mb-2"
									src="assets/img/illustrations/profiles/profile-1.png" alt="프로필사진" />
							</c:if>
							<c:if test="${empVo.profile eq null && empVo.gender eq 'M'}">
								<img class="img-account-profile rounded-circle mb-2"
									src="assets/img/illustrations/profiles/profile-2.png" alt="프로필사진" />
							</c:if>
							<c:if test="${empVo.profile ne null}">
								<img class="img-account-profile rounded-circle mb-2"
									src="data:image/png;base64,${empVo.profile}" alt="프로필사진" />
							</c:if>
							</div>
						</div>
					</div>
					<div class="col-xl-8">
						<div class="card mb-4">
							<div class="card-header">${empVo.name}님의정보</div>
							<div class="card-body">
								<label class="control-label col-sm-3" for="id">사원번호</label> ${empVo.id}<br/> <br/>
								<label class="control-label col-sm-3" for="dept">부서</label>
								<c:forEach items="${list}" var="dept">
									<c:if test="${dept.deptno eq empVo.deptno}"> ${dept.dname}<br/><br/></c:if>
								</c:forEach>
								<label class="control-label col-sm-3" for="spot">직위</label> ${empVo.spot}<br/><br/>
								<c:if test="${empVo.position ne null}">
									<label class="control-label col-sm-3" for="position">직책</label> ${empVo.position}<br/><br/>
								</c:if>
								<label class="control-label col-sm-3" for="email">이메일</label> ${empVo.email}<br/><br/>
								<label class="control-label col-sm-3" for="address">주소</label> ${empVo.address}<br/><br/>
								<label class="control-label col-sm-3" for="phone">전화번호</label> ${empVo.phone}<br/><br/>
								<label class="control-label col-sm-3" for="join_day">입사일</label>
								<fmt:parseDate value="${empVo.join_day}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtJoinDay"/>
								<fmt:formatDate value="${fmtJoinDay}" pattern = "yyyy년MM월dd일"/><br/><br/>
								<button class="btn btn-primary" type="button" onclick="location.href='./modifyPassword.do'">비밀번호 변경</button>
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
</body>
</html>