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

		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
			<c:if test="${list.estatus eq 'Y'}">
				<c:set var="count" value="${count + 1}" />
			</c:if>
		</c:forEach>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">직원 추가</h1>
				<div class="container-xl px-4 mt-4">
					<div class="row" >
						<div class="col-xl-4" style="width: 60%; margin: 0 auto;">
							<!-- Profile picture card-->
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">프로필 사진</div>
								<div class="card-body text-center">
									<img class="img-account-profile rounded-circle mb-2"
										src="assets/img/illustrations/profiles/profile-2.png" alt="" />
									<div class="small font-italic text-muted mb-4">5MB 이하의
										이미지만 가능합니다</div>
									<button class="btn btn-primary" type="button">사진 올리기</button>
								</div>
							</div>
						</div>
						<div class="col-xl-8">
							<!-- Account details card-->
							<div class="card mb-4">
								<div class="card-header">Account Details</div>
								<div class="card-body">
									<form>
										<!-- Form Group (username)-->
										<div class="mb-3">
											<label class="small mb-1" for="inputUsername">Username
												(how your name will appear to other users on the site)</label> <input
												class="form-control" id="inputUsername" type="text"
												placeholder="Enter your username" value="username" />
										</div>
										<!-- Form Row-->
										<div class="row gx-3 mb-3">
											<!-- Form Group (first name)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputFirstName">First
													name</label> <input class="form-control" id="inputFirstName"
													type="text" placeholder="Enter your first name"
													value="Valerie" />
											</div>
											<!-- Form Group (last name)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputLastName">Last
													name</label> <input class="form-control" id="inputLastName"
													type="text" placeholder="Enter your last name" value="Luna" />
											</div>
										</div>
										<!-- Form Row        -->
										<div class="row gx-3 mb-3">
											<!-- Form Group (organization name)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputOrgName">Organization
													name</label> <input class="form-control" id="inputOrgName"
													type="text" placeholder="Enter your organization name"
													value="Start Bootstrap" />
											</div>
											<!-- Form Group (location)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputLocation">Location</label>
												<input class="form-control" id="inputLocation" type="text"
													placeholder="Enter your location" value="San Francisco, CA" />
											</div>
										</div>
										<!-- Form Group (email address)-->
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">Email
												address</label> <input class="form-control" id="inputEmailAddress"
												type="email" placeholder="Enter your email address"
												value="name@example.com" />
										</div>
										<!-- Form Row-->
										<div class="row gx-3 mb-3">
											<!-- Form Group (phone number)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputPhone">Phone
													number</label> <input class="form-control" id="inputPhone"
													type="tel" placeholder="Enter your phone number"
													value="555-123-4567" />
											</div>
											<!-- Form Group (birthday)-->
											<div class="col-md-6">
												<label class="small mb-1" for="inputBirthday">Birthday</label>
												<input class="form-control" id="inputBirthday" type="text"
													name="birthday" placeholder="Enter your birthday"
													value="06/10/1988" />
											</div>
										</div>
										<button class="btn btn-primary" type="button">등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>


</body>
</html>