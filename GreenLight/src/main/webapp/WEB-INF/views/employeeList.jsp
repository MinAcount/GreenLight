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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 전체 정보</h1>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
					<div>
						<nav class="nav nav-borders">
							<ul id="selectEstatus"
								style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
								<li class="nav-link active ms-0"
									onclick="selectByStatus('A'); setActive(this)" value="A">전체(${fn:length(list)})</li>
								<li class="nav-link"
									onclick="selectByStatus('Y'); setActive(this)" value="Y">재직중(${count})</li>
								<li class="nav-link"
									onclick="selectByStatus('N'); setActive(this)" value="N">퇴사자(${fn:length(list) - count})</li>
							</ul>
						</nav>

					</div>
<!-- 					<form> -->
						<div style="display: flex; flex-direction: row;">
								<div class="datatable-dropdown">
									<select class="datatable-selector" id="searchOpt">
										<option value="name" selected="selected">이름</option>
										<option value="dept">부서</option>
									</select>
								</div>
								<div class="datatable-search">
									<input class="datatable-input" placeholder="Search..."
										type="search" title="Search within table"
										aria-controls="datatablesSimple" id="keyword" onkeypress="searchEmployee(event)">
								</div>
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
<!-- 					</form> -->
				</div>
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatablesSimple">
						<thead>
							<tr style="width: 100%;">
								<th style="width: 5%;"></th>
								<th style="width: 9%;">사원번호</th>
								<th style="width: 20%;">부서</th>
								<th style="width: 15%;">이름</th>
								<th style="width: 10%;">직위</th>
								<th style="width: 10%;">직책</th>
								<th style="width: 15%;">재직상태</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${list}" varStatus="vs">
								<tr onclick="location.href='./employeeOne.do?id=${vo.id}'">
									<td style="text-align: center;">${vs.count}</td>
									<td>${vo.id}</td>
									<c:forEach var="deptVo" items="${deptList}">
										<c:if test="${deptVo.deptno eq vo.deptno}">
											<td>${deptVo.dname}</td>
										</c:if>
									</c:forEach>
									<td>${vo.name}</td>
									<td>${vo.spot}</td>
									<c:if test="${vo.position != null}">
										<td>${vo.position}</td>
									</c:if>
									<c:if test="${vo.position == null}">
										<td>-</td>
									</c:if>
									<c:if test="${vo.estatus eq 'Y'}">
										<td>재직중</td>
									</c:if>
									<c:if test="${vo.estatus eq 'N'}">
										<td>퇴사</td>
									</c:if>
								</tr>
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
	<script src="js/emp_ljw/emp.js"></script>
</body>
</html>