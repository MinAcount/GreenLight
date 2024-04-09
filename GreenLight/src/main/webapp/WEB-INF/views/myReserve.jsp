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

.modal { -
	-bs-modal-width: 400px;
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
				<hr class="mt-0 mb-5">
				<div>
					<div>
						<table class="datatable-table">
							<thead>
								<tr style="background-color: #f6f6f6; width: 100%;">
									<th style="width: 15%; text-align: center;">예약번호</th>
									<th style="width: 20%; text-align: center;">장소</th>
									<th style="width: 15%; text-align: center;">이용일</th>
									<th style="width: 15%; text-align: center;">이용시간</th>
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
										<tr>
											<td style="text-align: center;"><a
												onclick="oneReserveView('${vo.reservationVo.reserveno}')"
												onmouseover="this.style.cursor='pointer'">${vo.reservationVo.reserveno}</a></td>
											<td style="text-align: center;">${vo.conferenceVo.cname}</td>
											<td style="text-align: center;"><fmt:formatDate
													value="${vo.reservationVo.reserve_date}"
													pattern="yyyy.MM.dd" var="formattedDate" /> <c:out
													value="${formattedDate}" /></td>
											<td style="text-align: center;"><fmt:formatDate
													value="${vo.reservationVo.reserve_date}" pattern="HH:mm"
													var="formattedStartDate" /> <c:out
													value="${formattedStartDate}" /> ~ <fmt:formatDate
													value="${endDate}" pattern="HH:mm" /></td>
											<td style="text-align: center;"
												class="${vo.reservationVo.reserve_date.time > currentdate.time ? 'green-text' : ''}">
												<c:choose>
													<c:when
														test="${vo.reservationVo.reserve_date.time > currentdate.time}">예정</c:when>
													<c:otherwise>완료</c:otherwise>
												</c:choose>
											</td>
											<td style="text-align: center;"><c:choose>
													<c:when
														test="${vo.reservationVo.reserve_date.time > currentdate.time}">
														<button class="btn btn-outline-danger"
															onclick="showConfirmationModal('${vo.reservationVo.reserveno}')"
															style="width: 70px; height: 35px;">취소</button>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

<!-- 					<div style="margin-top: 50px;"> -->
<%-- 						<c:if test="${lists.size() > 10}"> --%>
<!-- 							페이징바 -->
<!-- 							<nav aria-label="Page navigation example"> -->
<!-- 								<ul class="pagination pagination justify-content-center"> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
<!-- 											<span class="sr-only">Previous</span> -->
<!-- 									</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
<!-- 											<span class="sr-only">Next</span> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<%-- 						</c:if> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<h3 style="margin: 20px;">예정된 예약</h3> -->
<!-- 					<div> -->
<!-- 						<table class="datatable-table"> -->
<!-- 							<thead> -->
<!-- 								<tr style="background-color: #f6f6f6; width: 100%;"> -->
<!-- 									<th style="width: 15%; text-align: center;">예약번호</th> -->
<!-- 									<th style="width: 20%; text-align: center;">장소</th> -->
<!-- 									<th style="width: 15%; text-align: center;">이용일</th> -->
<!-- 									<th style="width: 15%; text-align: center;">이용시간</th> -->
<!-- 									<th style="width: 10%; text-align: center;">상태</th> -->
<!-- 									<th style="width: 10%; text-align: center;">취소</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody id="tableBody"> -->
<%-- 								<c:if test="${empty lists}"> --%>
<!-- 									<tr style="height: 400px;"> -->
<!-- 										<td colspan="5" style="text-align: center" -->
<!-- 											onmouseover="return false">예약된 목록이 없습니다</td> -->
<!-- 									</tr> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${not empty lists}"> --%>
<%-- 									<c:forEach var="vo" items="${lists}" varStatus="vs"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when --%>
<%-- 												test="${vo.reservationVo.reserve_date.time > currentdate.time}"> --%>
<!-- 												<tr> -->
<!-- 													<td style="text-align: center;"><a -->
<%-- 														onclick="oneReserveView('${vo.reservationVo.reserveno}')" --%>
<%-- 														onmouseover="this.style.cursor='pointer'">${vo.reservationVo.reserveno}</a></td> --%>
<%-- 													<td style="text-align: center;">${vo.conferenceVo.cname}</td> --%>
<%-- 													<td style="text-align: center;"><fmt:formatDate --%>
<%-- 															value="${vo.reservationVo.reserve_date}" --%>
<%-- 															pattern="yyyy.MM.dd" var="formattedDate" /> <c:out --%>
<%-- 															value="${formattedDate}" /></td> --%>
<%-- 													<td style="text-align: center;"><fmt:formatDate --%>
<%-- 															value="${vo.reservationVo.reserve_date}" pattern="HH:mm" --%>
<%-- 															var="formattedStartDate" /> <c:out --%>
<%-- 															value="${formattedStartDate}" /> ~ <fmt:formatDate --%>
<%-- 															value="${endDate}" pattern="HH:mm" /></td> --%>
<!-- 													<td style="text-align: center;" -->
<%-- 														class="${vo.reservationVo.reserve_date.time > currentdate.time ? 'green-text' : ''}"> --%>
<%-- 														<c:choose> --%>
<%-- 															<c:when --%>
<%-- 																test="${vo.reservationVo.reserve_date.time > currentdate.time}">예정</c:when> --%>
<%-- 															<c:otherwise>완료</c:otherwise> --%>
<%-- 														</c:choose> --%>
<!-- 													</td> -->
<!-- 													<td style="text-align: center;"> -->
<!-- 														<button class="btn btn-outline-danger" -->
<%-- 															onclick="deleteMyReserve('${vo.reservationVo.reserveno}')" --%>
<!-- 															style="width: 70px; height: 35px;">취소</button> -->
<!-- 													</td> -->
<!-- 												</tr> -->
<%-- 											</c:when> --%>
<%-- 										</c:choose> --%>
<%-- 									</c:forEach> --%>
<%-- 								</c:if> --%>
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->

<!-- 					<div style="margin-top: 50px;"> -->
<%-- 						<c:if test="${lists.size() > 10}"> --%>
<!-- 							페이징바 -->
<!-- 							<nav aria-label="Page navigation example"> -->
<!-- 								<ul class="pagination pagination justify-content-center"> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
<!-- 											<span class="sr-only">Previous</span> -->
<!-- 									</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
<!-- 											<span class="sr-only">Next</span> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<%-- 						</c:if> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<h3 style="margin: 20px;">완료된 예약</h3> -->
<!-- 					<div> -->
<!-- 						<table class="datatable-table"> -->
<!-- 							<thead> -->
<!-- 								<tr style="background-color: #f6f6f6; width: 100%;"> -->
<!-- 									<th style="width: 20%; text-align: center;">예약번호</th> -->
<!-- 									<th style="width: 20%; text-align: center;">자산</th> -->
<!-- 									<th style="width: 15%; text-align: center;">이용일</th> -->
<!-- 									<th style="width: 20%; text-align: center;">이용시간</th> -->
<!-- 									<th style="width: 10%; text-align: center;">상태</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody id="tableBody"> -->
<%-- 								<c:if test="${empty lists}"> --%>
<!-- 									<tr style="height: 400px;"> -->
<!-- 										<td colspan="5" style="text-align: center" -->
<!-- 											onmouseover="return false">예약된 목록이 없습니다</td> -->
<!-- 									</tr> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${not empty lists}"> --%>
<%-- 									<c:forEach var="vo" items="${lists}" varStatus="vs"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when --%>
<%-- 												test="${vo.reservationVo.reserve_date.time < currentdate.time}"> --%>
<!-- 												<tr> -->
<!-- 													<td style="text-align: center;"><a -->
<%-- 														onclick="oneReserveView('${vo.reservationVo.reserveno}')" --%>
<%-- 														onmouseover="this.style.cursor='pointer'">${vo.reservationVo.reserveno}</a></td> --%>
<%-- 													<td style="text-align: center;">${vo.conferenceVo.cname}</td> --%>
<%-- 													<td style="text-align: center;"><fmt:formatDate --%>
<%-- 															value="${vo.reservationVo.reserve_date}" --%>
<%-- 															pattern="yyyy.MM.dd" var="formattedDate" /> <c:out --%>
<%-- 															value="${formattedDate}" /></td> --%>
<%-- 													<td style="text-align: center;"><fmt:formatDate --%>
<%-- 															value="${vo.reservationVo.reserve_date}" pattern="HH:mm" --%>
<%-- 															var="formattedStartDate" /> <c:out --%>
<%-- 															value="${formattedStartDate}" /> ~ <fmt:formatDate --%>
<%-- 															value="${endDate}" pattern="HH:mm" /></td> --%>
<!-- 													<td style="text-align: center;" -->
<%-- 														class="${vo.reservationVo.reserve_date.time > currentdate.time ? 'green-text' : ''}"> --%>
<%-- 														<c:choose> --%>
<%-- 															<c:when --%>
<%-- 																test="${vo.reservationVo.reserve_date.time > currentdate.time}">예정</c:when> --%>
<%-- 															<c:otherwise>완료</c:otherwise> --%>
<%-- 														</c:choose> --%>
<!-- 													</td> -->
<!-- 												</tr> -->
<%-- 											</c:when> --%>
<%-- 										</c:choose> --%>
<%-- 									</c:forEach> --%>
<%-- 								</c:if> --%>
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->

<!-- 					<div style="margin-top: 50px;"> -->
<%-- 						<c:if test="${lists.size() > 10}"> --%>
<!-- 							페이징바 -->
<!-- 							<nav aria-label="Page navigation example"> -->
<!-- 								<ul class="pagination pagination justify-content-center"> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
<!-- 											<span class="sr-only">Previous</span> -->
<!-- 									</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!-- 									<li class="page-item"><a class="page-link" href="#" -->
<!-- 										aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
<!-- 											<span class="sr-only">Next</span> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<%-- 						</c:if> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<!-- 취소 모달 -->
	<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered custom-class">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-body" style="padding: 30px">
					<p class="text-center" style="margin-top: 40px; margin-bottom: 40px;">정말 취소하시겠습니까?</p>
					<div class="text-center" style="margin-top: 20px; margin-bottom: 20px;">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">닫기</button>
						<button type="button" class="btn btn-danger" onclick="deleteReserve()" style="width: 100px;">예약취소</button>
					</div>
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