<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="./css/styles.css">
<link rel="stylesheet" type="text/css" href="./css/cal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-bJQN0gRBAFlqVcFrj2k/9+JMe50VnT8i8FDEQoiR8tRckCeTV6UKGq6vtsbgndnOnvKEtLcctzN7K0s9Jko9w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<style>
.btn-custom {
	
}
</style>
</head>
<body class="nav-fixed">
	<%@ include file="./include/mainHeader.jsp"%>
	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav" style="display: flex;">
		<%@ include file="./include/mainSidenav.jsp"%>
		<!-- 콘텐츠 영역 -->
		<input type="hidden" value="${loginVo.id}" id="loginId"> <input
			type="hidden" value="${loginVo.name}" id="loginName">
		<div id="layoutSidenav_content" style="flex: 1;">
			<div id="main_content" class="row" style="height: 130%;">
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
								<div class="mb-2 checkbox-container">
									<input class="form-check-input checkbox-input" type="checkbox"
										id="basicCheck" value="기본일정" onchange="updateFilter()" checked>
									<span class="form-check-label checkbox-input">내 일정(기본)</span> <input
										id="circle" type="button" name="basicCheck"
										class="checkbox-input" style="background-color: #ade3e5;"
										readonly>
								</div>
								<div class="mb-2 checkbox-container">
									<input class="form-check-input checkbox-input" type="checkbox"
										id="vacationCheck" value="휴가" onchange="updateFilter()"
										checked> <span class="form-check-label checkbox-input">휴가</span>
									<input id="circle" type="button" name="vacationCheck"
										class="checkbox-input" style="background-color: #bad9a1;"
										readonly>
								</div>
								<div class="mb-2" style="padding-left: 15px; padding-top: 15px;">
									<a style="color: grey" href="#">+ 내 캘린더 추가</a>
								</div>
							</div>
							<!-- 							<div style="padding-top: 30px;"> -->
							<!-- 								<p>📆관심 캘린더</p> -->
							<!-- 								<div class="mb-2 checkbox-container"> -->
							<!-- 									<input class="form-check-input checkbox-input" type="checkbox" id="interestCheck" value="이지원" onchange="updateFilter()">  -->
							<!-- 									<span class="form-check-label checkbox-input" for="interestCheck">내 일정(이지원)</span> -->
							<!-- 									<input id="circle" type="button" name="basicCheck" class="checkbox-input" style="background-color: #bad9a1;" readonly> -->
							<!-- 								</div> -->
							<!-- 								<div class="mb-2 checkbox-container"> -->
							<!-- 									<input class="form-check-input checkbox-input" type="checkbox"id="interestCheck" value="김태민" onchange="updateFilter()">  -->
							<!-- 									<span class="form-check-label checkbox-input" for="interestCheck">내 일정(김태민)</span> -->
							<!-- 									<input id="circle" type="button" name="basicCheck" class="checkbox-input" style="background-color: #c7c2f2;" readonly> -->
							<!-- 								</div> -->
							<!-- 								<div class="mb-2" style="padding-left: 15px; padding-top: 15px;"> -->
							<!-- 									<a style="color: grey" href="#">+ 관심 캘린더 추가</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<hr>
							<div>
								<div class="mb-2 checkbox-container">
									<input class="form-check-input checkbox-input" type="checkbox"
										id="compenyCheck" value="전사일정" onchange="updateFilter()"
										checked> <span class="form-check-label checkbox-input"
										for="compenyCheck">전사일정</span> <input id="circle"
										type="button" name="compenyCheck" class="checkbox-input"
										style="background-color: #f0e0ad;" readonly>
								</div>
								<div class="mb-2 checkbox-container">
									<input class="form-check-input checkbox-input" type="checkbox"
										id="deptCheck" value="${dname}일정" onchange="updateFilter()"
										checked> <span class="form-check-label checkbox-input"
										for="deptCheck">${dname} 일정</span> <input id="circle"
										type="button" name="deptCheck" class="checkbox-input"
										style="background-color: #f5d4e3;" readonly>
								</div>
							</div>
						</div>
					</nav>
				</div>
				<!-- 오른쪽 콘텐츠 -->
				<div id="main-right" style="flex: 8;"
					class="sidenav shadow-right sidenav-light">
					<div id="addSchedule" style="padding: 20px;"></div>
				</div>
				<%@ include file="./include/footer.jsp"%>
			</div>
		</div>
		<!-- 등록 모달 -->
		<div class="modal fade" id="scheduelModal" tabindex="-1"
			aria-labelledby="scheduelModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-md custom-class">
				<div class="modal-content border-0"
					style="width: 700px; padding: 20px; overflow-y: hidden;">
					<div class="modal-header">
						<h5 class="modal-title" id="scheduelModalLabel">일정등록</h5>
					</div>
					<div class="modal-body">
						<form action="./insertSchedule.do" method="post" id="scheduelForm">
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">캘린더</span> <select id="label_name"
										name="label_name" class="form-control" style="flex: 3;"
										value="">
										<option value="기본일정">내 일정(기본)</option>
										<option value="휴가">휴가</option>
										<option value="${dname}일정">${dname}일정</option>
										<option value="전사일정">전사일정</option>
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
								<input type="hidden" id="allDay" name="allDay" value="종일"
									class="form-check-input" onchange="toggleTimeSelection(this)"
									style="margin-bottom: 0px;"> <input type="hidden"
									id="recur" name="recur" value="Y" class="form-check-input"
									style="margin-bottom: 0px;">
								<!-- 								<div style="display: flex; gap: 10px; align-items: center;"> -->
								<!-- 									<span style="flex: 1;"></span>  -->
								<!-- 									<div class="form-check" style="flex: 1.5;"> -->
								<!-- 										<input type="checkbox" id="allDay" name="allDay" value="종일" -->
								<!-- 											class="form-check-input" onchange="toggleTimeSelection(this)" -->
								<!-- 											style="margin-bottom: 0px;"> <span for="allDay" -->
								<!-- 											class="form-check-label" style="margin-bottom: 0px;">종일</span> -->
								<!-- 									</div> -->
								<!-- 									<div class="form-check" style="flex: 1.5;"> -->
								<!-- 										<input type="checkbox" id="recur" name="recur" value="Y" -->
								<!-- 											class="form-check-input" style="margin-bottom: 0px;"> -->
								<!-- 										<span for="recur" class="form-check-label" -->
								<!-- 											style="margin-bottom: 0px;">반복</span> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">참여자</span>
									<button id="participantsModal" class="form-control"
										type="button" data-bs-toggle="modal"
										data-bs-target="#partModal" style="flex: 3;">참여자 선택</button>
									<input type="hidden" id="participants" name="participants[]"
										class="form-control">
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;"></span> <span id="partShow"
										style="flex: 3;"></span>
								</div>
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">위치</span> <input type="text"
										id="location" name="location" class="form-control"
										placeholder="위치" style="flex: 1.7;" value=""> <input
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
								<a href="#" id="basicCalendarToggle" style="font-size: 20px;">추가정보</a>
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
											<option value="Y">공개</option>
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
							data-bs-dismiss="modal" onclick="resetModal()">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="addScheduleHandler()">등록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- jstree 모달 -->
		<div
			style="display: flex; flex-direction: row; justify-content: space-between;">
			<div class="modal fade" id="partModal" tabindex="-1"
				aria-labelledby="partModalLabel" aria-hidden="true"
				data-bs-backdrop="static">
				<div class="modal-dialog jstreeModal">
					<div class="modal-content" style="width: 800px; height: 630px;">
						<div class="modal-header">
							<h5 class="modal-title" id="partModalLabel">참여자 선택</h5>
						</div>
						<div class="modal-body"
							style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
							<div class="toast-body"
								style="display: flex; flex-direction: row; justify-content: space-around; border: none;">
								<!-- 참조자들(js tree) -->
								<div id="part_sel"
									style="width: 300px; min-height: 450px; padding: 10px;"
									class="form-control">
									<div id="search_box">
										<input class="form-control" id="search_input" type="text"
											placeholder="검색">
									</div>
									<div id="partTree"
										style="margin-top: 10px; border: none; width: 100%; max-height: 390px; overflow-y: scroll;"></div>
								</div>
								<div style="width: 50px; text-align: center;">
									<button id="addPeople" class="form-control"
										style="width: 30px; height: 100px; margin-top: 180px; padding-left: 10px; padding-right: 10px;">
										<i class="fa-solid fa-caret-right"></i>
									</button>
								</div>
								<!-- 선택된 참조자들 -->
								<div class="form-control" id="people_chk"
									style="width: 300px; min-height: 450px; padding-top: 30px;"></div>
							</div>
							<div class="modal-footer"
								style="margin-bottom: 20px; margin-top: 10px;">
								<input type="button" class="btn btn-danger" value="초기화"
									onclick="partClean()">
								<button class="btn btn-secondary " type="button"
									data-bs-dismiss="modal" onclick="partCancel()">취소</button>
								<button data-bs-dismiss="modal" onclick="partDone()"
									class="btn btn-primary " type="button"
									style="margin-left: 10px;">선택완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세 일정 모달 -->
	<div id="detailVieweModal"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
	<script type="text/javascript" src="js/cal.js"></script>
	<script type="text/javascript" src="js/jstree/schedule_jstree.js"></script>
	<script type="text/javascript" src="js/datatime.js"></script>
</body>
</html>