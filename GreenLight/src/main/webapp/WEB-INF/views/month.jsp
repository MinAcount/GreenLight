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
								<button class="btn btn-primary w-100" onclick="insertSchedule()"
									id="addScheduleModal">일정등록</button>
							</div>
							<div>
								<p>📆내 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">내 일정(기본)</label>
								</div>
							</div>
							<div style="padding-top: 30px;">
								<p>📆관심 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck4"> <label class="form-check-label"
										for="exampleCheck4">내 일정(이지원)</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck5"> <label class="form-check-label"
										for="exampleCheck5">내 일정(김태민)</label>
								</div>
								<p style="color: grey">+ 관심 캘린더 추가</p>
							</div>
							<hr>
							<div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck6"> <label class="form-check-label"
										for="exampleCheck6">전사일정</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck7"> <label class="form-check-label"
										for="exampleCheck7">인사팀 일정</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck8"> <label class="form-check-label"
										for="exampleCheck8">기술영업팀 일정</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck8"> <label class="form-check-label"
										for="exampleCheck8">내부개발팀 일정</label>
								</div>
							</div>
						</div>
					</nav>
				</div>
				<!-- 오른쪽 콘텐츠 -->
				<div id="main-right" style="flex: 8;"
					class="sidenav shadow-right sidenav-light">
					<div id="addSchedule">
					</div>
				</div>
				<%@ include file="./include/footer.jsp"%>
			</div>
		</div>
		<!-- 등록 모달 -->
		<div class="modal fade" id="calendarModal" tabindex="-1"
			aria-labelledby="calendarModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-md">
				<div class="modal-content border-0" style="padding: 20px;">
					<div class="modal-header">
						<h5 class="modal-title" id="calendarModalLabel">일정등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="./insertSchedule.do" method="post" id="form">
							<div class="input-group input-group-joined">
								<span class="input-group-text"><i data-feather="calendar"></i></span>
								<input type="date" name="start_date" id="start_date" value=""
									class="form-control" />
							</div>
							<div class="input-group input-group-joined">
								<span class="input-group-text"><i data-feather="calendar"></i></span>
								<input type="date" name="end_date" id="end_date" value=""
									class="form-control" />
							</div>
							<div class="input-group input-group-joined">
								<span class="input-group-text"><i data-feather="clock"></i></span>
								<input type="time" id="start_time" name="start_time" value=""
									class="form-control" />
							</div>
							<div class="input-group input-group-joined">
								<span class="input-group-text"><i data-feather="clock"></i></span>
								<input type="time" id="end_time" name="end_time" value=""
									class="form-control" />
							</div>
							<div class="form-check">
								<input type="checkbox" id="allDay" name="allDay" value="종일"
									class="form-check-input"> <label for="allDay"
									class="form-check-label">종일</label>
							</div>
							<div class="form-group">
								<select id="groupid" name="groupid" class="form-control">
									<option value="개인일정">내 일정(기본)</option>
									<option value="부서일정">업무 일정</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" id="title" name="title" class="form-control"
									placeholder="제목을 입력하세요">
							</div>
							<div class="row align-items-center mb-3">
								<div class="col-sm-6">
									<div class="input-group">
										<input type="text" name="start" id="start" readonly="readonly"
											ondblclick="return false" class="form-control"
											placeholder="시작일"> <span class="input-group-addon"
											id="imagebutton"><i
											class="glyphicon glyphicon-calendar"></i></span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="input-group">
										<input type="text" name="end" id="end" readonly="readonly"
											class="form-control" placeholder="종료일"> <span
											class="input-group-addon" id="imagebutton2"><i
											class="glyphicon glyphicon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<input type="text" id="repeat" name="repeat"
									class="form-control" placeholder="반복여부">
							</div>
							<div>
								<a href="#">참여자 추가</a>
							</div>
							<div>
								<a href="#">위치 추가</a>
							</div>
							<div class="form-group">
								<textarea class="form-control" rows="5" id="content"
									name="content" placeholder="설명 추가"></textarea>
							</div>
							<div>
								<a href="#" id="basicCalendarToggle">기본캘린더</a>
							</div>
							<div id="basicCalendarDetails" style="display: none;">
								<div class="form-group">
									<input type="text" id="priority" name="priority"
										class="form-control" placeholder="우선순위">
								</div>
								<div class="form-group">
									<input type="text" id="public" name="public"
										class="form-control" placeholder="공개여부">
								</div>
								<div class="form-group">
									<input type="text" id="modifyPermission"
										name="modifyPermission" class="form-control"
										placeholder="수정권한">
								</div>
								<div class="form-group">
									<input type="text" id="alarm" name="alarm" class="form-control"
										placeholder="알람">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="addCalendar">추가</button>
					</div>
				</div>
			</div>
		</div>

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
