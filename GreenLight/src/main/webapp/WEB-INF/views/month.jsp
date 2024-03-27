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
								<button class="btn btn-primary w-100" onclick="insertSchedule()" data-bs-target="#addScheduleModal">일정등록</button>
							</div>
							<div>
								<p>📆내 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">휴가</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck2"> <label class="form-check-label"
										for="exampleCheck2">회의</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck3"> <label class="form-check-label"
										for="exampleCheck3">워크숍</label>
								</div>
							</div>
							<div style="padding-top: 30px;">
								<p>📆관심 캘린더</p>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck4"> <label class="form-check-label"
										for="exampleCheck4">이지원</label>
								</div>
								<div class="mb-2" style="padding-left: 15px;">
									<input class="form-check-input" type="checkbox"
										id="exampleCheck5"> <label class="form-check-label"
										for="exampleCheck5">김태민</label>
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
										for="exampleCheck7">공지 캘린더</label>
								</div>
							</div>
						</div>
					</nav>
				</div>
				<!-- 오른쪽 콘텐츠 -->
				<div id="main-right" style="flex: 8;"
					class="sidenav shadow-right sidenav-light">
					<div id="schedule">
						<div style="display: flex; justify-content: space-between; align-items: center; margin-top: 50px; height: 60.8px;">
						    <div style="display: flex; align-items: center;">
						        <nav class="nav nav-borders">
						            <ul style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
						                <li class="nav-link active ms-0" onclick="allReserveList(${loginVo.id}); setActive(this)">월간</li>
						                <li class="nav-link" id="완료" onclick="reserveListStatus(${loginVo.id}); setActive(this)">주간</li>
						                <li class="nav-link" id="완료" onclick="reserveListStatus(${loginVo.id}); setActive(this)">일간</li>
						                <li class="nav-link" id="예정" onclick="reserveListStatus(${loginVo.id}); setActive(this)">목록</li>
						            </ul>
						        </nav>
						    </div>
						    <div style="display: flex; align-items: center;">
							    <div class="fc-toolbar-chunk" style="display: flex; align-items: center;">
							        <div id="prev"><i class="fa-solid fa-chevron-left" style="padding: 20px;"></i></div>
							        <div><h2 id="currentMonth" style="margin: 0 20px;"></h2></div>
							        <div id="next"><i class="fa-solid fa-chevron-right" style="padding: 20px;"></i></div>
							        <div><button class="btn btn-primary" style="width: 60px; height: 20px;" type="button">today</button></div>
							    </div>
							</div>
						    
						    <div style="display: flex; align-items: center;">
						        <input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width: 200px; margin-right: 15px; height: 42px;">
						    </div>
						</div>


						<div class="fc-view-harness fc-view-harness-active">
							<div class="fc-daygrid fc-dayGridMonth-view fc-view">
								<table class="fc-scrollgrid table-bordered fc-scrollgrid-liquid"
									style="width: 100%;">
									<thead>
										<tr class="fc-scrollgrid-section fc-scrollgrid-section-header">
											<td>
												<div class="fc-scroller-harness">
													<div class="fc-scroller" style="overflow: hidden;">
														<table class="fc-col-header" style="width: 100%;">
															<tbody>
																<tr>
																	<th style="width: 14.2857%; text-align: center;">Sun</th>
																	<th style="width: 14.2857%; text-align: center;">Mon</th>
																	<th style="width: 14.2857%; text-align: center;">Tue</th>
																	<th style="width: 14.2857%; text-align: center;">Wed</th>
																	<th style="width: 14.2857%; text-align: center;">Thu</th>
																	<th style="width: 14.2857%; text-align: center;">Fri</th>
																	<th style="width: 14.2857%; text-align: center;">Sat</th>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr
											class="fc-scrollgrid-section fc-scrollgrid-section-body fc-scrollgrid-section-liquid">
											<td>
												<div class="fc-scroller-harness fc-scroller-harness-liquid">
													<div class="fc-scroller fc-scroller-liquid-absolute"
														style="overflow: hidden auto;">
														<div class="fc-daygrid-body fc-daygrid-body-balanced"
															style="width: 100%;">
															<table class="fc-scrollgrid-sync-table"
																style="width: 100%; height: 864px;">
																<colgroup></colgroup>
																<tbody id="addSchedule">
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
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
