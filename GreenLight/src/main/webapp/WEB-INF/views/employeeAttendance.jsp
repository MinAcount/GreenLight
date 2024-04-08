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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 근태조회</h1>
								<input type="hidden" id="hiddenMonth" value="${month}">
				<h2><input type="month" style="border: 0" id="MM" value="${month}"  onchange="updateMonth()"></h2>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatablesSimple">
						<thead>
							<tr style="width: 100%;">
								<th></th>
								<th>사원번호</th>
								<th>부서</th>
								<th>이름</th>
								<th>직위</th>
								<th>직책</th>
								<th>누적근무시간</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${lists}" varStatus="vs">
								<tr onclick="location.href='./employeeAttDetails.do?id=${vo.id}&in_date=${month}'">
									<td style="text-align: center;">${vs.count}</td>
									<td>${vo.id}</td>
									<c:forEach var="dVo" items="${dlists}">
										<c:if test="${dVo.deptno eq vo.empVo.deptno}">
											<td>${dVo.dname}</td>
										</c:if>
									</c:forEach>
									<td>${vo.empVo.name}</td>
									<c:forEach var="eVo" items="${elists}">
										<c:if test="${eVo.id eq vo.empVo.id}">
											<td>${eVo.spot}</td>
										</c:if>
									</c:forEach>
									<c:forEach var="eVo" items="${elists}">
										<c:if test="${eVo.id eq vo.empVo.id}">
											<td>${eVo.position != null ? eVo.position : '-'}</td>
										</c:if>
									</c:forEach>
									<td>${vo.total_working_hours} 시간</td>
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
			<script type="text/javascript">
function updateMonth(){
	var hiddenMonth = document.getElementById('hiddenMonth').value;
	var selectMonth = document.getElementById('MM').value;
	var encodedMonth = encodeURIComponent(selectMonth);
	var dateYear = new Date().getFullYear();
	var dateMonth = new Date().getMonth()+1;
	if(new Date(selectMonth) > new Date()){
		alert("현재보다 나중 날짜는 선택할 수 없습니다");
		console.log(dateYear+"-"+dateMonth)
		document.getElementById('MM').value = hiddenMonth;
		return false;
	}
	window.location.href='./employeeAttendance.do?in_date='+encodedMonth;
}
	</script>
</body>
</html>