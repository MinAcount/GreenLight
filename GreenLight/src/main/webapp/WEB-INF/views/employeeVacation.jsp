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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 휴가조회</h1>
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
								<th>No.</th>
								<th>사원번호</th>
								<th>부서</th>
								<th>이름</th>
								<th>총연차일수</th>
								<th>총사용일수</th>
								<th>잔여휴가일수</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${lists}" varStatus="vs">
								<tr onclick="location.href='./employeeVacDetails.do?id=${vo.empVo.id}&in_date=${month}'">
									<td style="text-align: center;">${vs.count}</td>
									<td>${vo.empVo.id}</td>
									<td>${vo.deptVo.dname}</td>
									<td>${vo.empVo.name}</td>
									<td>${vo.empVo.leave}</td>
									<td>${vo.used_leave}</td>
									<td>${vo.remaining_leave}</td>
							</c:forEach>
						</tbody>
					</table>
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
	window.location.href='./employeeVacation.do?in_date='+encodedMonth;
}
	
	</script>
</body>
</html>