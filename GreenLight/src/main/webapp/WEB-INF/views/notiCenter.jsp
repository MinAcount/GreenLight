<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	.form-control:focus, .datatable-input:focus {
	  color: #69707a;
	  box-shadow: 0 0 0 0.25rem rgba(46, 125, 50, 0.2);
	}
</style>
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
				<h1 style="margin-bottom: 70px; text-align: center;">알림 센터</h1>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
					<div style="display: flex; flex-direction: row;">
						<div class="datatable-dropdown">
							<select class="datatable-selector">
								<option value="5" selected="selected">5</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="50">50</option>
							</select>
						</div>
					</div>
				</div>
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatablesSimple">
						<thead>
							<tr>
								<th></th>
								<th>알림종류</th>
								<th>발신자</th>
								<th>제목</th>
								<th>내용</th>
								<th>수신시간</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach items="${allNoti}" var="noti" varStatus="vs">
								<c:if test="${noti.read eq 'N'}">
									<tr style="font-weight: 500; color: #000;" onclick="openNoti('${noti.gubun}','${noti.ntype}', '${noti.noti_id}')">
										<td>${vs.count}</td>
										<td>${noti.comVo.code_name}</td>
										<td>${noti.sender}</td>
										<td style="max-width : 10rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${fn:split(noti.content, '[\\[\\]]')[0]}</td>
										<td style="max-width : 15rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" data-bs-toggle="tooltip" data-bs-placement="top" title="${noti.content}">${noti.content}</td>
										<fmt:parseDate value="${noti.alert_time}" pattern="yyyy-MM-dd HH:mm:ss" var="fmtNotiDate" />
										<td><fmt:formatDate value="${fmtNotiDate}" pattern = "yyyy-MM-dd HH:ss"/></td>
									</tr>
								</c:if>
								<c:if test="${noti.read eq 'Y'}">
									<tr style="font-weight: 100;" onclick="openNoti('${noti.gubun}','${noti.ntype}', '${noti.noti_id}')">
										<td>${vs.count}</td>
										<td>${noti.comVo.code_name}</td>
										<td>${noti.sender}</td>
										<td style="max-width : 10rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${fn:split(noti.content, '[\\[\\]]')[0]}</td>
										<td style="max-width : 15rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" data-bs-toggle="tooltip" data-bs-placement="top" title="${noti.content}">${noti.content}</td>
										<fmt:parseDate value="${noti.alert_time}" pattern="yyyy-MM-dd HH:mm:ss" var="fmtNotiDate" />
										<td><fmt:formatDate value="${fmtNotiDate}" pattern = "yyyy-MM-dd HH:ss"/></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
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
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
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
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables/datatables-simple-demo.js"></script>
</body>
</html>