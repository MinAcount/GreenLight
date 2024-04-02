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
				<h1 style="margin-bottom: 70px; text-align: center;">나의 예약 현황</h1>
				<div style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
					<div>
						<nav class="nav nav-borders">
							<ul style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
								<li class="nav-link active ms-0" onclick="allReserveList(${loginVo.id}); setActive(this)">전체</li>
								<li class="nav-link" id="완료" onclick="reserveListStatus(${loginVo.id}); setActive(this)">완료</li>
								<li class="nav-link" id="예정" onclick="reserveListStatus(${loginVo.id}); setActive(this)">예정</li>
							</ul>
						</nav>
					</div>
					<div style="display: flex; flex-direction: row;">
						<input class="form-control" type="text" placeholder="Search..."
							aria-label="Search"
							style="width: 200px; margin-right: 15px; height: 42px;">
						<div class="datatable-dropdown">
							<select class="datatable-selector">
								<option value="oraerLeast" selected="">최근순</option>
								<option value="orderTime">시간순</option>
								<option value="orderName">이름순</option>
							</select>
						</div>
					</div>
				</div>
				<hr class="mt-0 mb-5">
				<div>
					<table class="datatable-table">
						<thead>
							<tr style="background-color: #f6f6f6; width: 100%;">
								<th style="width: 15%; text-align: center;">예약번호</th>
								<th style="width: 20%; text-align: center;">장소</th>
								<th style="width: 15%; text-align: center;">이용일</th>
								<th style="width: 30%; text-align: center;">이용시간</th>
								<th style="width: 10%; text-align: center;">상태</th>
								<th style="width: 10%; text-align: center;">취소</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<c:if test="${empty lists}">
								<tr style="height: 400px;">
									<td colspan="5" style="text-align: center"
										onmouseover="return false">예약된 목록이 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${not empty lists}">
								<c:forEach var="vo" items="${lists}" varStatus="vs">
									<tr onclick="oneReserveView('${vo.reservationVo.reserveno}')"
										onmouseover="this.style.cursor='pointer'">
										<td style="text-align: center;">${vo.reservationVo.reserveno}</td>
										<td style="text-align: center;">${vo.conferenceVo.cname}</td>
										<td style="text-align: center;">
											<fmt:formatDate value="${vo.reservationVo.reserve_date}" 
											pattern="yyyy.MM.dd" var="formattedDate" /> 
											<c:out value="${formattedDate}" />
										</td>
										<td style="text-align: center;"><fmt:formatDate
												value="${vo.reservationVo.reserve_date}" pattern="HH:mm"
												var="formattedStartDate" /> <c:out
												value="${formattedStartDate}" /> ~ <fmt:formatDate
												value="${endDate}" pattern="HH:mm" />&nbsp;(2시간)</td>
										<td style="text-align: center;" class="${vo.reservationVo.reserve_date.time > currentdate.time ? 'green-text' : ''}">
											<c:choose>
												<c:when test="${vo.reservationVo.reserve_date.time > currentdate.time}">예정</c:when>
												<c:otherwise>완료</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;" class="${vo.reservationVo.reserve_date.time > currentdate.time ? 'red-text' : ''}">
											<a href = "">
											<c:choose>
												<c:when test="${vo.reservationVo.reserve_date.time > currentdate.time}">취소</c:when>
											</c:choose>
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>

				<div style="margin-top: 50px;">
					<c:if test="${lists.size() > 10}">
						<!-- 페이징바 -->
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</c:if>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/reserve.js"></script>
</body>
</html>