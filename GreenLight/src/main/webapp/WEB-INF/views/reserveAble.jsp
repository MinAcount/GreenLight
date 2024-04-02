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
									<th style="width: 20%;">장소</th>
									<td style="width: 30%;"><select name="conferenceRoom"
										class="form-control" style="width: 100%;">
											<option value="">-- 선택 안함 --</option>
											<!-- Default option -->
											<c:forEach var="conf" items="${confLists}">
												<option value="${conf.cname}">${conf.cname}</option>
											</c:forEach>
									</select></td>
									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>층</th>
									<td style="width: 30%;"><select name="floor"
										class="form-control" style="width: 100%;">
											<fmt:parseNumber var="maxHo" type="number"
												value="${confLists[0].ho.substring(0, 1)}" />
											<c:forEach var="i" begin="1" end="${maxHo}">
												<option value="${i}">${i}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th style="width: 20%;"><span style="color: red;">*&nbsp;</span>사용시간</th>
									<td style="width: 30%;"><select name="floor"
										class="form-control" style="width: 100%;">
											<c:forEach var="hour" begin="9" end="19" step="2">
												<option value="<c:out value='${hour}' />:00">
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
					<div style="display: flex; align-items: center; justify-content: center;">
					    <div id="navigation">
					        <button class="btn btn-outline-primary" id="prevMonthBtn" style="padding: 10px;"><i class="fa-solid fa-chevron-left"></i></button>
					        <div id="currentYearMonth" style="text-align: center; padding: 30px;"></div>
					        <div id="calendar" class="calendar" style="text-align: center; width: 700px;"></div>
					        <button class="btn btn-outline-primary" id="nextMonthBtn" style="padding: 10px;"><i class="fa-solid fa-chevron-right"></i></button>
					    </div>
					</div>
					
					<div id="selectedDate"></div>
					<div>
						<p>예약 가능 회의실 수 : ${fn:length(lists)} 개</p>
					</div>
					<div>
						<table class="datatable-table">
							<thead>
								<tr style="background-color: #f6f6f6; width: 100%;">
									<th style="width: 10%; text-align: center;">번호</th>
									<th style="width: 30%; text-align: center;">회의실명</th>
									<th style="width: 20%; text-align: center;">최대수용인원</th>
									<th style="width: 20%; text-align: center;">호수</th>
									<th style="width: 20%; text-align: center;"></th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<c:if test="${empty lists}">
									<tr style="height: 400px;">
										<td colspan="5" style="text-align: center"
											onmouseover="return false">예약 가능 회의실이 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${not empty lists}">
									<td style="text-align: center;"><c:forEach var="index"
											begin="1" end="${fn:length(lists)}">
									        ${index}
									    </c:forEach></td>
									<c:forEach var="vo" items="${lists}" varStatus="vs">
										<tr>
											<td style="text-align: center;">${vo.conferenceVo.capacity}</td>
											<td style="text-align: center;">${vo.conferenceVo.ho}</td>
											<td style="text-align: center;">${vo.conferenceVo.ho}</td>
											<td style="text-align: center;">${vo.conferenceVo.ho}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

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
	<script src="js/reserve.js"></script>
</body>
</html>
