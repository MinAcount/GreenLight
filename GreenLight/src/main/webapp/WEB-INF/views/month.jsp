<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="./css/cal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-bJQN0gRBAFlqVcFrj2k/9+JMe50VnT8i8FDEQoiR8tRckCeTV6UKGq6vtsbgndnOnvKEtLcctzN7K0s9Jko9w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.fc-toolbar-chunk {
	
}
</style>
</head>
<body class="nav-fixed">
	<%@ include file="./include/mainHeader.jsp"%>
	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav" style="display: flex;">
		<%@ include file="./include/mainSidenav.jsp"%>
		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content" style="flex: 1;">
			<div id="main_content" class="row" style="height: 100%;">
				<!-- 왼쪽 콘텐츠(사이드바) -->
				<div id="left_nav" style="flex: 2;">
					<nav class="sidenav shadow-right sidenav-light"
						style="padding: 30px;">
						<h2>캘린더</h2>
						<div class="sidenav-menu">
							<div class="mb-2" style="width: 100%; padding-bottom: 30px;">
								<button class="btn btn-primary w-100" id="insertSchedule">일정등록</button>
							</div>
							<div>
								<p>📆내 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck1"> <span class="form-check-label"
										for="exampleCheck1">내 일정(기본)</span>
								</div>
							</div>
							<div style="padding-top: 30px;">
								<p>📆관심 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck4"> <span class="form-check-label"
										for="exampleCheck4">내 일정(이지원)</span>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck5"> <span class="form-check-label"
										for="exampleCheck5">내 일정(김태민)</span>
								</div>
								<p style="color: grey">+ 관심 캘린더 추가</p>
							</div>
							<hr>
							<div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck6"> <span class="form-check-label"
										for="exampleCheck6">전사일정</span>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck7"> <span class="form-check-label"
										for="exampleCheck7">${dname} 일정</span>
								</div>
							</div>
						</div>
					</nav>
				</div>
				<!-- 오른쪽 콘텐츠 -->
				<div id="main-right" style="flex: 8;"
					class="sidenav shadow-right sidenav-light">
					<div id="addSchedule"></div>
				</div>
				<%@ include file="./include/footer.jsp"%>
			</div>
		</div>
		<!-- 등록 모달 -->
		<div class="modal fade" id="scheduelModal" tabindex="-1"
			aria-labelledby="scheduelModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-md">
				<div class="modal-content border-0"
					style="padding: 20px; overflow-y: hidden;">
					<div class="modal-header">
						<h5 class="modal-title" id="scheduelModalLabel">일정등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="./insertSchedule.do" method="post" id="scheduelForm">
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">색상</span> <select id="color"
										name="color" class="form-control" style="flex: 3;">
										<option value="red">빨간색</option>
										<option value="blue">파란색</option>
										<option value="green">초록색</option>
										<option value="yellow">노란색</option>
									</select>
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">캘린더</span> <select id="label_name"
										name="label_name" class="form-control" style="flex: 3;"
										value="">
										<option value="My">내 일정(기본)</option>
										<option value="${dname}">${dname}일정</option>
									</select>
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">제목</span> <input type="text" id="title"
										name="title" class="form-control" placeholder="제목"
										style="flex: 3;" value="">
								</div>
								<!-- 								<div style="display: flex; gap: 10px; align-items: center;"> -->
								<!-- 									<span style="flex: 1;">시작일</span>  -->
								<!-- 									<input type="date" id="start_date" name="start_date" required style="flex: 1.14; margin-bottom: 0px;">  -->
								<!-- 									<input type="time" id="start_time" name="start_time" style="flex: 1.14; margin-bottom: 0px;" required> -->
								<!-- 									<div class="form-check"> -->
								<!-- 										<input type="checkbox" id="allDay" name="allDay" value="종일" class="form-check-input" onchange="toggleTimeSelection(this)" style="margin-bottom: 0px;">  -->
								<!-- 										<label for="allDay" class="form-check-label" style="margin-bottom: 0px;">종일</label> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<!-- 								<div style="display: flex; gap: 10px; align-items: center;"> -->
								<!-- 									<span style="flex: 1;">종료일</span>  -->
								<!-- 									<input type="date" id="end_date" name="end_date" required style="flex: 1.14; margin-bottom: 0px;"  value="">  -->
								<!-- 									<input type="time" id="end_time" name="end_time" style="flex: 1.14; margin-bottom: 0px;" required  value=""> -->
								<!-- 									<div class="form-check"> -->
								<!-- 										<input type="checkbox" id="recur" name="recur" value="Y" class="form-check-input" style="margin-bottom: 0px;"> -->
								<!-- 										<span for="recur" class="form-check-label" style="margin-bottom: 0px;">반복</span> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">기간</span> <input type="text"
										id="daterangepicker" name="daterangepicker"
										class="form-control" style="flex: 3;"> <input
										type="hidden" id="start_date" name="start_date"
										class="form-control" style="flex: 3;"> <input
										type="hidden" id="end_date" name="end_date"
										class="form-control" style="flex: 3;">
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<div class="form-check">
										<input type="checkbox" id="allDay" name="allDay" value="종일"
											class="form-check-input" onchange="toggleTimeSelection(this)"
											style="margin-bottom: 0px;"> <span for="allDay"
											class="form-check-label" style="margin-bottom: 0px;">종일</span>
									</div>
									<div class="form-check">
										<input type="checkbox" id="recur" name="recur" value="Y"
											class="form-check-input" style="margin-bottom: 0px;">
										<span for="recur" class="form-check-label"
											style="margin-bottom: 0px;">반복</span>
									</div>
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">참여자</span> <input type="text"
										id="participants" name="participants" class="form-control"
										placeholder="참여자 선택" style="flex: 3;">
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">위치</span> <input type="text"
										id="location" name="location" class="form-control"
										placeholder="위치" style="flex: 1.5;" value=""> <input
										type="button" id="reserveRoom" name="reserveRoom"
										class="form-control" value="회의실 예약" style="flex: 1;">
								</div>
							</div>
							<div class="form-group" style="padding-top: 20px;">
								<span for="memo">메모</span>
								<textarea class="form-control" rows="5" id="memo" name="memo"
									placeholder="메모를 입력하세요"></textarea>
							</div>
							<div>
								<a href="#" id="basicCalendarToggle">기본캘린더</a>
							</div>
							<div id="basicCalendarDetails">
								<div style="display: flex; flex-direction: column; gap: 10px;">
									<div style="display: flex; gap: 10px; align-items: center;">
										<span style="flex: 1;">카테고리</span> <select id="category"
											name="category" class="form-control" style="flex: 3;">
											<c:forEach var="common" items="${commList}" varStatus="vs">
												<c:if test="${common.type == '카테고리'}">
													<option value="${common.code}">${common.code_name}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div style="display: flex; gap: 10px; align-items: center;">
										<span style="flex: 1;">우선순위</span> <select id="priority"
											name="priority" class="form-control" style="flex: 3;">
											<c:forEach var="common" items="${commList}" varStatus="vs">
												<c:if test="${common.type == '일정우선순위'}">
													<option value="${common.code}">${common.code_name}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div style="display: flex; gap: 10px; align-items: center;">
										<span style="flex: 1;">공개여부</span> <select id="visibility"
											name="visibility" class="form-control" style="flex: 3;">
											<option value="Y">전체공개</option>
											<option value="N">비공개</option>
										</select>
									</div>
									<div style="display: flex; gap: 10px; align-items: center;">
										<span style="flex: 1;">수정권한</span> <select id="permission"
											name="permission" class="form-control" style="flex: 3;">
											<option value="Y">수정가능</option>
											<option value="R">읽기</option>
										</select>
									</div>
									<div style="display: flex; gap: 10px; align-items: center;">
										<span style="flex: 1;">알람</span> <select id="alarm"
											name="alarm" class="form-control" style="flex: 3;">
											<c:forEach var="common" items="${commList}" varStatus="vs">
												<c:if test="${common.type == '일정알람시간'}">
													<option value="${common.code}">${common.code_name}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="addScheduleHandler()">추가</button>
					</div>
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<div id="detailVieweModal"></div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="js/scripts.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
		<script type="text/javascript" src="js/cal.js"></script>
		<script type="text/javascript" src="js/datatime.js"></script>
</body>
</html>
