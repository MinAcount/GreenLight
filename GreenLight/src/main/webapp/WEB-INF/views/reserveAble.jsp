<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
td.green-text {
	color: green;
}

td.red-text {
	color: red;
}

th, td {
	padding: 20px;
}

.calendar {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 20px;
}

.calendar-cell {
	width: 14.28%; /* 1/7 */
	padding: 5px;
	text-align: center;
	border: 1px solid #ccc;
	cursor: pointer;
}

.selected {
	background-color: #007bff;
	color: #fff;
}

#selectedDate {
	font-weight: bold;
	margin-bottom: 10px;
}

#navigation {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}
</style>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">예약 가능 회의실</h1>
				<hr class="mt-0 mb-5">
				<div>
					<div
						style="width: 70%; margin: 0 auto; border-collapse: collapse; text-align: center; border: 1px solid #ddd; display: flex; margin-bottom: 50px">
						<div style="width: 80%;">
							<table style="width: 100%;">
								<tr>
									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>장소</th>
									<td style="width: 30%;">
										<select name="locality" class="form-control" style="width: 100%;">
											<option value="본관">본관</option>
											<option value="신관">신관</option>
										</select>
									</td>
									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>층</th>
									<td style="width: 30%;">
										<select name="floor" class="form-control" style="width: 100%;">
											<c:forEach var="i" begin="1" end="5">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
								 	</td>
								</tr>
								<tr>
									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>사용시간</th>
									<td style="width: 30%;"><select name="timeslot"
										class="form-control" style="width: 100%;">
											<c:forEach var="hour" begin="9" end="19" step="2">
												<option value="${hour}">
													<c:out value='${hour}' />:00 -
													<c:out value='${hour+2}' />:00
												</option>
											</c:forEach>
									</select></td>

									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>수용인원</th>
									<td style="width: 30%;"><select name="capacity"
										class="form-control" style="width: 100%;">
											<c:set var="maxCapacity" value="0" />
											<c:forEach var="conf" items="${confLists}">
												<fmt:parseNumber var="currentCapacity" type="number"
													value="${conf.capacity}" />
												<c:if test="${currentCapacity > maxCapacity}">
													<c:set var="maxCapacity" value="${currentCapacity}" />
												</c:if>
											</c:forEach>
											<c:set var="step" value="5" />
											<c:forEach var="i" begin="10" end="${maxCapacity}"
												step="${step}">
												<option value="${i}">${i}명</option>
											</c:forEach>
									</select></td>
								</tr>
							</table>
						</div>
						<div
							style="width: 20%; display: flex; justify-content: center; align-items: center;">
							<button class="btn btn-primary" onclick="searchReserveList()">검색</button>
						</div>
					</div>
					<div
						style="display: flex; align-items: center; justify-content: center;">
						<div id="navigation" style="width: 1000px; height: 300px;">
							<button class="btn btn-outline-primary" id="prevMonthBtn"
								style="padding: 10px;">
								<i class="fa-solid fa-chevron-left"></i>
							</button>
							<div id="currentYearMonth"
								style="text-align: center; padding: 30px;"></div>
							<div id="calendar" class="calendar"
								style="text-align: center; width: 700px;"></div>
							<button class="btn btn-outline-primary" id="nextMonthBtn"
								style="padding: 10px;">
								<i class="fa-solid fa-chevron-right"></i>
							</button>
						</div>
					</div>

					<div>
						<div id="selectedDate" onload="dateClicked()"
							style="height: 10px; margin-top: 30px;"></div>
						<div>
							<p>
								예약 가능 회의실 수 : <span id="roomCount">0</span> 개
							</p>
						</div>
					</div>
					<div>
						<table class="datatable-table">
							<thead>
								<tr style="background-color: #f6f6f6; width: 100%;">
									<th style="width: 10%; text-align: center;">번호</th>
									<th style="width: 25%; text-align: center;">자산명</th>
									<th style="width: 20%; text-align: center;">최대수용인원</th>
									<th style="width: 15%; text-align: center;">장소</th>
									<th style="width: 15%; text-align: center;">호수</th>
									<th style="width: 15%; text-align: center;"></th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr style="height: 200px;">
									<td colspan="6" style="text-align: center"
										onmouseover="return false">조건 및 날짜를 선택해주세요</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>

	<!-- 예약 모달 -->
	<div class="modal fade" id="reserveFormModal" tabindex="-1"
		aria-labelledby="reserveFormModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-md custom-class">
			<div class="modal-content border-0" style="width: 500px; padding: 20px; overflow-y: hidden;">
				<div class="modal-header">
					<h5 class="modal-title" id="reserveFormModalLabel">예약하기</h5>
				</div>
				<div class="modal-body">
					<form action="./insertReserve.do" method="post" id="reserveForm">
						<div style="display: flex; flex-direction: column; gap: 10px;">
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">회의실</span> <input type="text" id="cname"
										name="cname" class="form-control"
										style="flex: 3; border: none;" readonly>
								</div>
							</div>
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">예약일</span> <input type="text"
										id="reserve_day" name="reserve_day" class="form-control"
										style="flex: 3; border: none;" readonly>
								</div>
							</div>
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">예약시간</span> <input type="text" id="time"
										class="form-control" style="flex: 3; border: none;" readonly>
								</div>
							</div>
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">예약자</span> <input type="text"
										class="form-control" style="flex: 3; border: none;"
										value="${loginVo.name}" readonly>
								</div>
							</div>
							<div style="display: flex; flex-direction: column; gap: 10px;">
								<div style="display: flex; gap: 10px; align-items: center;">
									<span style="flex: 1;">회의목적</span> <input type="text"
										id="meetingtitle" name="meetingtitle" class="form-control"
										placeholder="회의 목적" style="flex: 3;" value="">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="addReserveHandler">예약하기</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/reserve.js"></script>
</body>
</html>